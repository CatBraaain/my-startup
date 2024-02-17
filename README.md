# CustomStartup

This is my pet project.
Run apps **in order** automatically at startup in Windows with registering vbs in taskscheduler's logon trigger.

## Samples

### Use library
```powershell
  using module ".\lib\RunAsync.psm1"
```

### Run notepad.exe
```powershell
  RunAsync "Notepad.exe"
```

### Run notepad.exe and wait for opening window
```powershell
  RunAsync "Notepad.exe" -WinTitle "Untitled - Notepad"
```

### Run notepad.exe and minimize it
```powershell
  RunAsync "Notepad.exe" -WinTitle "Untitled - Notepad" -HideWin
```

### Open task manager and hide it on system tray (need admin rights)
```powershell
  RunAsync "Taskmgr.exe" -WinTitle "Task Manager" -HideWin
```

### How to find WinTitle string
```powershell
  Get-Process | ? {$_.ProcessName -eq "notepad"} | Format-Table MainWindowTitle
```
```powershell
  Get-Process | ? {$_.MainWindowTitle} | Format-Table MainWindowTitle
```

## Save my sleep
```mermaid
  %%{
    init: {
      'sequence': {
        %% 'showSequenceNumbers': true
      }
    }
  }%%

  sequenceDiagram
    actor Me
    Note over Me: Sleeping #128564;
    Computer ->> Computer: Wake up by BIOS #128343;

    Computer ->> CustomStartup: Run by TaskScheduler at startup
    Note over CustomStartup: Run Scripts in order

    alt when screen light is on
      Computer --x Me: Disturb sleeping #128547;
    end
    CustomStartup ->> Computer: Turn off screen ASAP #10071;#10071;
    alt when screen light is off
      Computer -->> Me: Sleep well #128124;
    end


    CustomStartup ->> Computer: Start background apps
    CustomStartup ->> Computer: Start the usual apps

    Note over Me: Get up #128355;
    Me ->> Computer: Good Morning #128512;
    Computer ->> Me: Everything is prepared #128526;
    Me ->> Computer: Good Boy #129299;
```
