_default:
  @just --list

accents := "blue dark flamingo green lavender light maroon mauve peach pink red rosewater sapphire sky teal yellow"

# Remove all files in the ".pngs/", ".hl/", "./dist", "./releases" and "./svgs" directories
clean:
  rm -rf pngs/ hl/ dist/ releases/ svgs/

# Zip all directories inside of "./dist"
zip:
  ./scripts/create_zips

# Generate a single flavor with accents, defaults to all accents
build f a=accents:
  ./build -f {{f}} -a '{{a}}'

# Generate all flavors with their accents
all: clean (build "latte") (build "frappe") (build "macchiato") (build "mocha")
