# index.html generator

The following scripts generate and deploy pkg.fpira.com index.page available
at [pkg.fpira.com](https://pkg.fpira.com).

## `readme2index.sh`

It generates the `index.html` file to sysout.

It does it by converting the [repo/README.md](../README.md) file in the upper directory.

## `deploy.sh`

It call the script above to generate the index.html file, put it in `/tmp` and then
uploads it to Cloudflare, overwriting the existing file (if any).

## How it works

The index.html file is served by Cloudflare worker as special URL case (`/` baseurl).
