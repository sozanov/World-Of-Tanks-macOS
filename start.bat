@echo off

if exist "C:\Games\Tanki\game_info.xml.bak" DEL "C:\Games\Tanki\game_info.xml.bak"

if exist "C:\Games\Tanki\WorldOfTanks.exe" (
	COPY "C:\Games\done\app_type.xml" "C:\Games\Tanki\app_type.xml"
	COPY "C:\Games\done\game_info.xml" "C:\Games\Tanki\game_info.xml"
	START "" "C:\Games\Tanki\WorldOfTanks.exe"
) else (
	COPY "C:\Games\new\app_type.xml" "C:\Games\Tanki\app_type.xml"
	COPY "C:\Games\new\game_info.xml" "C:\Games\Tanki\game_info.xml"
	COPY "C:\Games\preferences.xml" "C:\Program Files (x86)\Lesta\GameCenter\preferences.xml"
	START "" "C:\Program Files (x86)\Lesta\GameCenter\lgc.exe"
)

EXIT