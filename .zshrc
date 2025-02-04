
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

set -o vi

export VISUAL=nvim
export EDITOR=nvim
export TERM="tmux-256color"

export BROWSER="arc"

# Directories

export REPOS="$HOME/Developer"
export GITUSER="mkzaborowski"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export LAB="$GHREPOS/lab"
export SCRIPT="$DOTFILES/scripts"
export ICLOUD="$HOME/icloud"

export GOBIN="$HOME/.local/bin"
export GOPRIVATE=""
export GOPATH="$HOME/go/"

export SSHCONNECT="$HOME/ssh-linux-servers/connect.sh"

# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~
  
path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $HOME/dotnet
    /home/linuxbrew/.linuxbrew/opt/dotnet@8/bin # Dotnet for dev container
    $SCRIPTS
    $HOME/.krew/bin
    $HOME/.rd/bin                   # Rancher Desktop
    /home/vscode/.local/bin         # Dev Container Specifics
    /root/.local/bin                # Dev Container Specifics
)

export PATH

# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~


HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

PURE_GIT_PULL=0  # Disable async git fetch in Pure prompt
PURE_PROMPT_NEWLINE=false # One line commands

if [[ "$OSTYPE" == darwin* ]]; then
  if command -v brew &>/dev/null; then
    fpath+=("$(brew --prefix)/share/zsh/site-functions")
  fi
else
  fpath+=("$HOME/.zsh/pure")
fi

autoload -U promptinit; promptinit
prompt pure


# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~


alias v=nvim

alias scripts='cd $SCRIPTS'
alias cdblog="cd ~/websites/blog"
alias c="clear"
alias icloud="cd \$ICLOUD"

# Repos

alias lab='cd $LAB'
alias dot='cd $GHREPOS/dotfiles'
alias repos='cd $REPOS'
alias ghrepos='cd $GHREPOS'
alias gr='ghrepos'

# ls

alias ls='ls --color=auto'
alias la='ls -lathr'

# Utility

alias t="tmux"
alias e="exit"

# Git

alias gp="git pull"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gl="git log"
alias gc="git commit"
alias gcs="git commit -m"
alias lg="lazygit"

# Servers

alias clos="exec $SSHCONNECT"

