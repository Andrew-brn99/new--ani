@echo off
setlocal enabledelayedexpansion

REM Тип файлов
set FILE_TYPE=webp

set COUNT=1

REM Шаг 1: временные имена (сохраняем исходный порядок)
for /f "tokens=*" %%f in ('dir /b /on *.%FILE_TYPE%') do (
    ren "%%f" "temp_!COUNT!.%FILE_TYPE%"
    set /a COUNT+=1
)

set /a TOTAL=COUNT-1

REM Шаг 2: финальные имена строго по порядку номеров
for /l %%i in (1,1,!TOTAL!) do (
    ren "temp_%%i.%FILE_TYPE%" "%%i.%FILE_TYPE%"
)

echo Ready! Renamed: !TOTAL!
pause