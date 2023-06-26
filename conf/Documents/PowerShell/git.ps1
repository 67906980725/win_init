$GITHUB_PROXY="https://gh.ddlc.top"
function Git_Quick_Push {
  param(
      [string]$m = "update",
      [string]$o = "github"
  )
  git add .
  git commit -m "$m"
  git push $o
}
Set-Alias qp Git_Quick_Push
${function:clone} = { git clone @args }
${function:n} = { git clone @args }
${function:s} = { git status @args }
${function:d} = { git diff @args }
${function:a} = { git add @args }
${function:c} = { git commit @args }
${function:checkout} = { git checkout @args }
${function:o} = { git checkout @args }
${function:pull} = { git pull @args }
${function:l} = { git pull @args }
${function:log} = { git log @args }
${function:lg} = { git log @args }
${function:f} = { git fetch @args }
${function:p} = { git push @args }
${function:stash} = { git stash @args }
${function:b} = { git blame @args }
${function:merge} = { git merge @args }
${function:mg} = { git merge @args }
${function:rs} = { git reset @args }