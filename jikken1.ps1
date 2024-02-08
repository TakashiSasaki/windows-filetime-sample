
$iterations = 1000
$baseFileName = "testfile"
$atimeFile = "atime.txt"
$ctimeFile = "ctime.txt"
$mtimeFile = "mtime.txt"
$outputFile = "results.txt"

# Clear the output files if they already exist
if (Test-Path $atimeFile) { Remove-Item $atimeFile }
if (Test-Path $ctimeFile) { Remove-Item $ctimeFile }
if (Test-Path $mtimeFile) { Remove-Item $mtimeFile }
if (Test-Path $outputFile) { Remove-Item $outputFile }

for ($i = 0; $i -lt $iterations; $i++) {
    # Generate a unique file name for each iteration
    $fileName = "$baseFileName$i.txt"
    
    # Create a new file and write a random string of characters approximately 1KB in size
    $randomContent = -join ((65..90) + (97..122) | Get-Random -Count 1024 | % {[char]$_})
    $file = New-Item -Path $fileName -ItemType "file" -Force
    $file | Add-Content -Value $randomContent
    
    # Get the file's timestamps
    $fileInfo = Get-Item $fileName
    $ctime = $fileInfo.CreationTime.ToString("ss.fffffff")
    $atime = $fileInfo.LastAccessTime.ToString("ss.fffffff")
    $mtime = $fileInfo.LastWriteTime.ToString("ss.fffffff")

    # Add the timestamps to their respective files
    $ctime | Out-File -Append -FilePath $ctimeFile
    $atime | Out-File -Append -FilePath $atimeFile
    $mtime | Out-File -Append -FilePath $mtimeFile

    # Combine the timestamps and add to the results file
    "$ctime`t$atime`t$mtime" | Out-File -Append -FilePath $outputFile

    # Delete the file
    Remove-Item -Path $fileName -Force

    # Sleep for a random interval between 10 and 200 milliseconds
    $sleepDuration = Get-Random -Minimum 10 -Maximum 200
    Start-Sleep -Milliseconds $sleepDuration
}
