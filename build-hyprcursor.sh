#!/usr/bin/env bash

# Volantes cursors, based on KDE Breeze
# Copyright (c) 2016 Keefer Rourke <keefer.rourke@gmail.com>
# Copyright (c) 2020 Sergei Eremenko <https://github.com/SmartFinn>

set -e

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
	local theme_name="$(basename "$1")"
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
	create_hyprcursors "$theme_src_dir" "$theme_build_dir" "$theme_name"
	compile_hyprcursors "$theme_build_dir" "$theme_out_dir"
done
