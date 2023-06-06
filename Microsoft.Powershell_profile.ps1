### Nikolais Powershell Profile 
### 1.0.0


Write-Host "[Custom profile] loading..."
$loadingStart = Get-Date


# Create aliases for frequently used applications.
New-Alias np Notepad.exe
New-Alias np++ "C:\Program Files\Notepad++\notepad++.exe"


# Create aliases for frequently used commands
Set-Alias tn Test-NetConnection

# Useful functions
function cr  { cd \ } #change to rootdir

# PS Drives

#'git' Drive for GitHub
$gitDrivePath = "C:\Users\"+[Environment]::UserName+"\Documents\GitHub"
$t = New-PSDrive -Name git -PSProvider FileSystem -Root C:\Users\ahlhelmn\Documents\GitHub






# Edit-Profile for easy editing
# Make it easy to edit this profile once it's installed
function Edit-Profile
{
    if ($host.Name -match "ise")
    {
        $psISE.CurrentPowerShellTab.Files.Add($profile.CurrentUserAllHosts)
    }
    else
    {
        np++ "C:\Users\ahlhelmn\Documents\WindowsPowerShell\Microsoft.Powershell_profile.ps1"
    }
}





$loadingEnd = Get-Date
$executionTime = $loadingEnd - $loadingStart
$milliseconds = [math]::Round($executionTime.TotalMilliseconds)
Write-Host "[Custom profile] loaded in $milliseconds ms"