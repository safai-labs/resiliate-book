# Resiliate Storage

## NAME

`aifs storage` - The storage controller

## DESCRIPTION

Resiliate Storage commands allow you to control the backend storage. There
are several storage-drivers that provide circumstantial benefits for
contingent operational situations.

## USAGE

``` bash
aifs storage {COMMAND} [OPTIONS] {ARGS}
```

## SYNOPSIS

|COMMAND                             |SUMMARY                               |
|------------------------------------|--------------------------------------|
|`aifs storage [ -v `\|` --verbose]`   |Prints verbose progress reports.      |
|`aifs storage [ -h `\|` --help ]`     |Prints this help message.             |
|`aifs storage [ -V `\|` --version ]`  |Prints current version.               |
|`aifs storage init <dev>`           |Initialize a new back-end storage.    |
|`aifs storage bind <dev> <mnt>`     |Export back-end storage to front-end. |

## OPTIONS

### `init <device>`

Initialize a new storage back-end.

#### `-f, --from <source>`

Source directory or block device, used to populate the data.
If not specified, no data is populated.

### ``bind <device> <mount>``

Export back-end storage to front-end storage.

#### `-B, --backend <backend>`

Backend-storage determines what type of storage you want to use Resiliate on.
[possible values: flat-file, key-value]

#### `-o <options>`

Advanced options. (see documentation for details)
