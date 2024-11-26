_default:
  @just --list

accents := "blue dark flamingo green lavender light maroon mauve peach pink red rosewater sapphire sky teal yellow"

# Remove all files in the ".pngs/", ".hl/", "./dist", "./releases" and "./svgs" directories
clean:
  rm -rf pngs/ hl/ dist/ releases/ svgs/

# Remove all hyprcursor related files // deprecated
clean_hl: clean

# Zip all directories inside of "./dist"
zip:
  ./scripts/create_zips

# Generate a single flavor with accents, defaults to all accents
build f a=accents:
  ./build -f {{f}} -a '{{a}}'

# Generate a single flavor with accents with hyprcursor support, defaults to all accents
build_with_hyprcursor f a=accents: clean_hl
  ./build -f {{f}} -a '{{a}}' -h

# Generate all flavors with their accents
all: clean (build "latte") (build "frappe") (build "macchiato") (build "mocha")

# Generate all flavors with their accents with hyprcursor support // deprecated
all_with_hyprcursor: all
