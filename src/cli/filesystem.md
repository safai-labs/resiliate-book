# AIFS Filesystem

## NAME

`aifs filesystem` - The filesystem manager

## DESCRIPTION

AIFS Filesystem commands allow you to manage the organization of AIFS
file systems.

## USAGE

``` bash
cefs filesystem {COMMAND} [OPTIONS] {ARGS}
```

## SYNOPSIS

|COMMAND                               |SUMMARY                    |
|--------------------------------------|---------------------------|
|`aifs filesystem [ -h `\|` --help ]`    |Prints this help message.  |
|`aifs filesystem [ -V `\|` --version ]` |Prints current version.    |
|`aifs filesystem mount <src> <mp>`    |Mount a filesystem.        |
|`aifs filesystem umount <mp>`         |Unmount a filesystem.      |
|`aifs filesystem mkfs <target>`       |Create a AIFS filesystem.  |

## OPTIONS

### `mount <source> <mount-point>`

Mount AIFS filesystem.

#### `-l, --log`

Enable logging.

#### `--dac`

(UNSTABLE)Enable DAC security.

#### `--use-unstable`

Verify usage of unstable features.

#### `-o <opts>`

Storage driver options.

#### `--source-driver <source-driver>`

Front-end source-driver.

#### `--storage-driver <storage-driver>`

Back-end storage driver.

### `umount <mount-point>`

Unmount a AIFS filesystem.

### `mkfs <target>`

Initialize (create) a new AIFS filesystem.

#### `-D, --driver <backend>`

Backend-store determines what type of storage you want to use AIFS on.
(default: logfs) [possible values: flat-file, key-value]

#### `-s, --source <source>`

Source directory or block device, used to populate the data.
If not specified, no data is populated.

#### `-o <options>`

Advanced options. (see documentation for details)
