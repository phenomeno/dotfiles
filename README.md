# dotfiles

### Add SSH key to github

```bash
ssh-keygen
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
```

Add to github.com > Settings > Add SSH key.

### Setup dev environment

```bash
./setup.sh
```

### Set additional keybindings

```bash
sudo dnf install gnome-tweak-tool
```

- Tweak Tool > Typing > Ctrl key position > Swap Ctrl and Caps Lock