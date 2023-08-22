# Install config for bash and zsh
```
cd console
ln -s .inputrc ~/.inputrc
ln -s .zshrc ~/.zshrc
ln -s .bashrc ~/.bashrc
```
# Install Powerline fonts

Clone powerline fonts repo:

```git clone https://github.com/powerline/fonts.git --depth=1```

## Install them:
```
cd fonts
./install.sh
```

# Python enviropment
```
# Install pyenv and virtualenv
brew install pyenv-virtualenv

# List python versions
pyenv install -l

# Install
pyenv install 2.7.18

# Create virtenv:
pyenv virtualenv 3.7.4 prj

# Set py to current dir:
pyenv local prj

# Set default python:
pyenv global prj

# Show python versions
pyenv versions

# Show virtenv:
pyenv virtualenvs

# Delete virtenv:
pyenv virtualenv-delete prj
```

# Install Neovim
```
ln -s .config/nvim ~/.config/nvim
pyenv virtualenv 3.11.4 neovim3
pyenv activate neovim3
pip install pynvim && pip install neovim
brew install neovim
```

# Iterm2 json config
import from console/iterm/best theme.json

# add plugins for zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
