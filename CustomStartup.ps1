function RunAsync($FilePath,$ArgumentList,$Options,$WinTitle,$HideWin,$CloseWin){
    $command = "Start-Process -FilePath ""$FilePath"""
    $folderPath = $(Split-Path -Path $FilePath -Parent)
    if($folderPath -ne ""){$command = $command + " -WorkingDirectory ""$folderPath"""}
    if($ArgumentList -ne $null){$command = $command + " -ArgumentList ""$ArgumentList"""}
    if($Options -ne $null){$command = $command + " $Options"}

    echo $command
    Invoke-Expression $command

    if($WinTitle -ne $null){
        While((Get-Process|Where-Object {$_.MainWindowTitle -like $WinTitle}) -eq $null){
            SLEEP 0.5
        }
    }

    if($HideWin){
        $Signature = @"
        [DllImport("user32.dll")]public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
"@
        $ShowWindowAsync = Add-Type -MemberDefinition $Signature -Name "Win32ShowWindowAsync" -Namespace Win32Functions -PassThru
        $ShowWindowAsync::ShowWindowAsync((Get-Process|Where-Object {$_.MainWindowTitle -like "*$WinTitle*"}).MainWindowHandle, 6)
    }
    if($CloseWin){
        (Get-Process|Where-Object {$_.MainWindowTitle -like $WinTitle}).CloseMainWindow()
    }
}

RunAsync "C:\Projects\AutoHotkey\Scripts\ScreenLock.ahk"
RunAsync "C:\Program Files\Google\Drive File Stream\launch.bat"
RunAsync "C:\Program Files (x86)\PicPick\picpick.exe"
RunAsync "C:\Program Files\obs-studio\bin\64bit\obs64.exe" "--startreplaybuffer --minimize-to-tray"
RunAsync "explorer.exe"
RunAsync "C:\Program Files (x86)\Notepad++\notepad++.exe" -WinTitle "* - Notepad++"
RunAsync "Code" "C:\Projects\AutoHotkey" -Options "-WindowStyle Hidden" -WinTitle "*AutoHotkey - Visual Studio Code"
RunAsync "Code" "C:\Projects\MyChromeExtension" -Options "-WindowStyle Hidden" -WinTitle "*MyChromeExtension - Visual Studio Code"
# RunAsync "Code" "C:\Projects\CustomStartup" -Options "-WindowStyle Hidden" -WinTitle "*CustomStartup - Visual Studio Code"
# RunAsync "Code" "C:\Projects\SeleniumProject" -Options "-WindowStyle Hidden" -WinTitle "*SeleniumProject - Visual Studio Code"
# RunAsync "Code" "C:\Projects\Toaster" -Options "-WindowStyle Hidden" -WinTitle "*Toaster - Visual Studio Code"
# RunAsync "Code" "C:\Projects\GmailFilters" -Options "-WindowStyle Hidden" -WinTitle "*GmailFilters - Visual Studio Code"
RunAsync "C:\Users\PRO\Documents\タスク管理.xlsm" -WinTitle "*タスク管理.xlsm*"
RunAsync "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -WinTitle "* - Google Chrome"
RunAsync "C:\Users\PRO\AppData\Local\Programs\Rakuten\Rakuten Link.exe" -WinTitle "Rakuten Link" -CloseWin $True

exit

# メモ
# Get-Process|Where-Object {$_.MainWindowTitle}|Format-Table MainWindowTitle
