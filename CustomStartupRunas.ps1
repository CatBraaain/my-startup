function RunasAsync($FilePath,$ArgumentList,$Options,$WinTitle,$HideWin=$False){
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

RunasAsync "C:\Projects\AutoHotkey\AutoHotkey.ahk"
RunasAsync "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe"
RunasAsync "Taskmgr.exe" -WinTitle "タスク マネージャー" -HideWin $True
exit

# メモ
# Get-Process|Where-Object {$_.MainWindowTitle}|Format-Table MainWindowTitle
