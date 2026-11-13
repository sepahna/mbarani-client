$ErrorActionPreference = "Stop"

$ClientDir = Join-Path $PSScriptRoot "..\apps\client"
$ClientDir = [System.IO.Path]::GetFullPath($ClientDir)
$TempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("mbarani-flutter-" + [guid]::NewGuid().ToString("N"))

if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
    throw "Flutter SDK was not found in PATH. Install Flutter stable and reopen PowerShell."
}

New-Item -ItemType Directory -Path $TempDir | Out-Null

try {
    flutter create --platforms=windows,android --project-name=mbarani_client $TempDir
    if ($LASTEXITCODE -ne 0) { throw "flutter create failed with exit code $LASTEXITCODE" }

    foreach ($Platform in @("windows", "android")) {
        $Source = Join-Path $TempDir $Platform
        $Destination = Join-Path $ClientDir $Platform
        if (Test-Path $Destination) {
            throw "Refusing to overwrite existing platform folder: $Destination"
        }
        Copy-Item -Recurse $Source $Destination
    }

    Write-Host "Generated Windows and Android runners in $ClientDir"
    Write-Host "Next: cd apps/client; flutter pub get; flutter analyze"
}
finally {
    if (Test-Path $TempDir) {
        Remove-Item -Recurse -Force $TempDir
    }
}
