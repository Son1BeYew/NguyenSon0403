# Auto Commit & Push Script
# Run this script to automatically commit and push changes

param(
    [int]$IntervalSeconds = 30
)

Write-Host "🚀 Auto Commit & Push started (checking every $IntervalSeconds seconds)" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow

$lastCommitTime = Get-Date

while ($true) {
    try {
        # Check for changes
        $status = git status --porcelain
        
        if ($status) {
            Write-Host "`n📝 Changes detected at $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Cyan
            
            # Stage all changes
            git add .
            
            # Commit with timestamp
            $commitMessage = "🔄 Auto-commit: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
            git commit -m $commitMessage
            
            # Push to remote
            git push origin main
            
            Write-Host "✅ Committed and pushed successfully!" -ForegroundColor Green
            $lastCommitTime = Get-Date
        }
        else {
            Write-Host "." -NoNewline -ForegroundColor Gray
        }
        
        # Wait before checking again
        Start-Sleep -Seconds $IntervalSeconds
    }
    catch {
        Write-Host "`n❌ Error: $_" -ForegroundColor Red
        Start-Sleep -Seconds $IntervalSeconds
    }
}
