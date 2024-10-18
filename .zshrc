if ! tmux list-sessions >/dev/null 2>&1; then
  unset TMUX
fi

if [ -z "$TMUX" ]; then
  echo "Starting tmux..."
  if [ "$(tmux list-sessions 2>/dev/null | wc -l)" -gt 0 ]; then
    exec tmux attach
   else
    exec tmux
  fi
fi

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap

source ~/Repos/znap/znap.zsh  # Start Znap
GREEN='%F{green}'
BLUE='%F{blue}'
RED='%F{red}'
RESET='%f'

# Define the prompt format
PS1="${GREEN}%n@%m${RESET}:${BLUE}%~${RESET}$ "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dylanh/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dylanh/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dylanh/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dylanh/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=$PATH:/Users/dylanh/.spicetify
export PATH=$PATH:~/Library/

[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap

# `znap source` starts plugins.
znap source marlonrichert/zsh-autocomplete

# `znap eval` makes evaluating generated command output up to 10 times faster.
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenv "znap eval pyenv 'pyenv init - --no-rehash'"
compctl -K    _pyenv pyenv

# `znap install` adds new commands and completions.
znap install aureliojargas/clitest zsh-users/zsh-completions

# bun completions
[ -s "/Users/dylanh/.bun/_bun" ] && source "/Users/dylanh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/Users/dylanh/Projects/emsdk:$PATH"
export PATH="/Users/dylanh/Projects/emsdk/upstream/emscripten:$PATH"
export PATH="$HOME/go/bin:$PATH"

export CLICOLOR=1
export LS_COLORS=RED


export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dylanh/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dylanh/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dylanh/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dylanh/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# opam configuration
[[ ! -r /Users/dylanh/.opam/opam-init/init.zsh ]] || source /Users/dylanh/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export HOMEBREW_NO_AUTO_UPDATE=1

# Created by `pipx` on 2024-06-02 01:41:38
export PATH="$PATH:/Users/dylanh/.local/bin"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/Applications/Racket v8.13/bin:$PATH"
export PATH="$HOME/Toolchain/i686-elf/bin:$PATH"
export PATH="$HOME/Toolchain/objconv:$PATH"
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH="/Applications/Alacritty.app/Contents/MacOS:$PATH"
export PATH="$HOME/projects/ziglang/:$PATH"
export PATH="$HOME/projects/zls/:$PATH"


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/dylanh/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

. "$HOME/.cargo/env"

alias vact='source .venv/bin/activate'
