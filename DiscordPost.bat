@echo off
setlocal EnableDelayedExpansion

set "content="
echo Enter the content to be posted. Press :ws on a new line to send.
:readmore
set "line="
set /P "line="
if "!line!" == ":ws" goto :send
set "line=!line:LF=\n!"
set "content=!content! !line!"
goto :readmore

:send
set /p webhook=Enter the Discord webhook link:

set "content=!content:LF=\n!"
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"%content:~1%\"}" %webhook%
