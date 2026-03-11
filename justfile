# Default recipe (shows help)
# This must be the first recipe in the file

# List available recipes
default:
  just --list

# Check the glibc version a binary was built against
glibc binary:
  readelf -V {{binary}} | grep -oP '\(GLIBC[^)]*\)' | \
  grep -oE '[0-9]{1,}\.[0-9]{1,}(\.[0-9]{1,})?' | \
  sort | uniq | sort -rV | head -n1

# Check the magic number of a binary
magic binary:
  xxd -p -l 4 {{binary}}

# Get the architecture of an ELF binary
get-elf-arch binary:
  readelf -h {{binary}} | grep "Machine:" | awk -F': ' '{print $2}' | xargs
