# CEFS Rectify

## NAME

`cefs rectify` - The sāf search and rescue tool

## DESCRIPTION

CEFS Rectify commands allow you to search and rescue recovery options.
All deleted files and directories bring themselves back. All damaged
files and directories self-repair to their last known good state across
all memoirs.

## USAGE

``` bash
cefs rectify {PATH} [OPTIONS] {COMMAND} {ARGS}
```

## SYNOPSIS

|COMMAND                               |Summary                                         |
|--------------------------------------|------------------------------------------------|
|`cefs rectify [ -a `\|` --all ]`        |Show all points.                                |
|`cefs rectify [ -l `\|` --long ]`       |Show sāf points in long format.                 |
|`cefs rectify [ -v `\|` --verbose ]`    |Show sāf points in verbose format.              |
|`cefs rectify [ -h `\|` --help ]`       |Prints this help message.                       |
|`cefs rectify [ -V `\|` --version ]`    |Prints current version.                         |
|`cefs rectify <path> now`             |Rescue a filesystem immediately.                |
|`cefs rectify <path> from`            |Provide ranged list of times or memory-blocks.  |
|`cefs rectify <path> stores`          |Show recoverable stores.                        |
|`cefs rectify <path> show`            |Show recovery points.                           |
|`cefs rectify <path> memory <ID>`     |Optionally, provide a transient engram ID.      |
|`cefs rectify <path> mark-pristine`   |Mark the current state as pristine.             |

## OPTIONS

### `<path> now`

Rescue a filesystem immediately.

#### `-n, --dry-run`

Prints recovery information without rescue.

#### `-d, --depth <depth>`

Prints recovery information without rescue.

### `<path> from`

Provide ranged list of times or memory-blocks.

### `<path> stores`

Show recoverable storages.

#### `--porcelain`

Show stores in porcelain format.

### `<path> show`

Show recovery points.

### `<path> memory <engram-id#>`

Optionally, provide a transient engram ID.

### `<path> mark-pristine`

Mark the current state as pristine.
