@echo off
setlocal enabledelayedexpansion

:: 1. 삭제 제외 목록 설정 (공백으로 구분)
set "EXCLUDE_LIST=privacy .nojekyll google76ab04133a6c0b8a.html robots.txt sitemap.xml clean_site.bat"

echo Starting cleanup process...
echo -------------------------------------------

:: 2. 현재 디렉토리의 파일 삭제 (제외 목록 확인)
for %%F in (*) do (
    set "skip="
    for %%E in (%EXCLUDE_LIST%) do (
        if /I "%%F"=="%%E" set skip=1
    )
    
    if not defined skip (
        echo Deleting file: %%F
        del /f /q "%%F"
    )
)

:: 3. 현재 디렉토리의 폴더 삭제 (제외 목록 확인)
for /d %%D in (*) do (
    set "skip="
    for %%E in (%EXCLUDE_LIST%) do (
        if /I "%%D"=="%%E" set skip=1
    )
    
    if not defined skip (
        echo Deleting folder: %%D
        rd /s /q "%%D"
    )
)

echo -------------------------------------------
echo Cleanup complete!
pause