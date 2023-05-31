@echo off
Title [EN COURS] Installation des programmes pour LBINT
mode con cols=80 lines=10 & Color A
Set "Fichier=url-prepa.txt"
Set "Source=%~dp0"
Set "DownloadFolder=MyDownloadFolder"
Set "Destination=%Source%%DownloadFolder%"

if not exist "%DownloadFolder%" (
    mkdir "%DownloadFolder%")
for /F "usebackq delims=" %%i in ("%Fichier%") do (echo Téléchargement de "%%i" call :download "%%i" "%Destination%\%%~nxi")
exit /b
:download
echo src = "%~1"
echo Set objHTTP = CreateObject("WinHttp.WinHttpRequest.5.1"^)
echo Set objFSO = CreateObject("Scripting.FileSystemObject"^)
echo objHTTP.open "GET", src, false
echo objHTTP.send
echo If objHTTP.Status = 200 Then
echo     Wscript.Echo "Statut du téléchargement : " ^& objHTTP.Status ^& " " ^& objHTTP.statusText
echo     Set objStream = CreateObject("ADODB.Stream"^)
echo     objStream.open
echo     objStream.Type = 1
echo     objStream.Write objHTTP.ResponseBody
echo     If objFSO.FileExists("%~2"^) Then
echo         objFSO.DeleteFile "%~2"
echo     End If
echo     objStream.Position = 0
echo     objStream.SaveToFile "%~2"
echo     Wscript.Echo "Statut du téléchargement : " ^& objHTTP.Status ^& vbTab ^& objHTTP.statusText ^& vbCrlf ^& "%~2", VbInformation, "Installation des logiciels RÉUSSIE !"
echo End If
echo objStream.Close
echo Set objHTTP = Nothing
goto :eof
