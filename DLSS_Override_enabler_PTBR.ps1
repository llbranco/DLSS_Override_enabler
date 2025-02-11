$jsonFile = "$env:LOCALAPPDATA\NVIDIA Corporation\NVIDIA app\NvBackend\ApplicationStorage.json"
$backupFile = "$jsonFile.backup"

# Verifica se o arquivo existe
$fileExists = Test-Path $jsonFile
if (-Not $fileExists) {
    Write-Host "[ERROR] The file ApplicationStorage.json was not found!"
    pause
    exit
}

# Verifica se o arquivo está marcado como somente leitura
$readonly = (Get-Item $jsonFile).IsReadOnly

# Verifica se o backup já existe
$backupExists = Test-Path $backupFile

# Lê o conteúdo do arquivo JSON
$jsonContent = Get-Content -Path $jsonFile -Raw

# Verifica se alguma mudança é necessária
$changesNeeded = $jsonContent -match '"Disable_(FG|RR|SR|RR_Model|SR_Model)_Override":\s*true'

# Exibir menu com informações
Clear-Host
Write-Host "======================================================="
Write-Host "                  DLSS_Override_enabler"
Write-Host "   https://github.com/llbranco/DLSS_Override_enabler"
Write-Host "======================================================="
Write-Host ""
Write-Host "Arquivo encontrado: $($fileExists -as [string])"
Write-Host "Somente leitura: $($readonly -as [string])"
Write-Host "Backup existente: $($backupExists -as [string])"
Write-Host "Modificacoes necessarias: $($changesNeeded -as [string])"
Write-Host ""
Write-Host "[AVISO] Este script modifica o arquivo ApplicationStorage.json."
Write-Host "Nao ha garantias, use por sua conta e risco!"
Write-Host ""
Pause

# Se o arquivo estiver somente leitura, remover essa restrição
if ($readonly) {
    Set-ItemProperty -Path $jsonFile -Name IsReadOnly -Value $false
}

# Criar backup se ainda não existir
if (-Not $backupExists) {
    Copy-Item -Path $jsonFile -Destination $backupFile
}

# Loop para garantir que todas as ocorrências sejam alteradas
Do {
    $prevContent = $jsonContent
    $jsonContent = $jsonContent -replace '"Disable_(FG|RR|SR|RR_Model|SR_Model)_Override":\s*true', '"Disable_${1}_Override":false'
} Until ($prevContent -eq $jsonContent)

# Salvar as modificações no arquivo
$jsonContent | Set-Content -Path $jsonFile -Encoding UTF8

# Marcar o arquivo como somente leitura novamente
Set-ItemProperty -Path $jsonFile -Name IsReadOnly -Value $true

Write-Host ""
Write-Host "[SUCESSO] Modificacoes aplicadas!"
Pause
