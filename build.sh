#!/usr/bin/env bash

# Volantes cursors, based on KDE Breeze
# Copyright (c) 2016 Keefer Rourke <keefer.rourke@gmail.com>
# Copyright (c) 2020 Sergei Eremenko <https://github.com/SmartFinn>

set -e

INKSCAPE_VERSION=$(inkscape --version 2>/dev/null | awk '/Inkscape[ ]/ {print $2; exit}')

convert_to_png() {
	local src_dir="$1"
	local out_dir="${2:-.}"
	local file size bitmap_file png_mtime svg_mtime

	[ -d "$src_dir" ] || return 1
	[ -d "$out_dir" ] || mkdir -p "$out_dir"

	# shellcheck disable=SC2016
	for file in "$src_dir"/*.svg; do
		[ -f "$file" ] || continue
		for size in 24 32 48 64; do
			bitmap_file="${out_dir%/}/$(basename "$file" .svg)_${size}.png"

			svg_mtime="$(stat -c '%Y' "$file")"
			png_mtime="$(stat -c '%Y' "$bitmap_file" 2>/dev/null || echo 0)"

			if (( png_mtime > svg_mtime )); then
				# skip if PNG file exists and the modification time is
				# newer than on SVG file
				continue
			fi

			if [ "${INKSCAPE_VERSION%%.*}" -eq 0 ]; then
				printf 'inkscape -z -e "%s" -w %s -h %s "%s"\0' \
					"$bitmap_file" "$size" "$size" "$file"
			else
				printf 'inkscape -o "%s" -w %s -h %s "%s"\0' \
					"$bitmap_file" "$size" "$size" "$file"
			fi
		done
	done | xargs -r -0 -n 1 -P "$(nproc)" sh -c
}

convert_to_x11cursor() {
	local src_dir="$1"
	local out_dir="$2"
	local config base_name

	[ -d "$src_dir" ] || return 1

	if [ -d "$out_dir" ]; then
		rm -rf "$out_dir"
	fi

	mkdir -p "$out_dir"

	echo -ne "Generating cursor theme...\\r"
	for config in "$CONFIG_DIR"/*.cursor; do
		[ -f "$config" ] || continue
		base_name="$(basename "$config" .cursor)"
		xcursorgen -p "$src_dir" "$config" "$out_dir/$base_name"
	done
	echo -e "Generating cursor theme... DONE"
}

create_aliases() {
	local out_dir="$1"
	local symlink target

	echo -ne "Generating shortcuts...\\r"
	while read -r symlink target; do
		[ -e "$out_dir/$symlink" ] && continue
		ln -sf "$target" "$out_dir/$symlink"
	done < "$ALIASES"
	echo -e "Generating shortcuts... DONE"
}

create_hyprcursors() {
	local src_dir="$1"
	local out_dir="$2"
	local theme_name="$3"
	local theme_comment="$4"
	local hypr_dir="$out_dir/hyprcursors"
	local filename dir cursor_dir striped base_name symlink target cursor_dir

	[ -d "$src_dir" ] || return 1
	[ -d "$out_dir" ] || mkdir -p "$out_dir"
	[ -d "$hypr_dir" ] || mkdir -p "$hypr_dir"

	echo -ne "Generating hyprcursor theme...\\r"
	for file in "$src_dir"/*.svg; do
		filename=$(basename -- "$file")

		if [[ "$filename" == *_24.svg ]]; then
			continue
		fi

		if [[ "$filename" == *-[0-9][0-9].svg ]]; then
			dir="${filename%-[0-9][0-9].svg}"
			cursor_dir="$hypr_dir/$dir"
			striped="${filename#"$dir"}"

			[ -d "$cursor_dir" ] || mkdir -p "$cursor_dir"

			cp -- "$file" "$cursor_dir"
		else
			dir="${filename%.svg}"
			cursor_dir="$hypr_dir/$dir"

			[ -d "$cursor_dir" ] || mkdir -p "$cursor_dir"

			cp -- "$file" "$cursor_dir"
		fi
	done

	for config in "$CONFIG_DIR"/*.hl; do
		[ -f "$config" ] || continue

		base_name="$(basename "$config" .hl)"
		cursor_dir="$hypr_dir/$base_name"
		[ -d "$cursor_dir" ] || continue
		cp "$config" "$cursor_dir/meta.hl"
	done

	while read -r symlink target; do
		cursor_dir="$out_dir/$target"
		if [ -f "$cursor_dir"/meta.hl ]; then
			echo "define_override = $symlink" >>"$cursor_dir"/meta.hl
		fi
	done <"$ALIASES"

	theme_comment="$(grep Comment "$src_dir"/index.theme)"
	cat >"$out_dir"/manifest.hl <<- EOM
		name = ${theme_name%-Cursors}
		description = ${theme_comment#Comment=}
		version = $(git show -s --format=%cd --date=format:%Y%m%d HEAD)
		cursors_directory = hyprcursors
	EOM
	echo -e "Generating hyprcursor theme... DONE"
}

compile_hyprcursors() {
	local src_dir="$1"
	local out_dir="$2"
	local theme_name="$(basename $1)"
	local compile_dir="$1/../theme_${theme_name%-Cursors}"
	local filename dir cursor_dir striped base_name symlink target cursor_dir

	[ -d "$src_dir" ] || return 1
	[ -d "$out_dir" ] || mkdir -p "$out_dir"

	echo -ne "Compiling hyprcursors...\\r"
	hyprcursor-util -c "$src_dir" >/dev/null
	cp -a "$compile_dir/." "$out_dir/"
	echo -e "Compiling hyprcursors... DONE"
}

SCRIPT_DIR="$(dirname "$0")"

: "${SRC_DIR:="$SCRIPT_DIR"/src}"
: "${OUT_DIR:="$SCRIPT_DIR"/dist}"
: "${BUILD_DIR:="$SCRIPT_DIR"/build}"
: "${ALIASES:="$SCRIPT_DIR"/src/cursorList}"
: "${CONFIG_DIR:="$SCRIPT_DIR"/src/config}"

for theme_src_dir in "$SRC_DIR"/*; do
	# skip directory that not contains index.theme file
	[ -f "$theme_src_dir/index.theme" ] || continue
	theme_name="$(basename "$theme_src_dir")"
	theme_build_dir="$BUILD_DIR/$theme_name"
	theme_out_dir="$OUT_DIR/$theme_name"

	echo "=> Workon '$theme_src_dir' ..."
	convert_to_png "$theme_src_dir" "$theme_build_dir"
	convert_to_x11cursor "$theme_build_dir" "$theme_out_dir"/cursors
	create_aliases "$theme_out_dir"/cursors

	create_hyprcursors "$theme_src_dir" "$theme_build_dir" "$theme_name"
	compile_hyprcursors "$theme_build_dir" "$theme_out_dir"

	cp -f "$theme_src_dir/index.theme" "$theme_out_dir"/
done
