_default:
  @just --list

accents := "blue dark flamingo green lavender light maroon mauve peach pink red rosewater sapphire sky teal yellow"

# Remove all files in the ".pngs/", ".hl/", "./dist" and "./releases" directories
clean:
  rm -rf pngs/ hl/ dist/ releases/

# Zip all directories inside of "./dist"
zip:
  ./create_zips

# Generate a single flavor with specific accents. E.g. "build mocha 'blue'"
accents f a *flags:
  ./build -f {{f}} -a '{{a}}' '{{flags}}'

# Generate a single flavor with all accents
flavor f *flags:
  ./build -f {{f}} -a "{{accents}}" '{{flags}}'

# Generate all flavors with their accents
all *flags: clean (flavor "latte" flags) (flavor "frappe" flags) (flavor "macchiato" flags) (flavor "mocha" flags)
