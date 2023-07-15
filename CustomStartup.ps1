function RunAsync($FilePath,$Arguments,$WinTitle){
    $command = "Start-Process -FilePath ""$FilePath"""
    $folderPath = $(Split-Path -Path $FilePath -Parent)
    if($folderPath -ne ""){$command = $command + " -WorkingDirectory ""$folderPath"""}
    if($Arguments -ne $null){$command = $command + $Arguments}

    echo $command
    Invoke-Expression $command

    if($WinTitle -ne $null){
        While((Get-Process|Where-Object {$_.MainWindowTitle -like $WinTitle}) -eq $null){
            SLEEP 0.5
        }
    }
}

RunAsync "C:\Users\PRO\Documents\Projects\AutoHotkey\Scripts\ScreenLock.ahk"
RunAsync "C:\Program Files (x86)\PicPick\picpick.exe"
RunAsync "C:\Program Files\obs-studio\bin\64bit\obs64.exe" ' -ArgumentList "--startreplaybuffer --minimize-to-tray"'
RunAsync "explorer.exe"
RunAsync "C:\Program Files (x86)\Notepad++\notepad++.exe" -WinTitle "* - Notepad++"
RunAsync "Code" ' -ArgumentList "-n -g ""C:\Users\PRO\Documents\Projects\AutoHotkey"""' -WinTitle "*AutoHotkey - Visual Studio Code"
RunAsync "Code" ' -ArgumentList "-n -g ""C:\Users\PRO\Documents\Projects\MyChromeExtension"""' -WinTitle "*MyChromeExtension - Visual Studio Code"
RunAsync "Code" ' -ArgumentList "-n -g ""C:\Users\PRO\Documents\Projects\SeleniumProject"""' -WinTitle "*SeleniumProject - Visual Studio Code"
RunAsync "C:\Users\PRO\Documents\タスク管理.xlsm" -WinTitle "*タスク管理.xlsm*"
RunAsync "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -WinTitle "* - Google Chrome"
RunAsync "C:\Program Files\Google\Drive File Stream\launch.bat"
exit

# メモ
# -WindowStyle Hidden
# Get-Process|Where-Object {$_.MainWindowTitle}|Format-Table MainWindowTitle
