# List of process name patterns to block
$blockedPatterns = @(
    "msedge",
    "copilot",
    "searchhost",
    "gamebar",
    "gameassist"
)

Write-Host "Process blocker running... Press CTRL + C to stop."

while ($true) {
    foreach ($pattern in $blockedPatterns) {
        # Get matching processes
        $procs = Get-Process | Where-Object { $_.Name -like "*$pattern*" }

        foreach ($proc in $procs) {
            try {
                Write-Host "Terminating process: $($proc.Name) (PID: $($proc.Id))"
                Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
            }
            catch {
                Write-Host "Failed to terminate process: $($proc.Name)"
            }
        }
    }

    Start-Sleep -Seconds 1
}