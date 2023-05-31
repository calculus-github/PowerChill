@echo off
Title [EN COURS] Installation by LBINT
mode con cols=80 lines=10 & Color A
Set Fichier=url-prepa.txt
Set Source=%~dp0
Set DownloadFolder=MyDownloadFolder
Set Destination=%Source%%DownloadFolder%
if not exist %DownloadFolder% MD %DownloadFolder%
for /F "delims=" %%i in (%Fichier%) do (echo Downloading "%%i" & call:download "%%i" "%Destination%\%%~ni%%~xi")
exit /b
:download
(echo src = "%~1"
echo Set v1 = CreateObject("MSXML2.XMLHTTP"^)
echo Set FSO = Createobject("Scripting.FileSystemObject"^)
echo v1.open "GET", src, false
echo v1.send
echo If v1.Status = 200 Then
echo Wscript.Echo "Download-Status: " ^& v1.Status ^& " " ^& v1.statusText
echo Set v2 = CreateObject("ADODB.Stream"^)
echo v2.open
echo v2.Type = 1
echo v2.Write v1.ResponseBody
echo If FSO.Fileexists("%~2"^) Then FSO.DeleteFile("%~2"^)
echo v2.Position = 0
echo v2.SaveToFile "%~2"
echo Wscript.Echo "Download-Status: " ^& v1.Status ^& vbTab ^& v1.statusText ^& vbCrlf ^& "%~2",Vbinformation,"Installation logiciels SUCCES!"
echo End If
echo v2.Close
echo Set v1 = Nothing) >"%~dpn0.vbs"
cscript.exe //nologo "%~dpn0.vbs"
del "%~dpn0.vbs" >nul