<!-- hide -->
# Resiliate - control-plane - /status file

## Description - /status File Components

Let's consider the following example of the /status file:

```console
CE Metrics:
Damaged Files:          5 (242402s)
Exfiltrations:          0 (242402s)
Users: 2
Groups: 2
Processes: 4
u:      1000 recommendation: Audit, Quarantine, reason: source: all, attack: Damage, score: 0.5625, sigma: 1.2500, cosine: 0.0000, description: , rv: Displayed extension pdf is inconsistent with predicted extensions ???          2 (228936s)          0 (228936s)
u:         0 recommendation: Stop, Audit, Quarantine, reason: source: all, attack: Damage, Malicious, score: 0.7661, sigma: 3.0000, cosine: 0.0000, description: , rv: Displayed extension pdf is inconsistent with predicted extensions ["???"]       8509 (228936s)          0 (241366s)
g:         0 recommendation: Stop, Audit, Quarantine, reason: source: all, attack: Damage, Malicious, score: 0.7661, sigma: 3.0000, cosine: 0.0000, description: , rv: Displayed extension pdf is inconsistent with predicted extensions ["???"]       8509 (228936s)          0 (241366s)
g:      1000 recommendation: Audit, Quarantine, reason: source: all, attack: Damage, score: 0.5625, sigma: 1.2500, cosine: 0.0000, description: , rv: Displayed extension pdf is inconsistent with predicted extensions ???          2 (228936s)          0 (228936s)
p:         0 recommendation: Stop, Audit, Quarantine, reason: source: all, attack: Damage, Malicious, score: 0.7500, sigma: 3.0000, cosine: 0.0000, description: , rv: Displayed extension pdf is inconsistent with predicted extensions ["???"]        824 (228936s)          0 (241366s)
p:   1923090 recommendation: Audit, Quarantine, reason: source: all, attack: Damage, score: 0.5625, sigma: 1.2500, cosine: 0.0000, description: , rv: Displayed extension pdf is inconsistent with predicted extensions ???          2 (228936s)          0 (228936s)
p:   1908076 recommendation: Stop, Audit, Quarantine, reason: source: all, attack: Damage, score: 0.1328, sigma: 3.0000, cosine: 0.0000, description: , rv: File type changed from text/plain to image/gif       7685 (241322s)          0 (241366s)
p:   1922934 recommendation: Continue, reason: source: all, attack: None, score: 0.0000, sigma: 0.0000, cosine: 0.0000, description: , rv: None          0 (228961s)          0 (228961s)

```

**CE Metrics**: This section provides an overview of the metrics gathered by the Cybernetic Engram
(CE) for the Resiliate filesystem.

**`Damaged Files`**: Represents the number of files that have been detected as damaged.
The value in parentheses (242402s) indicates the time (in seconds) since this metric
was last updated.

**`Exfiltrations`**: Represents the number of unauthorized data exfiltrations detected.
Similar to the damaged files metric, the value in parentheses indicates the time
since the last update.

**`Users`**: The total number of unique user IDs (UIDs) that have interacted with
the filesystem.

**`Groups`**: The total number of unique group IDs (GIDs) that have been associated
with the filesystem.

**`Processes`**: The total number of unique process IDs (PIDs) that have interacted
with the filesystem.

**Detailed Metrics**:

Each subsequent line provides detailed metrics for specific UIDs, GIDs, or PIDs.
The prefixes `u:`, `g:`, and `p:` are used to denote user IDs, group IDs, and
process IDs respectively. These prefixes are designed for easy filtering using utilities
like `grep`, `sed`, and `awk`.

For each UID, GID, or PID, the following information is provided:

**`Recommendation`**: Suggested actions based on the detected activities.
Examples include Audit, Quarantine, and Stop.

**`Reason`**: A breakdown of the reasons behind the recommendation. This includes:

**`Source`**: The source of the detected activity, e.g., all.

**`Attack`**: The type of malicious activity detected, e.g., Damage, Malicious.

**`Score`**: A numerical score representing the severity of the detected activity.

**`Sigma`**: A statistical measure related to the detected activity.

**`Cosine`**: Another statistical measure.

**`Description`**: A textual description providing more context about the detected
activity.

**`rv (Reasoning Vector)`**: Provides specific details about the detected anomaly.
For instance, Displayed extension pdf is inconsistent with predicted extensions
indicates a potential file type mismatch.

`Exfiltrations Detected`: The number before the first set of parentheses indicates
the number of exfiltrations detected for that specific UID, GID, or PID. The value
in parentheses represents the time since the last update.

`Damage Detected`: The number after the first set of parentheses indicates the number
of damages detected. The value in the subsequent parentheses represents the time
since the last update.



## Example Use Cases

### 1. **User Behavior Analysis**

**Problem**: A sysadmin wants to monitor user behavior to detect any unusual activities that might indicate compromised accounts or insider threats.

**Solution**: By analyzing the `/status` file, the sysadmin can track activities of specific users (using the `u:` prefix). For instance, a sudden spike in damaged files or exfiltrations for a particular user might indicate suspicious behavior.

**Example**:
```bash
grep "^u:" /status | awk '$3 > 10 {print $0}'
```
This command filters out users with more than 10 damaged files, which can then be further investigated.

---

### 2. **Real-time Threat Detection**

**Problem**: A security admin wants to set up real-time alerts for potential threats.

**Solution**: The `/threats` file can be monitored for changes. Any new entries can trigger an alert. Additionally, the `score` and `sigma` values in the `/status` file can be used to set thresholds for alerts.

**Example**:
```bash
tail -f /threats | grep "Ransomware"
```
This command monitors the threats file in real-time for any ransomware-related entries.

---

### 3. **Data Labeling for Machine Learning**

**Problem**: A data scientist wants to train a machine learning model to predict malicious activities and needs labeled data.

**Solution**: The `/status` file provides labeled data with `reason`, `attack`, and `score` fields. This data can be extracted and used as training data for the model.

**Example**:
```bash
awk -F" " '{print $4, $6, $8}' /status > training_data.csv
```
This command extracts the `reason`, `attack`, and `score` fields for machine learning training.

---

### 4. **Impact Detection Post-Incident**

**Problem**: After a security incident, a secadmin wants to assess the impact, specifically which processes were involved and the extent of the damage.

**Solution**: The `p:` entries in the `/status` file can be analyzed to see which processes were active during the incident and how many files they damaged or exfiltrated.

**Example**:
```bash
grep "^p:" /status | awk '$3 > 0 || $5 > 0 {print $0}'
```
This command lists processes that have damaged or exfiltrated files.

---

### 5. **Forensic Analysis**

**Problem**: After a data breach, forensic experts want to trace back the activities of a particular group or user to understand the breach's origin.

**Solution**: The `/status` file can be analyzed to track the activities of specific groups (using the `g:` prefix) or users over time.

**Example**:
```bash
grep "^g:1000" /status
```
This command retrieves all activities associated with group ID 1000.

---

These scenarios highlight the versatility of the Resiliate filesystem's `/status` and `/threats` files in addressing various system and security administration challenges. By leveraging this data, professionals can proactively manage, monitor, and mitigate potential risks.