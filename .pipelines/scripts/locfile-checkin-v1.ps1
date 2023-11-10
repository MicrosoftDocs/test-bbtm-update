param(
    [Parameter(Mandatory = $true)]
    [string]$Pat
)

trap
{
    $error[0] | Out-Host
    Pop-Location
    exit 1
}

$ErrorActionPreference = "Stop"

function Main
{
 #   $env:BUILD_SOURCESDIRECTORY = "D:\GitHub\MicrosoftDocs\test-bbtm-update"
 #   $env:BUILD_ARTIFACTSTAGINGDIRECTORY = "D:\GitHub\MicrosoftDocs\test-bbtm-update\a"
 #   $env:BUILD_SOURCEBRANCHNAME = "dev/jeeyyoo/s2311-meo"

    $repoRoot = "$env:BUILD_SOURCESDIRECTORY"
    $artifactsRoot = "$env:BUILD_ARTIFACTSTAGINGDIRECTORY"

    $locFilesBaseDir = [System.IO.Path]::Combine("code", "Microsoft.AzureEmails", "Templates")
    $lclFilesBaseDir = [System.IO.Path]::Combine("Localize", "loc")

    $pullRequestTargetBranch = "$env:BUILD_SOURCEBRANCH" -replace "^refs/heads/", ""

    $locManifestJson = [System.IO.Path]::Combine($artifactsRoot, "loc", "LocPayload.json")
    $locManifestObj = Get-Content -Path $locManifestJson | ConvertFrom-Json

    $pipelineId = $env:SYSTEM_DEFINITIONID
    $buildNumber = $env:BUILD_BUILDNUMBER
    $commitMessage = "Loc check-in from pipeline $pipelineId, build $buildNumber"
    $pullRequestTitle = "Loc check-in from pipeline $pipelineId, build $buildNumber"
    $pullRequestBody = "Loc check-in from pipeline $pipelineId, build $buildNumber"

    Set-Location -Path $repoRoot

    PrepCheckin
    $pullRequestSourceBranch = CreateNewBranch
    TrySeedLclFiles
    TryStageFiles

    $filesCount = GetStagedFilesCount
    if ($filesCount -eq 0)
    {
        Write-Host ">>>>> No files to check-in."
        return
    }
    else
    {
        Write-Host ">>>>> There are $filesCount files to check-in."
    }

    CheckinFiles -PullRequestSourceBranch $pullRequestSourceBranch
}

# Virtually associates Git commit with Localization Team service account to indicate who makes check-in, this is necessary to make Git push succeed in the end.
function PrepCheckin
{
    Write-Host "##[command]git config user.email csiusers@microsoft.com"
    git config user.email csiusers@microsoft.com
    if ($LastExitCode -ne 0)
    {
        throw "Git config error."
    }

    Write-Host "##[command]git config user.name `"CSI Users`""
    git config user.name "CSI Users"
    if ($LastExitCode -ne 0)
    {
        throw "Git config error."
    }
}

function CreateNewBranch
{
    $guid = New-Guid
    $branchName = "locfiles/$guid"

    Write-Host "##[command]git checkout -b $branchName"
    git checkout -b $branchName
    if ($LastExitCode -ne 0)
    {
        throw "Git checkout error."
    }

    return $branchName
}

function TrySeedLclFiles
{
    Write-Host ">>>>> Trying to seed LCL files under [$lclFilesBaseDir] in repo..."

    $languageSets = @{}

    foreach ($languageSet in $locManifestObj.LanguageSets)
    {
        $languageSets[$languageSet.Name] = $languageSet.Languages -split ";"
    }

    foreach ($project in $locManifestObj.Projects)
    {
        foreach ($locItem in $project.LocItems)
        {
            if (-not ([string]::IsNullOrEmpty($locItem.Languages)))
            {
                $languages = $locItem.Languages -split ";"
            }
            else
            {
                $languages = $languageSets[$project.LanguageSet]
            }

            foreach ($language in $languages)
            {
                $lclFilePath = [System.IO.Path]::Combine($repoRoot, $locItem.LclFile) -replace "\\{Lang}\\", "\$language\"

                if (-not (Test-Path -Path $lclFilePath))
                {
                    Write-Host ">>>>> Seeding [$lclFilePath]..."

                    $lctFilePath = [System.IO.Path]::Combine($artifactsRoot, $locItem.LcgFile) -replace "\\en\\", "\$language\"
                    $lctFilePath = $lctFilePath -replace "\.lcg$", ".lct"

                    $lclFileDir = Split-Path -Path $lclFilePath -Parent
                    [void] [System.IO.Directory]::CreateDirectory($lclFileDir)
                    [System.IO.File]::Copy($lctFilePath, $lclFilePath)
                }
            }
        }
    }
}

function TryStageFiles
{
    Write-Host ">>>>> Trying to stage files under [$locFilesBaseDir] & [$lclFilesBaseDir] in repo..."

    # Limits the scope to localized RESX files such as foo.ko-kr.resx and LCL files like bar.lcl.
    Write-Host "##[command]git add -- $locFilesBaseDir\*.*.resx $lclFilesBaseDir\*.lcl"
    git add -- $locFilesBaseDir\*.*.resx $lclFilesBaseDir\*.lcl
    if ($LastExitCode -ne 0)
    {
        throw "Git add error."
    }

    Write-Host ">>>>> Repo status is..."
    Write-Host "-----"
    Write-Host "##[command]git status"
    git status
    Write-Host "-----"

    if ($LastExitCode -ne 0)
    {
        throw "Git status error."
    }
}

function GetStagedFilesCount
{
    # Limits the scope to localized RESX files such as foo.ko-kr.resx and LCL files like bar.lcl.
    Write-Host "##[command]git status --porcelain -- $locFilesBaseDir\*.*.resx $lclFilesBaseDir\*.lcl"
    $stagedFiles = @(git status --porcelain -- $locFilesBaseDir\*.*.resx $lclFilesBaseDir\*.lcl)
    if ($LastExitCode -ne 0)
    {
        throw "Git status error."
    }

    if ($stagedFiles.Count -gt 0)
    {
        Write-Host ">>>>> Files to check-in are..."
        Write-Host "-----"

        foreach ($stagedFile in $stagedFiles)
        {
            Write-Host $stagedFile
        }

        Write-Host "-----"
    }

    return $stagedFiles.Count
}

function CheckinFiles
{
    param(
        [string]$PullRequestSourceBranch
    )

    Write-Host ">>>>> Checking-in files in repo..."

    Write-Host "##[command]git commit -m `"$commitMessage`" -- $locFilesBaseDir $lclFilesBaseDir"
    git commit -m `"$commitMessage`" -- $locFilesBaseDir $lclFilesBaseDir
    if ($LastExitCode -ne 0)
    {
        throw "Git commit error."
    }

    Write-Host ">>>>> Repo status is..."
    Write-Host "-----"
    Write-Host "##[command]git status"
    git status
    Write-Host "-----"

    if ($LastExitCode -ne 0)
    {
        throw "Git status error."
    }

    PushChange -PullRequestSourceBranch $pullRequestSourceBranch
    $pullRequestId = CreateGitHubPullRequest
    Start-Sleep -Seconds 10
    CompleteGitHubPullRequest -PullRequestId $pullRequestId
}

function PushChange
{
    param(
        [string]$PullRequestSourceBranch
    )

    Write-Host ">>>>> Pushing change in repo..."

    $base64Pat = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("pat:$Pat"))

    Write-Host "##[command]git -c http.extraheader=`"AUTHORIZATION: Basic ***`" push origin $PullRequestSourceBranch"
    git -c http.extraheader="AUTHORIZATION: Basic $base64Pat" push origin $PullRequestSourceBranch
    if ($LastExitCode -ne 0)
    {
        throw "Git push error."
    }
}

function CreateGitHubPullRequest
{
    Write-Host ">>>>> Creating pull request in repo..."

    $env:GH_TOKEN = $Pat

    Write-Host "##[command]gh pr create -B $pullRequestTargetBranch -t `"$pullRequestTitle`" -b `"$pullRequestBody`""
    $pullRequestUrl = gh pr create -B $pullRequestTargetBranch -t `"$pullRequestTitle`" -b `"$pullRequestBody`"
    if ($LastExitCode -ne 0)
    {
        throw "gh pr create error."
    }

    Write-Host ">>>>> [$pullRequestUrl] created."

    # Pull request URL is like https://github.com/Azure/azure-emails/pull/30982, extracts pull request ID from it.
    if ($pullRequestUrl -match "https://github.com/.+?/pull/(\d+)$")
    {
        $pullRequestId = $matches[1]
    }
    else
    {
        throw "[$pullRequestUrl] invalid."
    }

    return $pullRequestId
}

function CompleteGitHubPullRequest
{
    param(
        [string]$PullRequestId
    )

    Write-Host ">>>>> Completing pull request in repo..."

    $env:GH_TOKEN = $Pat

    Write-Host "##[command]gh pr merge $PullRequestId -s"
    gh pr merge $PullRequestId -s
    if ($LastExitCode -ne 0)
    {
        throw "gh pr merge error."
    }
}

Push-Location
. Main
Pop-Location
exit 0
