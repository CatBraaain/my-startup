using module ".\lib\RunAsync.psm1"

RunAsync "C:\Projects\AutoHotkey\Scripts\ScreenLock.ahk"
RunAsync "C:\Program Files\Google\Drive File Stream\launch.bat"
RunAsync "C:\Program Files\ShareX\ShareX.exe"
RunAsync "C:\Program Files\obs-studio\bin\64bit\obs64.exe" "--startreplaybuffer --minimize-to-tray"
RunAsync "explorer.exe"
RunAsync "C:\Program Files\Notepad++\notepad++.exe" -WinTitle "* - Notepad++"
RunAsync "Code" "C:\Projects\AutoHotkey" -WinTitle "*AutoHotkey - Visual Studio Code" -Options "-WindowStyle Hidden"
RunAsync "Code" "C:\Projects\ChromeExtension" -WinTitle "*ChromeExtension - Visual Studio Code" -Options "-WindowStyle Hidden"
RunAsync "C:\Users\PRO\Documents\タスク管理.xlsm" -WinTitle "*タスク管理.xlsm*"
RunAsync "C:\Program Files\Google\Chrome\Application\chrome.exe" -WinTitle "* - Google Chrome"
RunAsync "C:\Users\PRO\AppData\Local\Programs\Rakuten\Rakuten Link.exe" -WinTitle "Rakuten Link" -CloseWin
