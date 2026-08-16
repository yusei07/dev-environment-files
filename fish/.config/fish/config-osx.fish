# # aliases (default)
# alias ls "ls -p -G"
# alias la "ls -A"
# alias ll "ls -l"
# alias lla "ll -A"

# Modern replacements for ls using eza
alias ls="eza --icons=always"

# Long list view with file sizes, permissions, headers, and Git status
alias ll="eza -lah --icons=always --git"

# Tree view up to two levels deep
alias lt="eza --tree --level=2 --icons=always"
alias g git

# Shutdown timer shortcut
function gn
  set -l time_input $argv[1]

  # check if user type an argument
  if test -z "$time_input"
    echo "Error: Please specify a time (e.g., gn 23:00 or gn +60)" # input can be a specific time or an additional
    return 1
  end

  sudo shutdown -h $time_input
end

# cancel shutdown
alias cgn "sudo killall shutdown"
