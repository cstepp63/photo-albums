# This script lives in photo-albums\Tools, so the project folder is one level above Tools.
$projectRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$albumFolderName = Read-Host 'Enter the album folder name (example: 2026 Maritimes)'
$albumPath = Join-Path $projectRoot $albumFolderName
$emDash = [char]0x2014
$slideIndent = '                    '

if (-not (Test-Path -LiteralPath $albumPath -PathType Container)) {
    Write-Host "Album folder not found: $albumPath"
    Read-Host 'Press Enter to close this window'
    exit
}

$albumFileName = $albumFolderName.ToLower().Trim() -replace '[^a-z0-9]+', '-'
$albumFileName = $albumFileName.Trim('-')
$outputPath = Join-Path $projectRoot "$albumFileName-list.txt"

Get-ChildItem -LiteralPath $albumPath -Recurse -File |
Where-Object { $_.Extension -match '^\.(jpg|jpeg|png|mp4)$' } |
Sort-Object { [regex]::Replace($_.FullName, '\d+', { $args[0].Value.PadLeft(5, '0') }) } |
ForEach-Object {
    $relPath = $_.FullName.Substring($projectRoot.Length).TrimStart('\') -replace '\\', '/'
    $pathParts = $relPath -split '/'
    $dateFolder = if ($pathParts.Count -ge 3) { $pathParts[1] } else { $albumFolderName }
    $locFolder = if ($pathParts.Count -ge 4) { $pathParts[2] -replace '^\d+-', '' } else { 'Album image' }

    "$slideIndent{ src: `"$relPath`", day: `"$dateFolder $emDash $locFolder`", caption: `"`" },"
} |
Out-File -FilePath $outputPath -Encoding utf8

Write-Host "Finished. Your list is here: $outputPath"
Write-Host "Move this file into the '$albumFolderName' folder when you are ready to keep it with that album."
Read-Host 'Press Enter to close this window'
