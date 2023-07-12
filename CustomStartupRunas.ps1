function RunasAsync($FilePath,$Arguments,$WinTitle){
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
function HideWin($WinTitle){
    $Signature = @"
    [DllImport("user32.dll")]public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
"@

    $ShowWindowAsync = Add-Type -MemberDefinition $Signature -Name "Win32ShowWindowAsync" -Namespace Win32Functions -PassThru
    $ShowWindowAsync::ShowWindowAsync((Get-Process|Where-Object {$_.MainWindowTitle -like "*$WinTitle*"}).MainWindowHandle, 6)
}

RunasAsync "C:\Users\PRO\Documents\Projects\AutoHotkey\AutoHotkey.ahk"
RunasAsync "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe"
RunasAsync "Taskmgr.exe" -WinTitle "タスク マネージャー"
HideWin "タスク マネージャー"
exit

# メモ
# Get-Process|Where-Object {$_.MainWindowTitle}|Format-Table MainWindowTitle
