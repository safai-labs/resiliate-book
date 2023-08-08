# Resiliate Filesystem

## NAME

`aifs filesystem` - The filesystem manager

## DESCRIPTION

Resiliate Filesystem commands allow you to manage the organization of Resiliate
file systems.

## USAGE

``` bash
aifs filesystem {COMMAND} [OPTIONS] {ARGS}
```

## SYNOPSIS

|COMMAND                               |SUMMARY                    |
|--------------------------------------|---------------------------|
|`aifs filesystem [ -h `\|` --help ]`    |Prints this help message.  |
|`aifs filesystem [ -V `\|` --version ]` |Prints current version.    |
|`aifs filesystem mount <src> <mp>`    |Mount a filesystem.        |
|`aifs filesystem umount <mp>`         |Unmount a filesystem.      |
|`aifs filesystem mkfs <target>`       |Create a Resiliate filesystem.  |

## OPTIONS

### `mount <source> <mount-point>`

Mount Resiliate filesystem.

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

Unmount a Resiliate filesystem.

### `mkfs <target>`

Initialize (create) a new Resiliate filesystem.

#### `-D, --driver <backend>`

Backend-store determines what type of storage you want to use Resiliate on.
(default: logfs) [possible values: flat-file, key-value]

#### `-s, --source <source>`

Source directory or block device, used to populate the data.
If not specified, no data is populated.

#### `-o <options>`

Advanced options. (see documentation for details)
