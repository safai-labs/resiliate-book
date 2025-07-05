# Resiliate Rectify

## NAME

`aifs rectify` - The sāf search and rescue tool

## DESCRIPTION

Resiliate Rectify commands allow you to search and examine recovery options.
The tool provides access to snapshots and memoirs stored in the CELLFS filesystem,
enabling you to view recovery points and examine filesystem state at different times.

## USAGE

``` bash
aifs rectify [OPTIONS] OPERATION <path>
```

## SYNOPSIS

| OPERATION | Summary |
|-----------|---------|
| `snapshots` | Raw dump of snapshots on `<path>` |
| `show` | Parsed + human timestamps of snapshots on `<path>` |

## OPTIONS

### Global Options

| Option | Description |
|--------|-------------|
| `--verbose`, `-v` | More detailed debugging output |
| `--last=DURATION` | Time window (e.g., 30d = 30 days, 2h = 2 hours) |
| `--from=DATE` | Start of the time window (ISO-8601 format) |
| `--to=DATE` | End of the time window (ISO-8601 format) |
| `--dry-run` | Show actions without modifying data |
| `--depth=N` | Maximum N snapshots to show in range (default: 10) |
| `--output=FILE` | Output file for operations |
| `--help`, `-h` | Show help message |

### Time Range Specification

**Default time window**: 24 hours (last 24h)

**Duration Examples** (for `--last`):
- `30d` - 30 days
- `2h` - 2 hours  
- `1w` - 1 week

**Date Examples** (for `--from`/`--to`):
- `"2022-03-14"`
- `"2022-03-14 15:00:00"`
- `"yesterday"`
- `"3 days ago"`

## OPERATIONS

### `snapshots`

Display raw dump of snapshots on the specified path.

**Output Format:**
```
    CNO        DATE     TIME  MODE  FLG      BLKCNT       ICNT
```

**Example:**
```bash
aifs rectify --last=7d snapshots /cefs-pool/aifs
```

### `show` 

Display human-readable timestamps and snapshot information.

**Features:**
- Shows snapshots in specified time window
- Displays human-readable timestamps
- Color-coded output for better readability
- Safety limits to prevent infinite loops

**Example:**
```bash
aifs rectify --verbose --depth=20 show /cefs-pool/aifs
```

**Output includes:**
- Device information
- Memoirs directory location
- Depth limit
- Numbered list of snapshots with timestamps

## CONFIGURATION

The script uses the following configuration variables:

| Variable | Default Value | Description |
|----------|---------------|-------------|
| `CELLFS_ROOT` | `/usr/share/cellfs` | Root directory for CELLFS binaries |
| `MEMOIRS_DIR` | `/var/lib/resiliate/memoirs` | Directory containing memoirs |
| `CE_NAIVE_PATH` | `/usr/bin/clamav-scan` | Path to antivirus scanner |
| `AUDIT_LOG` | `/var/log/rectify-audit.*.log` | Audit log file location |

## PATH HANDLING

The tool includes special handling for specific paths:

- `/cefs-pool/aifs` or `/cefs-pool/aifs/` maps to `/var/lib/resiliate/helm-test--cefs`
- Block device for `/var/lib/resiliate/helm-test--cefs` is `/dev/mapper/helm-test--cefs`
- Other paths are resolved using `realpath -e`

## EXAMPLES

### View last 30 days of snapshots
```bash
aifs rectify --last=30d snapshots /cefs-pool/aifs
```

### Show detailed snapshot information
```bash
aifs rectify --verbose show /cefs-pool/aifs
```

### View snapshots in custom date range
```bash
aifs rectify --from="2024-01-01" --to="2024-01-31" snapshots /cefs-pool/aifs
```

### Limit output to 5 most recent snapshots
```bash
aifs rectify --depth=5 show /cefs-pool/aifs
```

## ERROR HANDLING

The script includes comprehensive error handling:

- Path validation using `get_aifs_path()`
- Block device detection using `get_block_device()`
- Date parsing validation
- Safety limits for snapshot processing
- Detailed logging with different severity levels

## EXIT CODES

- `0` - Success
- `32` - Error (invalid arguments, file not found, etc.)

## NOTES

- The script requires appropriate permissions to access CELLFS tools and device files
- Time windows are inclusive of both start and end times
- The script processes snapshots in reverse chronological order (newest first)
- A safety limit of 1000 processed snapshots prevents infinite loops
