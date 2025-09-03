# Resiliate Rectify

## NAME

`aifs rectify` - The sāf search and rescue tool

## DESCRIPTION

Resiliate Rectify commands allow you to search, examine, and restore recovery options.
The tool provides access to snapshots and memoirs stored in the CELLFS filesystem,
enabling you to view recovery points, examine filesystem state at different times,
and restore files to their uncorrupted versions from snapshots. The tool provides
comprehensive protection against ransomware, wiperware, and other malicious activities
with intelligent auto-recovery capabilities.

## USAGE

``` bash
aifs rectify [OPTIONS] OPERATION <path>
```

## SYNOPSIS

| OPERATION | Summary |
|-----------|---------|
| `snapshots` | Raw dump of snapshots on `<path>` |
| `show` | Parsed + human timestamps of snapshots on `<path>` |
| `auto` | Comprehensive auto-recovery: wiperware first, then ransomware |
| `ransomware` | Analyzes and quarantines potential ransomware |
| `wiperware` | Detects and recovers from wiperware attacks |
| `scan` | Only scans the AIFS mount, doesn't repair |
| `cleanup` | Removes stale memoirs dir (after recovery) |

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
| `--output=FILE` | Output file for restore operations |
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

Display human-readable timestamps and snapshot information. This operation can also 
be used to identify and restore specific files from clean snapshots.

**Features:**
- Shows snapshots in specified time window
- Displays human-readable timestamps
- Color-coded output for better readability
- Safety limits to prevent infinite loops
- Enables file restoration from clean snapshots

**Example:**
```bash
aifs rectify --verbose --depth=20 show /cefs-pool/aifs
```

**Output includes:**
- Device information
- Memoirs directory location
- Depth limit
- Numbered list of snapshots with timestamps

### `auto` - Comprehensive Auto-Recovery

The `auto` operation provides intelligent, comprehensive malware recovery by executing
a strategic two-phase approach that handles the most common attack scenarios in optimal order.

**Recovery Sequence:**
1. **Phase 1: Wiperware Recovery** - Addresses data destruction first
2. **Phase 2: Ransomware Recovery** - Handles encryption after data restoration

**Why This Order Matters:**
- **Data Preservation Priority**: Wiperware permanently destroys data, so recovery must happen first
- **Comprehensive Coverage**: Some attacks combine wiping with encryption
- **Optimal Recovery**: Restoring deleted files before decryption attempts maximizes success
- **Timeline Analysis**: Wiperware typically occurs before or alongside ransomware deployment

**Auto-Recovery Process:**

**Phase 1: Wiperware Detection and Recovery**
- Scans for mass deletion patterns and data destruction
- Identifies overwritten files and destroyed directories
- Restores deleted files from most recent clean snapshots
- Rebuilds damaged directory structures
- Verifies restoration integrity before proceeding

**Phase 2: Ransomware Detection and Recovery**
- Analyzes remaining files for encryption patterns
- Identifies ransomware signatures and encrypted files
- Restores encrypted files from pre-attack snapshots
- Quarantines malicious files for forensic analysis
- Removes ransom notes and malware artifacts

**Intelligent Features:**
- **Threat Classification**: Automatically determines attack types present
- **Timeline Analysis**: Establishes attack chronology for optimal recovery
- **Conflict Resolution**: Handles overlapping file damage intelligently
- **Progress Reporting**: Provides detailed status throughout both phases
- **Rollback Protection**: Can revert changes if issues are detected

**Example:**
```bash
aifs rectify --verbose auto /cefs-pool/aifs
```

**Extended Example with Full Logging:**
```bash
aifs rectify --verbose --last=72h --output=/var/log/auto-recovery.log auto /cefs-pool/aifs
```

### `ransomware`

Specifically targets ransomware attacks and encrypted files. This operation:

- Scans files for encryption patterns and ransomware signatures
- Identifies suspicious file extensions (e.g., .locked, .encrypted, .crypto)
- Detects ransom notes and payment instructions
- Automatically restores files from clean snapshots
- Quarantines encrypted files for forensic analysis
- Provides detailed analysis reports

**Example:**
```bash
aifs rectify --verbose ransomware /cefs-pool/aifs
```

### `wiperware`

Detects and recovers from wiperware attacks that attempt to permanently destroy data.
Wiperware differs from ransomware as it aims to completely erase data rather than
encrypt it for ransom. This operation:

- **Detection Capabilities:**
  - Identifies mass file deletion patterns
  - Detects overwriting with null bytes or random data
  - Recognizes systematic directory destruction
  - Monitors for rapid file system changes
  - Identifies boot sector and MBR corruption attempts

- **Recovery Mechanisms:**
  - Restores deleted files from snapshots
  - Recovers overwritten files from clean backups
  - Rebuilds destroyed directory structures
  - Restores system files and boot records
  - Recovers metadata and file permissions

- **Prevention Features:**
  - Real-time monitoring for suspicious deletion patterns
  - Automatic snapshot creation before bulk operations
  - File system integrity verification
  - Protection against low-level disk wiping

**Example:**
```bash
aifs rectify --verbose wiperware /cefs-pool/aifs
```

### `scan`

Performs a read-only scan of the AIFS mount without making any repairs. This operation:

- Identifies corrupted or suspicious files
- Detects signs of ransomware or wiperware activity
- Reports on filesystem health and attack indicators
- Shows potential restoration candidates
- Analyzes file modification patterns and timelines
- Provides threat assessment without modification

**Example:**
```bash
aifs rectify --dry-run scan /cefs-pool/aifs
```

### `cleanup`

Removes stale memoirs directories after recovery operations. This operation:

- Cleans up temporary recovery files
- Removes outdated memoir entries
- Frees up storage space used during recovery
- Maintains filesystem hygiene
- Purges quarantined malware samples (with verification)
- Optimizes snapshot storage

**Example:**
```bash
aifs rectify cleanup /cefs-pool/aifs
```

## AUTO-RECOVERY WORKFLOW

### Comprehensive Attack Response

The `auto` operation follows a sophisticated workflow designed to handle complex, multi-vector attacks:

```
1. Initial Assessment
   ├── Filesystem health scan
   ├── Attack pattern identification
   ├── Timeline establishment
   └── Snapshot availability verification

2. Phase 1: Wiperware Recovery
   ├── Mass deletion detection
   ├── Overwrite pattern analysis
   ├── Directory structure assessment
   ├── Bulk file restoration
   └── Structure rebuilding

3. Phase 2: Ransomware Recovery
   ├── Encryption pattern detection
   ├── Ransomware signature identification
   ├── Encrypted file restoration
   ├── Malware quarantine
   └── Artifact cleanup

4. Verification and Reporting
   ├── Restoration integrity check
   ├── System functionality verification
   ├── Recovery statistics compilation
   └── Audit log generation
```

### Attack Scenario Handling

**Scenario 1: Pure Wiperware Attack**
- Auto detects no encryption, focuses on deletion recovery
- Skips ransomware phase if no encrypted files found
- Optimizes for rapid bulk restoration

**Scenario 2: Pure Ransomware Attack**
- Auto detects no mass deletions, jumps to encryption handling
- Focuses on file decryption via snapshot restoration
- Emphasizes malware quarantine and removal

**Scenario 3: Combined Wiper-Ransom Attack**
- Auto executes full two-phase recovery
- Prioritizes data restoration before decryption
- Handles complex file state conflicts intelligently

**Scenario 4: Staged Attack**
- Auto analyzes attack timeline across snapshots
- Identifies multiple attack waves or persistence
- Provides comprehensive recovery across entire incident

## FILE RESTORATION PROCESS

### Automatic Restoration

The rectify tool can automatically restore corrupted files to their last known good state:

1. **Detection**: Identifies corrupted, encrypted, deleted, or missing files
2. **Analysis**: Examines available snapshots within the time window
3. **Threat Classification**: Determines if damage is from ransomware, wiperware, or corruption
4. **Timeline Reconstruction**: Establishes chronology of attack events
5. **Selection**: Chooses the most recent clean version before attack
6. **Restoration**: Restores files from snapshots to working directory
7. **Verification**: Validates restored file integrity and completeness

### Manual Restoration

Users can manually select specific snapshots for restoration:

1. Use `aifs rectify show` operation to list available snapshots
2. Identify the desired recovery point before attack occurred
3. Use restoration commands to recover specific files or directories
4. Verify restored content and functionality

## MALWARE PROTECTION

### Ransomware Protection

- **Detection**: Automatic identification of encryption patterns
- **Signature Recognition**: Known ransomware family identification
- **Behavioral Analysis**: Suspicious file modification patterns
- **Recovery**: Restoration from pre-encryption snapshots
- **Quarantine**: Safe isolation of encrypted files
- **Forensics**: Preservation of evidence for analysis

### Wiperware Protection

- **Early Detection**: Rapid identification of mass deletion events
- **Pattern Recognition**: Detection of systematic data destruction
- **Real-time Monitoring**: Continuous surveillance for wiping activities
- **Rapid Response**: Immediate snapshot creation and restoration
- **Deep Recovery**: Low-level data recovery from overwritten sectors
- **System Protection**: Boot sector and critical file protection

### Combined Attack Protection

- **Multi-Vector Detection**: Simultaneous wiperware and ransomware identification
- **Intelligent Prioritization**: Optimal recovery order for maximum data preservation
- **Conflict Resolution**: Handling of files affected by multiple attack vectors
- **Timeline Correlation**: Understanding attack progression and persistence
- **Comprehensive Reporting**: Full incident analysis and recovery metrics

## CONFIGURATION

The script uses the following configuration variables:

| Variable | Default Value | Description |
|----------|---------------|-------------|
| `CELLFS_ROOT` | `/usr/share/cellfs` | Root directory for CELLFS binaries |
| `MEMOIRS_DIR` | `/var/lib/resiliate/memoirs` | Directory containing memoirs |
| `CE_NAIVE_PATH` | `/usr/bin/clamav-scan` | Path to antivirus scanner |
| `AUDIT_LOG` | `/var/log/rectify-audit.*.log` | Audit log file location |

## RESTORATION TRACKING

The script maintains several counters during operation:

| Counter | Description |
|---------|-------------|
| `TOTAL` | Total files processed across all phases |
| `SKIPPED` | Files skipped during processing |
| `FAILED` | Files that failed restoration |
| `RESTORED` | Successfully restored files |

## PATH HANDLING

The tool includes special handling for specific paths:

- `/cefs-pool/aifs` or `/cefs-pool/aifs/` maps to `/var/lib/resiliate/helm-test--cefs`
- Block device for `/var/lib/resiliate/helm-test--cefs` is `/dev/mapper/helm-test--cefs`
- Other paths are resolved using `realpath -e`

## EXAMPLES

### Comprehensive Auto-Recovery (Recommended)
```bash
aifs rectify --verbose auto /cefs-pool/aifs
```

### Auto-Recovery with Extended Time Window
```bash
aifs rectify --verbose --last=72h auto /cefs-pool/aifs
```

### Auto-Recovery with Full Audit Logging
```bash
aifs rectify --verbose --output=/var/log/incident-recovery.log auto /cefs-pool/aifs
```

### Dry-Run Auto-Recovery Assessment
```bash
aifs rectify --dry-run --verbose auto /cefs-pool/aifs
```

### Specific Threat Recovery
```bash
# Wiperware only
aifs rectify --verbose wiperware /cefs-pool/aifs

# Ransomware only
aifs rectify --verbose ransomware /cefs-pool/aifs
```

### Diagnostic and Monitoring
```bash
# View recent snapshots
aifs rectify --last=30d snapshots /cefs-pool/aifs

# Detailed snapshot analysis
aifs rectify --verbose show /cefs-pool/aifs

# Security scan without recovery
aifs rectify --dry-run scan /cefs-pool/aifs
```

### Emergency Response
```bash
# Immediate auto-recovery with priority logging
aifs rectify --verbose --last=1h --output=/var/log/emergency-$(date +%Y%m%d-%H%M%S).log auto /cefs-pool/aifs
```

### Post-Recovery Maintenance
```bash
# Clean up after recovery
aifs rectify cleanup /cefs-pool/aifs
```

## ERROR HANDLING

The script includes comprehensive error handling:

- Path validation using `get_aifs_path()`
- Block device detection using `get_block_device()`
- Date parsing validation
- Safety limits for snapshot processing
- Detailed logging with different severity levels
- Restoration failure recovery and rollback
- File integrity verification
- Malware detection false positive handling
- Phase transition error management

## SECURITY CONSIDERATIONS

### Multi-Phase Recovery Security

- **Phase Isolation**: Each recovery phase is isolated to prevent cross-contamination
- **Rollback Capability**: Ability to revert changes if corruption is detected
- **Audit Trail**: Comprehensive logging of all auto-recovery decisions
- **Access Control**: Enhanced permissions validation for automated operations

### Threat Intelligence

- **Pattern Learning**: Auto-recovery improves based on attack pattern recognition
- **Signature Updates**: Integration with threat intelligence for known malware
- **Behavioral Analysis**: Machine learning-based attack detection
- **Forensic Preservation**: Evidence collection during automated recovery

## EXIT CODES

- `0` - Success (all phases completed successfully)
- `32` - Error (invalid arguments, file not found, restoration failed, etc.)

## PERFORMANCE CONSIDERATIONS

### Auto-Recovery Optimization

- **Parallel Processing**: Simultaneous wiperware and ransomware analysis where safe
- **Memory Management**: Efficient handling of large-scale recovery operations
- **I/O Optimization**: Minimized disk access during restoration
- **Progress Reporting**: Real-time status updates for long-running operations

### Resource Management

- **Phase Coordination**: Optimal resource allocation between recovery phases
- **Throttling Controls**: System load management during intensive recovery
- **Priority Queuing**: Critical file restoration prioritization
- **Cleanup Automation**: Automatic resource cleanup between phases

## NOTES

- The `auto` operation is the recommended approach for unknown or complex attacks
- The command is executed through the `aifs` wrapper script for all operations
- Time windows are inclusive of both start and end times
- The script processes snapshots in reverse chronological order (newest first)
- A safety limit of 1000 processed snapshots prevents infinite loops
- Restored files maintain original permissions and metadata when possible
- All restoration operations are logged for audit purposes
- The `--dry-run` option allows safe preview of all auto-recovery actions
- Auto-recovery may require extended time for comprehensive analysis
- Regular snapshot maintenance improves recovery speed and success rates
- Critical system files are prioritized during emergency recovery operations
- Phase-by-phase recovery allows for partial success even if one phase fails
