set IMAGEMAGICK="Y:\ImageMagick-7.0.3-Q8"
for /R input %%f in (*.*) do %IMAGEMAGICK%\magick "input\%%~nf%%~xf" -resize "1024x1024^" -gravity center -crop "1024x1024+0+0" +repage "output\%%~nf%%~xf"
