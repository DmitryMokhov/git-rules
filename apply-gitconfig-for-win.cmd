git config --local include.path "../.gitconfig-for-win"

REM setting up absolute path to visual studio code
if exist "%ProgramFiles(x86)%\Microsoft VS Code\Code.exe" (
    git config --local difftool.vscode.path "%ProgramFiles(x86)%\Microsoft VS Code\Code.exe"
	git config --local difftool.vscode.cmd "%ProgramFiles(x86)%\Microsoft VS Code\Code.exe --wait --diff $LOCAL $REMOTE"
    git config --local mergetool.vscode.path "%ProgramFiles(x86)%\Microsoft VS Code\Code.exe"
	git config --local mergetool.vscode.cmd "%ProgramFiles(x86)%\Programs\Microsoft VS Code\Code.exe --wait $MERGED"
)
if exist "%ProgramFiles%\Microsoft VS Code\Code.exe" (
    git config --local difftool.vscode.path "%ProgramFiles%\Microsoft VS Code\Code.exe"
	git config --local difftool.vscode.cmd "%ProgramFiles%\Microsoft VS Code\Code.exe --wait --diff $LOCAL $REMOTE"
    git config --local mergetool.vscode.path "%ProgramFiles%\Microsoft VS Code\Code.exe"
	git config --local mergetool.vscode.cmd "%ProgramFiles%\Programs\Microsoft VS Code\Code.exe --wait $MERGED"
)
if exist "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe" (
    git config --local difftool.vscode.path "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe"
	git config --local difftool.vscode.cmd "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe --wait --diff $LOCAL $REMOTE"
    git config --local mergetool.vscode.path "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe"
	git config --local mergetool.vscode.cmd "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe --wait $MERGED"
)

REM setting anonymous name and email if not configured by user
for /f %%i in ('git config --get user.email') do set GitUserEmail=%%i
echo %GitUserEmail%

if [%GitUserEmail%] == [] (
    git config --local user.email "johndoe@example.com"
)

for /f %%i in ('git config --get user.name') do set GitUserName=%%i
echo %GitUserName%

if [%GitUserName%] == [] (
    git config --local user.name "John Doe"
)
