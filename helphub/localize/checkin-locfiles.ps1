param(
[Parameter(Mandatory = $true)]
[ValidateScript({ Test-Path $_ })]
[string]$FileList,

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

    $files = Get-Content -Path $FileList

    foreach ($sourceFilePath in $files)
    {
        $extension = [System.IO.Path]::GetExtension($sourceFilePath)

        if ($extension -eq ".json")
        {
            $targetFilePath = $sourceFilePath -replace "\.json", ".yml"

            Write-Host ">>>>> Converting [$sourceFilePath] as [$targetFilePath]..."
            & $params.YQCli -P $sourceFilePath | Out-File -FilePath $targetFilePath -Encoding utf8

            if ($LastExitCode -ne 0)
            {
                throw "[$sourceFilePath] conversion failed."
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
