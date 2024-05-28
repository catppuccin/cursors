_default:
  @just --list

accents := "blue dark flamingo green lavender light maroon mauve peach pink red rosewater sapphire sky teal yellow"

# Remove all files in the ".pngs/", "./dist" and "./releases" directories
clean:
  rm -rf pngs/ dist/ releases/

# Zip all directories inside of "./dist"
zip:
  ./create_zips

# Generate a single flavor with specific accents. E.g. "build mocha 'blue'"
accents f a:
  ./build -f {{f}} -a '{{a}}'

# Generate a single flavor with all accents
flavor f:
  ./build -f {{f}} -a "{{accents}}"

# Generate all flavors with their accents
all: clean (flavor "latte") (flavor "frappe") (flavor "macchiato") (flavor "mocha")
