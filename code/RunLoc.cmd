setlocal
chcp 65001

set NUGET_PACKAGES=D:\share\LocBuildTools\packages
set RepoRoot=D:\GitHub\MicrosoftDocs\test-bbtm-update
set OutDir=D:\GitHub\MicrosoftDocs\test-bbtm-update\a
set LocProject=%RepoRoot%\Localize\LocProject.json

D:\share\LocBuildTools\packages\Localization.XLoc.2.0.6\tools\netfx\Microsoft.Localization.XLoc.exe /f "%LocProject%"
