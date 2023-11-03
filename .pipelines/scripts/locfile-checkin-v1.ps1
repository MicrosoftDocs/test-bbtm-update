trap
{
    $error[0] | Out-Host
    Pop-Location
    exit 1
}

$ErrorActionPreference = "Stop"

function Main
{
    $env:BUILD_SOURCESDIRECTORY = "D:\GitHub\MicrosoftDocs\test-bbtm-update"
    $env:BUILD_ARTIFACTSTAGINGDIRECTORY = "D:\GitHub\MicrosoftDocs\test-bbtm-update\a"

    $repoRoot = "$env:BUILD_SOURCESDIRECTORY"
    $artifactsRoot = "$env:BUILD_ARTIFACTSTAGINGDIRECTORY"
    $locFilesBaseDir = [System.IO.Path]::Combine("code", "Microsoft.AzureEmails", "Templates")
    $lclFilesBaseDir = [System.IO.Path]::Combine("Localize", "loc")
    $pullRequestTargetBranch = "$env:BUILD_SOURCEBRANCHNAME"

    $locManifestJson = [System.IO.Path]::Combine($artifactsRoot, "loc", "LocPayload.json")
    $locManifestObj = Get-Content -Path $locManifestJson | ConvertFrom-Json

    SeedLclFiles

    Set-Location $repoRoot

<#
    PrepCheckin
    $pullRequestSourceBranch = CreateNewBranch
    TryStageLocFiles

    $locFilesCount = GetStagedLocFilesCount
    if ($locFilesCount -eq 0)
    {
        Write-Host ">>>>> No loc files to be checked-in."
        return
    }
    else
    {
        Write-Host ">>>>> There are $locFilesCount loc files to be checked-in."
    }

    CheckinLocFiles $pullRequestSourceBranch
#>
}

function SeedLclFiles
{
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

function TryStageLocFiles
{
    Write-Host ">>>>> Trying to stage loc files under [$locFilesBaseDir] in repo..."

    # Limits the scope to localized RESX files such as Foo.ko-kr.resx.
    Write-Host "##[command]git add -- $locFilesBaseDir\*.*.resx"
    git add -- $locFilesBaseDir\*.*.resx
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

function CreateNewBranch
{
    $guid = New-Guid
    $newBranchName = "loc/$guid"

    Write-Host "##[command]git checkout -b $newBranchName"
    git checkout -b $newBranchName
    if ($LastExitCode -ne 0)
    {
        throw "Git checkout error."
    }

    return $newBranchName
}

function GetStagedLocFilesCount
{
    # Limits the scope to localized RESX files such as Foo.ko-kr.resx.
    Write-Host "##[command]git status --porcelain -- $locFilesBaseDir\*.*.resx"
    $stagedLocFiles = @(git status --porcelain -- $locFilesBaseDir\*.*.resx)
    if ($LastExitCode -ne 0)
    {
        throw "Git status error."
    }

    if ($stagedLocFiles.Count -gt 0)
    {
        Write-Host ">>>>> Loc files to be checked-in are..."
        Write-Host "-----"

        foreach ($stagedLocFile in $stagedLocFiles)
        {
            Write-Host $stagedLocFile
        }

        Write-Host "-----"
    }

    return $stagedLocFiles.Count
}

function CheckinLocFiles
{
    param(
        [string]$pullRequestSourceBranch
    )

    Write-Host ">>>>> Checking-in loc files in repo..."

    $message = "Check-in of files from pipeline $env:SYSTEM_DEFINITIONID, build $env:BUILD_BUILDNUMBER"

    Write-Host "##[command]git commit -m $message -- $locFilesBaseDir"
    git commit -m $message -- $locFilesBaseDir
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

    PushChange $pullRequestSourceBranch
    CreateGitHubPullRequest
}

function PushChange
{
    param(
        [string]$pullRequestSourceBranch
    )

    Write-Host ">>>>> Pushing change in repo..."

    $basicAuthToken = GetBasicAuthToken

    Write-Host "##[command]git -c http.extraheader=`"AUTHORIZATION: Basic ***`" push origin $pullRequestSourceBranch"
    git -c http.extraheader="AUTHORIZATION: Basic $basicAuthToken" push origin $pullRequestSourceBranch
    if ($LastExitCode -ne 0)
    {
        throw "Git push error."
    }
}

function GetBasicAuthToken
{

    $authToken = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("pat:$env:BuildRAccessToken"))
    return $authToken
}

function CreateGitHubPullRequest
{
    Write-Host ">>>>> Creating pull request in repo..."

    $env:GH_TOKEN = $env:BuildRAccessToken
    $pullRequestTitle = "Localized file check-in by OneLocBuild Task: Check-in of files from pipeline $env:SYSTEM_DEFINITIONID, build $env:BUILD_BUILDNUMBER"
    $pullRequestBody = "Check-in of files from pipeline $env:SYSTEM_DEFINITIONID, build $env:BUILD_BUILDNUMBER"

    Write-Host "##[command]gh pr create -B $pullRequestTargetBranch -t $pullRequestTitle -b $pullRequestBody"
    $pullRequestUrl = gh pr create -B $pullRequestTargetBranch -t $pullRequestTitle -b $pullRequestBody
    if ($LastExitCode -ne 0)
    {
        throw "gh pr create error."
    }

    Write-Host ">>>>> [$pullRequestUrl] created."
}

Push-Location
. Main
Pop-Location
exit 0
