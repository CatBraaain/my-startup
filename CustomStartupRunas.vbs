Set fso = CreateObject("Scripting.FileSystemObject")
filePath =  fso.GetParentFolderName(WScript.ScriptFullName) & "\CustomStartupRunas.ps1"
CreateObject("WScript.Shell").Run "powershell " & filePath, 0