#!/bin/bash

#Everything should be implemented and working (except for in the tests somehow)

set -ueo pipefail

die() {
    local exit_code="$1"
    shift

    echo "[gallery.sh] Fatal error:" "$@" >&2
    exit "${exit_code}"
}

debug_msg() {
    echo "[gallery.sh $(date '+%Y-%m-%d %H:%M:%S' || true )]" "$@" >&2
}



# Extract image name from a given filename
get_name_from_image() {
    basename "$1" .jpg | tr -cd 'a-zA-Z0-9 .-_'
}

# Prints parameters as a JSON dictionary (no nesting).
# Expects parameter pairs, e.g.
# print_simple_json_dictionary key1 "value 1" key2 "value 2"
#
# Does not handle special characters
print_simple_json_dictionary() {
    echo '{'
    while [ $# -gt 0 ]; do
        echo " \"$1\": \"$2\""
        echo ,
        shift 2
    done | sed '$d'
    echo '}'
}

# Get list of albums.
# We make the names well-behaving: we want to copy them to a webserver
# and spaces and other special characters do not mix that well with URLs.
# Hence we skip anything that does not look like a valid directory name.
get_album_list() {
    find albums \
        -mindepth 1 \
        -maxdepth 1 \
        -iregex '.*/[-a-zA-Z0-9_.]+' \
        -type d \
        -exec basename {} \; \
        | sort
}

# Prepare images for one album: copy them to public_html and ensure
# they are named correctly.
prepare_images_for_one_album() {

    local album_dir="$1"
    local source_dir="$2"
    local dest_dir="$3"
    local title="${album_dir}"
    local thumbnail_size="${thumbnail_size:-$4}"
    local front_image_def="$( ls ${source_dir}/*.jpg | head -n1 )"
    local front_image="${front_image_def}"

    #sourcing album.rc instructions: title, front_image
    #shellcheck source=./album.rc
    if [ -f "${source_dir}/album.rc" ]; then 
        . "${source_dir}/album.rc"
    fi
    
    #if front_image was specified in album.rc, we want to keep it, else we want to change it to default

    if [ "${front_image}" != "${front_image_def}" ]
    then
        local front_image="${source_dir}/${front_image}"
    fi 

    ${debug} "Preparing images for album ${album_dir} (${title})."

    #if dest_dir not empty, remove contents
    if [ -d "${dest_dir}" ]; then
        rm -r "${dest_dir}"
    fi

    mkdir -p "${dest_dir}"
    (
        echo '{'
        printf '"title": "%s",\n' "${title}"
        echo '"images": ['
    ) >"${dest_dir}/.details"

    echo "${album_dir} front.jpg ${title}" >"${dest_dir}/.meta"

    find "${source_dir}" -type f -iname '*.jpg' -print0 | sort -z | (
        counter=1
        while IFS='' read -r -d $'\0' source_image; do
            #getting date_time from exif, if there is none, non will be displayed
            #identify -verbose "${source_image}"
            dt=$( convert "${source_image}" -format "%[EXIF:DateTimeOriginal]" info: ) 
            
            date_time="${dt:-}"
            
            dest_image="$( printf "%08d.jpg" "${counter}" )"
            cp -f "${source_image}" "${dest_dir}/${dest_image}"
            convert "${source_image}" -resize "${thumbnail_size}" "${dest_dir}/thumb.${dest_image}"
            thumb_image="thumb.${dest_image}"
            thumb_width=$( identify "${dest_dir}/${thumb_image}" | cut -d ' ' -f 3 | cut -d 'x' -f 1 )
            thumb_height=$( identify "${dest_dir}/${thumb_image}" | cut -d ' ' -f 3 | cut -d 'x' -f 2 )
            image_name="$( get_name_from_image "${source_image}" )"
            (
                print_simple_json_dictionary \
                    "filename" "${dest_image}" \
                    "thumbnail" "${thumb_image}" \
                    "thumb_width" "${thumb_width}" \
                    "thumb_height" "${thumb_height}" \
                    "name" "${image_name}" \
                    "date_time" "${date_time}"

                echo ','
            ) >>"${dest_dir}/.details"

            counter=$(( counter + 1 ))
        done
    )
    sed -e '$s/.*/]}/' "${dest_dir}/.details" | "${json_reformat}" >"${dest_dir}/.details.json"
    rm -f "${dest_dir}/.details"
    convert "${front_image}" -resize "${thumbnail_size}" "${dest_dir}/front.jpg"
}

# Setup debugging
if "${debug:-false}"; then
    debug=debug_msg
else
    debug=:
fi

# Check tool availability
json_reformat="$( command -v json_reformat || echo "cat" )"
${debug} "Will use ${json_reformat} for reformatting JSON data."

pandoc="$( command -v pandoc || true )"
[ -z "${pandoc}" ] && die 1 "pandoc executable not found, cannot continue."
${debug} "Found Pandoc executable at ${pandoc}."


# Setup path to template files (replace the following with something like
# /usr/local/share/nswi177-gallery when installing system wide).
data_files_dir="${data_files_dir:-}"
if [ -z "${data_files_dir}" ]; then
    data_files_dir="$( dirname "$( realpath "${BASH_SOURCE[0]}" )" )"
fi
${debug} "Loading data files from ${data_files_dir}"

#optional parameters setup
opts_short="d:t:"
opts_long="publish-dir:,theme-dir:"
getopt -Q -o "${opts_short}" -l "${opts_long}" -- "$@" || exit 1 
eval set -- "$( getopt -o "${opts_short}" -l "${opts_long}" -- "$@" )"

while [ $# -gt 0 ]; do
    #destination folder marked as an optional parameter
    case "$1" in
        -d|--publish-dir)
            dest="$2"
            shift
            ;;
        -t|--theme-dir)
            theme="$2"
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Unknown option $1" >&2
            exit 1
            ;;
    esac
    shift   
done

# Load global configuration, if available
if [ -f gallery.rc ]; then
    . gallery.rc
fi
# Default configuration values
site_title="${site_title:-My photo gallery}"


# Get list of albums (see get_album_list to understand why this is
# safe to be used in for loops).
if ! [ -d "albums" ]; then
    die 2 "No albums/ directory found."
fi
albums="$( get_album_list )"
${debug} "Found albums: $( echo "${albums}" | paste -s -d ' ' )."

#We want to make sense of some options we got from getopt or sourcing gallery.sh 
#publish dir support, public_html is default
publish_dir="${publish_dir:-}"
dest="${dest:-${publish_dir}}" #there's nothing in dest from getopt
dest="${dest:-public_html}" #there's nothing in dest from getopt nor gallery.rc

#theme_dir support
theme_dir="${theme_dir:-}"
theme_dir="${theme:-$theme_dir}" #there is a theme_dir address from -t or from gallery.rc
theme_dir="${theme_dir:-$data_files_dir}" #or we use the default data_files_dir

#thumbnail size comes either from gallery.rc or is defaulted to 200x200
thumbnail_size="${thumbnail_size:-200x200}"
# Prepare images for each album first
# We do not prepare the HTML pages yet as we have not yet discovered all
# the albums and we do not have their meta information (that might be
# needed for menu, for example).
for album in ${albums}; do
    prepare_images_for_one_album "${album}" "albums/${album}" "${dest}/${album}" "${thumbnail_size}"
done


# Create meta JSON for the whole site. This meta file is then added to
# each generated page so that each album page can create global menu of
# albums etc.
${debug} "Preparing global meta JSON file."
cat "${dest}"/*/.meta | (
    echo '{'
    echo '  "site": {'
    printf '    "title": "%s",\n' "${site_title}"
    echo '    "albums": ['
    while read -r album_dir album_front_image album_title; do
        thumb_width=$( identify "${dest}/${album_dir}/${album_front_image}" | cut -d ' ' -f 3 | cut -d 'x' -f 1 )
        thumb_height=$( identify "${dest}/${album_dir}/${album_front_image}" | cut -d ' ' -f 3 | cut -d 'x' -f 2 )
        print_simple_json_dictionary \
            "dir" "${album_dir}" \
            "title" "${album_title}" \
            "image" "${album_front_image}" \
            "thumb_width" "${thumb_width}" \
            "thumb_height" "${thumb_height}"
        echo ','
    done
) | sed -e '$s/.*/]}}/' | "${json_reformat}" >"${dest}"/.meta.json

# Generate the actual HTML page for each album. Notice that we pass
# two metadata files so that we allow album.tpl.html access both
# information about the current album as well as the overview information
# about the whole site.
for album in ${albums}; do
    ${debug} "Generating HTML page for album ${album}."
    ( cat "albums/${album}/HEADER.md" 2>/dev/null || true ) \
        | "${pandoc}" \
            --template "${theme_dir}/album.tpl.html" \
            --metadata-file="${dest}/${album}/.details.json" \
            --metadata-file="${dest}/.meta.json" \
            >"${dest}/${album}/index.html"
done

# Generate the index page. This one needs only the overview meta information
${debug} "Generating index page."
( cat HEADER.md 2>/dev/null || true ) \
    | "${pandoc}" \
            --template "${theme_dir}/index.tpl.html" \
            --metadata-file="${dest}/.meta.json" \
            --metadata="title:${site_title}" \
            >"${dest}/index.html"

${debug} "Will try to copy CSS files."
if [ -d "${data_files_dir}/assets" ]; then
    cp "${data_files_dir}/assets/"* "${dest}"/
fi
