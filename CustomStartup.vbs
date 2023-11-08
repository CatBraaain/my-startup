filePath = Replace(WScript.ScriptFullName,"vbs","ps1")
CreateObject("WScript.Shell").Run "powershell " & filePath, 0
