_default:
  @just --list

accents := "blue dark flamingo green lavender light maroon mauve peach pink red rosewater sapphire sky teal yellow"

# Remove all files in the ".pngs/", ".hl/", "./dist" and "./releases" directories
clean:
  rm -rf pngs/ hl/ dist/ releases/

# Remove all hyprcursor related files
clean_hl:
  rm -rf hl/

# Zip all directories inside of "./dist"
zip:
  ./create_zips

svgs:
  #!/usr/bin/env bash
  for file in src/templates/*.tera; do
    [ -f "$file" ] || continue
    whiskers $file
  done

# Generate a single flavor with accents, defaults to all accents
build f a=accents:
  ./build -f {{f}} -a '{{a}}'

# Generate a single flavor with accents with hyprcursor support, defaults to all accents
build_with_hyprcursor f a=accents: clean_hl
  ./build -f {{f}} -a '{{a}}' -h

# Generate all flavors with their accents
all: clean (build "latte") (build "frappe") (build "macchiato") (build "mocha")

# Generate all flavors with their accents with hyprcursor support
all_with_hyprcursor: clean (build_with_hyprcursor "latte") (build_with_hyprcursor "frappe") (build_with_hyprcursor "macchiato") (build_with_hyprcursor "mocha")

