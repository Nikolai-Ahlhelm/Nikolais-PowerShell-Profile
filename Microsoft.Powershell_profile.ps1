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
try {
	$gitDrivePath = "C:\Users\"+[Environment]::UserName+"\Documents\GitHub"
	$t = New-PSDrive -Name git -PSProvider FileSystem -Root C:\Users\ahlhelmn\Documents\GitHub
} catch {
	Write-Host "[Custom profile] [ERROR] git PSDrive failed"
}






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
        np++ $PROFILE
    }
}





$loadingEnd = Get-Date
$executionTime = $loadingEnd - $loadingStart
$milliseconds = [math]::Round($executionTime.TotalMilliseconds)
Write-Host "[Custom profile] loaded in $milliseconds ms"