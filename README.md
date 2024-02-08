# Windows File Timestamp Resolution Investigation Script

This repository contains a PowerShell script designed to investigate the time resolution of file timestamps in Windows. The script performs the following actions:

1. Creates a file.
2. Writes a random string of characters to the file.
3. Records the `mtime` (modification time), `ctime` (creation time), and `atime` (access time) of the file.
4. Deletes the file.

These actions are repeated 1000 times, and the results are saved to text files for further analysis.

## Files Included

- `create_files_with_separate_outputs.ps1`: The PowerShell script that automates the file operations.
- `atime.txt`: Stores the recorded access times.
- `ctime.txt`: Stores the recorded creation times.
- `mtime.txt`: Stores the recorded modification times.
- `results.txt`: Aggregates all timestamps in a tab-separated format for each iteration.

## Script Output

The script generates four output files:

- `atime.txt`: Each line represents the access time for a file.
- `ctime.txt`: Each line represents the creation time for a file.
- `mtime.txt`: Each line represents the modification time for a file.
- `results.txt`: A combined log file with all timestamps, separated by tabs, for each file created and deleted during the script's execution.

Timestamps are recorded in seconds with a precision of 100 nanoseconds, as provided by the Windows file system.

## Important Notes

- The script introduces a randomized delay between 10 and 200 milliseconds between each file operation to account for potential file system caching effects.
- Files are sequentially named from `testfile0.txt` to `testfile999.txt`.
- The random content written to each file is approximately 1KB, which simulates a minimal load on the file system and allows for a more accurate measurement of timestamp resolution.

## Disclaimer

This script is intended for research and educational purposes. Always ensure that you have backups of critical data and that you understand the implications of running scripts that create and remove files on your system.
