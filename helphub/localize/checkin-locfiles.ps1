param(
[Parameter(Mandatory = $true)]
[ValidateScript({ Test-Path $_ })]
[string]$FileList,

[Parameter(Mandatory = $true)]
[ValidateScript({ Test-Path $_ })]
[string]$ToolDir,

[Parameter(Mandatory = $true)]
[string]$YQVersion,

[Parameter(Mandatory = $true)]
[string]$GitUserEmail,

[Parameter(Mandatory = $true)]
[string]$GitUserName,

[Parameter(Mandatory = $true)]
[string]$Pat
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

    Write-Host ">>>>> Configuring repo..."
    ConfigureRepo

    $guid = New-Guid
    $pullRequestHeadBranch = "loc/$guid"

    Write-Host ">>>>> Creating pull request branch [$pullRequestHeadBranch] in repo..."
    CreateNewBranch -RepoRootDir -BranchName $pullRequestHeadBranch

    Write-Host ">>>>> Staging files in repo..."
    StageFilesInRepo -Wildcard *.yml
    StageFilesInRepo -Wildcard *.po

    Write-Host ">>>>> Repo status is..."
    ShowRepoStatus

    $filesCount = GetStageFilesCountInRepo -Wildcard *.yml
    $filesCount += GetStageFilesCountInRepo -Wildcard *.po
    if ($filesCount -gt 0)
    {
        Write-Host ">>>>> $filesCount files available to be checked-in in repo."
    }
    else
    {
        Write-Host ">>>>> No files available to be checked-in in repo."
        return
    }

    Write-Host ">>>>> Committing files in repo..."
    CommitFilesInRepo

    Write-Host ">>>>> Pushing change in repo..."
    PushChangeInRepo -BranchName $pullRequestHeadBranch

    Write-Host ">>>>> Creating pull request in repo..."
    $pullRequestUrl = CreatePullRequest

    Write-Host ">>>>> $pullRequestUrl created."
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

    Set-Location -Path $env:BUILD_SOURCESDIRECTORY

    $commitMessage = "Check-in of files from pipeline $env:SYSTEM_DEFINITIONID, build $env:BUILD_BUILDNUMBER"
    $pullRequestTitle = "Check-in of files from pipeline $env:SYSTEM_DEFINITIONID, build $env:BUILD_BUILDNUMBER"
    $pullRequestBody = "Check-in of files from pipeline $env:SYSTEM_DEFINITIONID, build $env:BUILD_BUILDNUMBER"

    $paramsObj = [PSCustomObject]@{
        YQCli = $yqLocalFilePath;
        RepoRoot = $env:BUILD_SOURCESDIRECTORY;
        GitUserEmail = $GitUserEmail;
        GitUserName = $GitUserName;
        CommitMessage = $commitMessage;
        PullRequestTitle = $pullRequestTitle;
        PullRequestBody = $pullRequestBody;
        Pat = $Pat;
        PullRequestBaseBranch = $env:BUILD_SOURCEBRANCH;
    }

    return $paramsObj
}

function ConfigureRepo
{
    Write-Host "##[command]git config user.email $($params.GitUserEmail)"
    git config user.email $params.GitUserEmail
    if ($LastExitCode -ne 0)
    {
        throw "Git config error."
    }

    Write-Host "##[command]git config user.name `"$($params.GitUserName)`""
    git config user.name "$($params.GitUserName)"
    if ($LastExitCode -ne 0)
    {
        throw "Git config error."
    }
}

function CreateNewBranch
{
    param(
        [string]$BranchName
    )

    Write-Host "##[command]git checkout -b $BranchName"
    git checkout -b $BranchName
    if ($LastExitCode -ne 0)
    {
        throw "Git checkout error."
    }
}

function StageFilesInRepo
{
    param(
        [string]$Wildcard
    )

    Write-Host "##[command]git add -- `"$($params.RepoRoot)\$Wildcard`""
    git add -- "$($params.RepoRoot)\$Wildcard"
    if ($LastExitCode -ne 0)
    {
        throw "Git add error."
    }
}

function ShowRepoStatus
{
    Write-Host "-----"
    Write-Host "##[command]git status"
    git status
    Write-Host "-----"

    if ($LastExitCode -ne 0)
    {
        throw "Git status error."
    }
}

function GetStageFilesCountInRepo
{
    param(
        [string]$Wildcard
    )

    Write-Host "##[command]git status --porcelain -- `"$($params.RepoRoot)\$Wildcard`""
    $stagedFiles = @(git status --porcelain -- "$($params.RepoRoot)\$Wildcard")
    if ($LastExitCode -ne 0)
    {
        throw "Git status error."
    }

    return $stagedFiles.Count
}

function CommitFilesInRepo
{
    Write-Host "##[command]git commit -m `"$($params.CommitMessage)`" -- `"$($params.RepoRoot)`""
    git commit -m "$($params.CommitMessage)" -- "$($params.RepoRoot)"
    if ($LastExitCode -ne 0)
    {
        throw "Git commit error."
    }
}

function GetB64Pat
{
    param(
        [string]$Pat
    )

    $b64Pat = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("username:$Pat"))
    return $b64Pat
}

function PushChangeInRepo
{
    param(
        [string]$BranchName
    )

    $b64Pat = GetB64Pat -Pat $params.Pat

    Write-Host "##[command]git -c http.extraheader=`"Authorization: Basic ***`" push origin $BranchName"
    git -c http.extraheader="Authorization: Basic $b64Pat" push origin $BranchName
    if ($LastExitCode -ne 0)
    {
        throw "Git push error."
    }
}

function CreatePullRequest
{
    $env:GH_TOKEN = $params.Pat

    Write-Host "##[command]gh pr create -B $($params.PullRequestBaseBranch) -t `"$($params.PullRequestTitle)`" -b `"$($params.PullRequestBody)`""
    $pullRequestUrl = gh pr create -B $($params.PullRequestBaseBranch) -t "$($params.PullRequestTitle)" -b "$($params.PullRequestBody)"
    if ($LastExitCode -ne 0)
    {
        throw "gh pr create error."
    }

    return $pullRequestUrl
}

. Main

exit 0
