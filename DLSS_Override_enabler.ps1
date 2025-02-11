$jsonFile = "$env:LOCALAPPDATA\NVIDIA Corporation\NVIDIA app\NvBackend\ApplicationStorage.json"
$backupFile = "$jsonFile.backup"

# Check if the file exists
$fileExists = Test-Path $jsonFile
if (-Not $fileExists) {
    Write-Host "[ERROR] The file ApplicationStorage.json was not found!"
    pause
    exit
}

# Check if the file is marked as read-only
$readonly = (Get-Item $jsonFile).IsReadOnly

# Check if the backup already exists
$backupExists = Test-Path $backupFile

# Read the JSON file content
$jsonContent = Get-Content -Path $jsonFile -Raw

# Check if changes are needed
$changesNeeded = $jsonContent -match '"Disable_(FG|RR|SR|RR_Model|SR_Model)_Override":\s*true'

# Display menu with information
Clear-Host
Write-Host "======================================================="
Write-Host "                  DLSS_Override_enabler"
Write-Host "   https://github.com/llbranco/DLSS_Override_enabler"
Write-Host "======================================================="
Write-Host ""
Write-Host "File found: $($fileExists -as [string])"
Write-Host "Read-only: $($readonly -as [string])"
Write-Host "Backup exists: $($backupExists -as [string])"
Write-Host "Modifications needed: $($changesNeeded -as [string])"
Write-Host ""
Write-Host "[WARNING] This script modifies the ApplicationStorage.json file."
Write-Host "There are no guarantees, use at your own risk!"
Write-Host ""
Pause

# If the file is read-only, remove the restriction
if ($readonly) {
    Set-ItemProperty -Path $jsonFile -Name IsReadOnly -Value $false
}

# Create a backup if it does not already exist
if (-Not $backupExists) {
    Copy-Item -Path $jsonFile -Destination $backupFile
}

# Loop to ensure all occurrences are changed
Do {
    $prevContent = $jsonContent
    $jsonContent = $jsonContent -replace '"Disable_(FG|RR|SR|RR_Model|SR_Model)_Override":\s*true', '"Disable_${1}_Override": false'
} Until ($prevContent -eq $jsonContent)

# Save modifications to the file
$jsonContent | Set-Content -Path $jsonFile -Encoding UTF8

# Mark the file as read-only again
Set-ItemProperty -Path $jsonFile -Name IsReadOnly -Value $true

Write-Host ""
Write-Host "[SUCCESS] Modifications applied!"
Pause
