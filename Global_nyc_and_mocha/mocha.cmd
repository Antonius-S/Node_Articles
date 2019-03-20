:: This batch launches globally installed mocha entry point
@ECHO OFF
SETLOCAL

SET NodeDir=
FOR /F %%S IN ('where node.exe') DO SET NodeDir=%%~dpS
IF NOT DEFINED NodeDir ECHO Node.exe not found in path && PAUSE && GOTO :EOF

node  "%NodeDir%\node_modules\mocha\bin\mocha" %*