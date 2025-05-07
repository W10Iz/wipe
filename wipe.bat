@ECHO OFF
REM  QBFC Project Options Begin
REM  HasVersionInfo: No
REM Companyname: 
REM Productname: 
REM Filedescription: 
REM Copyrights: 
REM Trademarks: 
REM Originalname: 
REM Comments: 
REM Productversion:  0. 0. 0. 0
REM Fileversion:  0. 0. 0. 0
REM Internalname: 
REM ExeType: console
REM Architecture: x64
REM Appicon: 
REM AdministratorManifest: No
REM  QBFC Project Options End
@ECHO ON
@echo off 
title AMANCIO WIPE - Limpeza Profunda
color 0A

:: Exibe a palavra "AMANCIO" em uma fonte de estilo pixel art
cls
echo.
echo    AAAAA   M   M   AAAAA   N   N   CCCC   III   OOO  
echo   A     A  MM MM  A     A  NN  N  C       I   O   O 
echo   AAAAAAA  M M M  AAAAAAA  N N N  C       I   O   O
echo   A     A  M   M  A     A  N  NN  C       I   O   O
echo   A     A  M   M  A     A  N   N  CCCC   III   OOO  
echo.
echo    ================================
echo    AMANCIO WIPE - Limpeza Profunda
echo    ================================
echo.
echo    Por favor, aguarde enquanto realizamos a limpeza...
echo.

:: Verifica se o script está sendo executado como Administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Este script deve ser executado como ADMINISTRADOR.
    pause
    exit /b
)

:: Caminhos de diretórios temporários e logs
set TEMP_DIR=%TEMP%
set LOG_DIR=C:\Users\%USERNAME%\AppData\Local\Temp

:: Inicializa o log de execução
set LOG_FILE=%TEMP%\wipe_log_%RANDOM%.txt
echo ======================================== >> "%LOG_FILE%"
echo     🧹 AMANCIO WIPE - INICIANDO LIMPEZA     >> "%LOG_FILE%"
echo ======================================== >> "%LOG_FILE%"

:: Interface bonita - Animação de carregamento
set /a count=0
:loading
if %count% lss 10 (
    echo. 
    echo    Carregando %count%...
    set /a count+=1
    ping localhost -n 2 >nul
    goto loading
)

:: 1. Apagar arquivos temporários e cache
echo [1/21] Limpando arquivos temporários...
echo [1/21] Limpando arquivos temporários... >> "%LOG_FILE%"
del /F /Q "%TEMP_DIR%\*" >> "%LOG_FILE%" 2>&1
rd /S /Q "%TEMP_DIR%" >> "%LOG_FILE%" 2>&1

:: 2. Limpar Prefetch
echo [2/21] Limpando Prefetch...
echo [2/21] Limpando Prefetch... >> "%LOG_FILE%"
del /F /Q C:\Windows\Prefetch\* >> "%LOG_FILE%" 2>&1

:: 3. Limpar Histórico de Navegadores (Chrome, Edge)
echo [3/21] Limpando histórico de navegadores...
echo [3/21] Limpando histórico de navegadores... >> "%LOG_FILE%"
del /F /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\History" >> "%LOG_FILE%" 2>&1
del /F /Q "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\History" >> "%LOG_FILE%" 2>&1

:: 4. Limpar Histórico do Brave
echo [4/21] Limpando histórico do Brave...
echo [4/21] Limpando histórico do Brave... >> "%LOG_FILE%"
del /F /Q "%USERPROFILE%\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\History" >> "%LOG_FILE%" 2>&1

:: 5. Limpar Histórico do Opera
echo [5/21] Limpando histórico do Opera...
echo [5/21] Limpando histórico do Opera... >> "%LOG_FILE%"
del /F /Q "%USERPROFILE%\AppData\Roaming\Opera Software\Opera Stable\History" >> "%LOG_FILE%" 2>&1

:: 6. Limpar Histórico do Firefox
echo [6/21] Limpando histórico do Firefox...
echo [6/21] Limpando histórico do Firefox... >> "%LOG_FILE%"
del /F /Q "%USERPROFILE%\AppData\Roaming\Mozilla\Firefox\Profiles\*.default-release\places.sqlite" >> "%LOG_FILE%" 2>&1

:: 7. Limpar Cache DNS
echo [7/21] Limpando cache DNS...
echo [7/21] Limpando cache DNS... >> "%LOG_FILE%"
ipconfig /flushdns >> "%LOG_FILE%" 2>&1

:: 8. Limpar Cache da Windows Store
echo [8/21] Limpando cache da Windows Store...
echo [8/21] Limpando cache da Windows Store... >> "%LOG_FILE%"
wsreset.exe >> "%LOG_FILE%" 2>&1

:: 9. Limpar Arquivos de Memória de Aplicativos
echo [9/21] Limpando arquivos de memória de aplicativos...
echo [9/21] Limpando arquivos de memória de aplicativos... >> "%LOG_FILE%"
del /F /Q "%APPDATA%\Microsoft\Windows\Recent\*" >> "%LOG_FILE%" 2>&1

:: 10. Limpar Cache de Miniaturas
echo [10/21] Limpando cache de miniaturas...
echo [10/21] Limpando cache de miniaturas... >> "%LOG_FILE%"
del /F /Q "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer\thumbcache*" >> "%LOG_FILE%" 2>&1

:: 11. Limpar Dados do Cortana
echo [11/21] Limpando dados do Cortana...
echo [11/21] Limpando dados do Cortana... >> "%LOG_FILE%"
del /F /Q "%LOCALAPPDATA%\Packages\Microsoft.Windows.Cortana_8wekyb3d8bbwe\LocalState\*" >> "%LOG_FILE%" 2>&1

:: 12. Limpar Crash Dumps do Sistema
echo [12/21] Limpando Crash Dumps do Sistema...
echo [12/21] Limpando Crash Dumps do Sistema... >> "%LOG_FILE%"
del /F /Q "C:\Windows\Memory.dmp" >> "%LOG_FILE%" 2>&1
del /F /Q "C:\Windows\Minidump\*" >> "%LOG_FILE%" 2>&1

:: 13. Limpar Crash Dumps no AppData
echo [13/21] Limpando Crash Dumps do AppData...
echo [13/21] Limpando Crash Dumps do AppData... >> "%LOG_FILE%"
rd /S /Q "%USERPROFILE%\AppData\Local\CrashDumps" >> "%LOG_FILE%" 2>&1

:: 14. Limpar a pasta do AnyDesk
echo [14/21] Limpando a pasta do AnyDesk em AppData...
echo [14/21] Limpando a pasta do AnyDesk em AppData... >> "%LOG_FILE%"
rd /S /Q "%USERPROFILE%\AppData\Local\AnyDesk" >> "%LOG_FILE%" 2>&1
rd /S /Q "%USERPROFILE%\AppData\Roaming\AnyDesk" >> "%LOG_FILE%" 2>&1

:: 15. Limpar Histórico do PowerShell
echo [15/21] Limpando histórico do PowerShell...
echo [15/21] Limpando histórico do PowerShell... >> "%LOG_FILE%"
del /F /Q "%APPDATA%\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt" >> "%LOG_FILE%" 2>&1

:: 16. Limpar Logs de Eventos
echo [16/21] Limpando Logs de Eventos do Sistema...
echo [16/21] Limpando Logs de Eventos do Sistema... >> "%LOG_FILE%"
for /f %%x in ('wevtutil el') do (
    wevtutil cl "%%x" >> "%LOG_FILE%" 2>&1
)

:: 17. Limpar USN Journal
echo [17/21] Limpando USN Journal...
echo [17/21] Limpando USN Journal... >> "%LOG_FILE%"
fsutil usn deletejournal /d C: >> "%LOG_FILE%" 2>&1

:: 18. Limpar Shadow Copies
echo [18/21] Limpando Shadow Copies...
echo [18/21] Limpando Shadow Copies... >> "%LOG_FILE%"
vssadmin delete shadows /for=C: /all /quiet >> "%LOG_FILE%" 2>&1

:: 19. Limpar Arquivos de Instalação Temporários
echo [19/21] Limpando arquivos de instalação temporários...
echo [19/21] Limpando arquivos de instalação temporários... >> "%LOG_FILE%"
del /F /Q "C:\Windows\Installer\*.log" >> "%LOG_FILE%" 2>&1

:: 20. Limpar Arquivos de Atualizações do Windows
echo [20/21] Limpando arquivos de atualizações do Windows...
echo [20/21] Limpando arquivos de atualizações do Windows... >> "%LOG_FILE%"
del /F /Q "C:\Windows\SoftwareDistribution\Download\*" >> "%LOG_FILE%" 2>&1

:: 21. Limpar cache de navegadores e logs de programas
echo [+] Limpando cache de navegadores...
del /F /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*"

echo [+] Limpando logs de programas...
del /F /Q "%LOG_DIR%\wipe_log*" >> "%LOG_FILE%" 2>&1

:: Por último: deletar o próprio log do script
echo [+] Limpando log gerado em: %LOG_FILE%
del "%LOG_FILE%" /F /Q

:: Fim do processo
cls
echo.
echo    ================================
echo    AMANCIO WIPE - LIMPEZA FINALIZADA
echo    ================================
echo.
echo    ✔️ Limpeza concluída com sucesso!
echo.
pause
