Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "%USERPROFILE%\bashShortcuts\bin\terminator.bat" & Chr(34), 0
Set WshShell = Nothing
