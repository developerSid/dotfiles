export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

if [[ -s "$HOME/.zshrctheme" ]]; then
  source "$HOME/.zshrctheme"
else
  ZSH_THEME="ys"
fi

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    git-extras
    gradle
    docker
    jump
    sudo
    asdf
)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/.local/bin:$PATH

alias j=jump

if [ -d "$HOME/.cargo/bin" ]; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if command -v nvim &> /dev/null && [[ ! -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
  alias vim=nvim
else
  export EDITOR='vim'
fi

if command -v lsd &> /dev/null; then
  alias ls=lsd
  alias ll='lsd -lh'
  alias la='lsd -lah'
fi

if command -v bat &> /dev/null; then
  alias cat=bat
fi

if command -v batcat &> /dev/null; then
  alias cat=batcat
fi

if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

if command -v flatpak &> /dev/null; then
  if flatpak list | grep -q "org.getzola.zola"; then
    alias zola="flatpak run org.getzola.zola"
  fi
fi

[[ -s "$HOME/.localConfig" ]] && source "$HOME/.localConfig"

