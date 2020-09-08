# dotfiles

## Fedora
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

## Mac
[ ] download firefox
    - add vimium extension
[ ] add ssh key
[ ] download karabiner
    - simple mods: caps lock -> left command
    - complex mods: change command + h/j/k/l to Arrows
[ ] system preferences, keyboard, modifier keys
    - karabiner virtual keyboard: option -> command
[ ] download vs code
    - cmd + shift + p: install shell
[ ] download slack
[ ] download node
[ ] download docker for mac
[ ] ./setup-mac.sh