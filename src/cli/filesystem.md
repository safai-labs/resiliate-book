# CEFS Filesystem

## NAME

`cefs filesystem` - The filesystem manager

## DESCRIPTION

CEFS Filesystem commands allow you to manage the organization of CEFS
file systems.

## USAGE

``` bash
cefs filesystem {COMMAND} [OPTIONS] {ARGS}
```

## SYNOPSIS

|COMMAND                               |SUMMARY                    |
|--------------------------------------|---------------------------|
|`cefs filesystem [ -h `\|` --help ]`    |Prints this help message.  |
|`cefs filesystem [ -V `\|` --version ]` |Prints current version.    |
|`cefs filesystem mount <src> <mp>`    |Mount a filesystem.        |
|`cefs filesystem umount <mp>`         |Unmount a filesystem.      |
|`cefs filesystem mkfs <target>`       |Create a CEFS filesystem.  |

## OPTIONS

### `mount <source> <mount-point>`

Mount CEFS filesystem.

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

Unmount a CEFS filesystem.

### `mkfs <target>`

Initialize (create) a new CEFS filesystem.

#### `-D, --driver <backend>`

Backend-store determines what type of storage you want to use CEFS on.
(default: logfs) [possible values: flat-file, key-value]

#### `-s, --source <source>`

Source directory or block device, used to populate the data.
If not specified, no data is populated.

#### `-o <options>`

Advanced options. (see documentation for details)
