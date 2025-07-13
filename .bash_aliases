# Reloads Bash
alias reload='source ~/.bashrc'
# Opens vimwiki
alias wiki='nvim ~/notes/sync/vimwiki/index.wiki'
# Kills all stopped jobs
alias allkill='kill -9 `jobs -ps`'
# Opens files in Windows
alias open='wslview'
# Sync with Windows time
alias updatedate='sudo hwclock -s'
# vim opens nvim
alias vim='nvim'
# Copy git_credentials to clipboard
alias cred='cat ~/.git_credentials | clip.exe'
# Copy git_credentials_school to clipboard
alias schoolcred='cat ~/.git_credentials_school | clip.exe'
# Display only hidden files in a directory
alias hidden='ls -ld .?*'
# Start jupyter server in ~/cosc325/notebooks directory
alias jup='cd ~/cosc325/notebooks && jupyter notebook --no-browser'
# Start deepseek-r1 with ollama
alias hellochat='sudo systemctl restart ollama && ollama run deepseek-r1'
# Close ollama process
alias byechat='sudo systemctl stop ollama'
