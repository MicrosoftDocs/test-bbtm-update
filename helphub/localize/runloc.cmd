setlocal

chcp 65001
set NUGET_PACKAGES=D:\share\LocBuildTools\packages
set LSBuildWarningLevel=4
set RepoRoot=D:\GitHub\MicrosoftDocs\test-bbtm-update
set OutDir=D:\GitHub\MicrosoftDocs\test-bbtm-update\helphub\localize\out
set LocProject=D:\GitHub\MicrosoftDocs\test-bbtm-update\helphub\localize\locproject.json

D:\share\LocBuildTools\packages\Localization.XLoc.2.0.7\tools\netfx\Microsoft.Localization.XLoc.exe /f "%LocProject%"
