param(
[Parameter(Mandatory = $true)]
[ValidateScript({ Test-Path $_ })]
[string]$RepoRoot,

[Parameter(Mandatory = $true)]
[ValidateScript({ Test-Path $_ })]
[string]$ManifestFile,

[Parameter(Mandatory = $true)]
[ValidateScript({ Test-Path $_ })]
[string]$ToolDir,

[Parameter(Mandatory = $true)]
[string]$YQVersion
)

trap
{
    $error[0] | Out-Host
    exit 1
}

$ErrorActionPreference = "Stop"

function Main
{
    $params = Configure

    $projects = (Get-Content -Raw $ManifestFile | ConvertFrom-Json).Projects

    foreach ($project in $projects)
    {
        foreach ($locItem in $project.LocItems)
        {
            $extension = [System.IO.Path]::GetExtension($locItem.SourceFile)

            if ($extension -eq ".json")
            {
                $relativeSourceFilePath = $locItem.SourceFile -replace "\.json", ".yml"
                $sourceFilePath = [System.IO.Path]::Combine($RepoRoot, $relativeSourceFilePath)
                $targetFilePath = [System.IO.Path]::Combine($RepoRoot, $locItem.SourceFile)

                Write-Host ">>>>> Converting [$sourceFilePath] as [$targetFilePath]..."
                & $params.YQCli -o=json $sourceFilePath | Out-File -FilePath $targetFilePath -Encoding utf8

                if ($LastExitCode -ne 0)
                {
                    throw "[$sourceFilePath] conversion failed."
                }
            }
        }
    }
}

function Configure
{
    $OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object -TypeName System.Text.UTF8Encoding

    $yqRemoteFilePath = "https://github.com/mikefarah/yq/releases/download/$YQVersion/yq_windows_amd64.exe"
    $yqLocalFilePath = [System.IO.Path]::Combine($ToolDir, "yq", "yq.exe");
    $yqLocalFileDir = Split-Path -Path $yqLocalFilePath -Parent
    [void] [System.IO.Directory]::CreateDirectory($yqLocalFileDir)

    Write-Host ">>>>> Downloading [$yqRemoteFilePath] as [$yqLocalFilePath]..."
    Invoke-WebRequest -Uri $yqRemoteFilePath -OutFile $yqLocalFilePath

    $paramsObj = [PSCustomObject]@{
        YQCli = $yqLocalFilePath;
    }

    return $paramsObj
}

. Main

exit 0
