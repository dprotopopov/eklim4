set IMAGEMAGICK="Y:\ImageMagick-7.0.3-Q8"
for /R input %%f in (*.*) do call :Foo %%~nxsf
goto End

:Foo
 %IMAGEMAGICK%\magick "input\%1" -ping -format %%w info: > temp
 set /p WIDTH= < temp
 %IMAGEMAGICK%\magick "input\%1" -ping -format %%h info: > temp
 set /p HEIGHT=  < temp
 del temp
 if %WIDTH% GEQ %HEIGHT% (set SIZE=%HEIGHT%)
 if %WIDTH% LEQ %HEIGHT% (set SIZE=%WIDTH%)
 %IMAGEMAGICK%\magick "input\%1" -gravity center -crop "%SIZE%x%SIZE%+0+0" +repage "output\%1"
goto :eof

:End