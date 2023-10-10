# Resiliate Rectify

## NAME

`aifs rectify` - The sāf search and rescue tool

## DESCRIPTION

Resiliate Rectify commands allow you to search and rescue recovery options.
All deleted files and directories bring themselves back. All damaged
files and directories self-repair to their last known good state across
all memoirs.

## USAGE

``` bash
aifs rectify {PATH} [OPTIONS] {COMMAND} {ARGS}
```

## SYNOPSIS

|COMMAND                               |Summary                                         |
|--------------------------------------|------------------------------------------------|
|`aifs rectify [ -a `\|` --all ]`        |Show all points.                                |
|`aifs rectify [ -l `\|` --long ]`       |Show sāf points in long format.                 |
|`aifs rectify [ -v `\|` --verbose ]`    |Show sāf points in verbose format.              |
|`aifs rectify [ -h `\|` --help ]`       |Prints this help message.                       |
|`aifs rectify [ -V `\|` --version ]`    |Prints current version.                         |
|`aifs rectify <path> now`             |Rescue a filesystem immediately.                |
|`aifs rectify <path> from`            |Provide ranged list of times or memory-blocks.  |
|`aifs rectify <path> stores`          |Show recoverable stores.                        |
|`aifs rectify <path> show`            |Show recovery points.                           |
|`aifs rectify <path> memory <ID>`     |Optionally, provide a transient engram ID.      |
|`aifs rectify <path> mark-pristine`   |Mark the current state as pristine.             |

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
