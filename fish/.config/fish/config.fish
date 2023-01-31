# greeting
function fish_greeting
  echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⢀⣄⠠⠄⠄⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡀⠀⠁⠀⠀⠀⠈⠣⡶⠠⠁⢈⠂⢄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⠞⠁⠀⠀⠀⠀⢀⡀⠀⠈⢖⢂⠤⡈⠀⢕⢄⠀⠀⠀
⠀⠀⠀⠀⢠⢁⢴⠃⠀⢀⣤⠖⠁⠀⢀⠔⠉⠀⢁⠀⠑⠀⢙⢦⠀⠀
⠀⠀⠀⠀⡾⣡⠃⢰⢈⠞⢓⢀⠆⢀⠆⠀⡆⠘⡀⡗⢆⡗⢅⡈⢆⠀
⠀⠀⠀⢠⡕⠇⠀⣇⠶⢠⣣⢊⢠⠃⠀⢸⠀⠀⠀⡇⢲⠫⡇⠇⡈⡆
⠀⠀⠀⠈⠱⣠⡇⠇⠒⣾⢡⠾⢸⠀⢀⠆⠀⠀⢄⣿⢸⠀⣱⡃⣅⡇
⠀⠀⠀⠀⢤⣇⢸⡆⢰⣿⣷⣒⣧⢧⡜⣠⡞⣼⣮⣿⡇⣰⣥⣧⢹⠇
⠀⠀⠀⠀⠈⢿⣖⢇⣾⡍⠛⠃⠈⣼⠿⢻⠟⠿⠇⣹⣿⣿⢻⠇⠈⠀
⠀⠀⠀⠀⠀⠀⢙⣿⣗⢽⣗⠤⠘⠁⠐⡁⠀⠤⣾⣿⣿⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⠞⠉⠀⠈⠉⢳⠦⠤⠬⠁⢒⣾⣿⣿⡟⡏⠀⠀⠀⠀
⠀⠀⠀⢀⡰⠁⠀⠀⠀⠀⠀⠈⣧⣀⠄⠚⢿⠿⠋⠘⠀⠀⠀⠀⠀⠀
⠀⠠⠂⣵⠁⣠⣿⡿⡆⠀⠀⠀⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⣁⣸⣿⠀⢯⠗⠘⠁⠀⠀⢸⣷⡄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢨⢠⣿⣿⠀⠀⠁⠀⠀⠀⣶⡏⢻⣧⡈⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--------------
ようこそ、ゆう" # welcome, yu
end

#if status is-interactive
  # Commands to run in interactive sessions can go here
#end

# conf
set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
fish_config theme choose Just\ a\ Touch

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

# dotfiles repo alias
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Mac setup for pomo
function work
    timer 60m
    terminal-notifier -message 'Pomodoro' -title 'Work Timer is up! Take a Break 👻' -appIcon '~/Pictures/pumpkin.png' -sound Crystal
end

function rest
    timer 10m
    terminal-notifier -message 'Pomodoro' -title 'Break is over! Get back to work 👾' -appIcon '~/Pictures/pumpkin.png' -sound Crystal
end


set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
