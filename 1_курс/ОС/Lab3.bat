@ECHO OFF
for /f %%a in ('wmic path win32_LocalTime get * /value^|findstr /br "Day Month Year"') do set "%%a"
echo %Month%
if %Month%==3 MD Free 
"D:\winrar\winrar.exe" a -r D:\%INSERT_WAY%\%INSERT_.RAR%.rar C:\%INSERT_EXECUTABLE%.exe
pause