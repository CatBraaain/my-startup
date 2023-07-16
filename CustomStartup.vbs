Set fso = CreateObject("Scripting.FileSystemObject")
filePath =  fso.GetParentFolderName(WScript.ScriptFullName) & "\CustomStartup.ps1"
CreateObject("WScript.Shell").Run "powershell " & filePath, 0