# .dotfiles

dotfiles that work with **ksh** and **bash** shells. 
*Tested on ksh [sh (AT&T Research) 93u+ 2012-08-01] and GNU bash [4.2.46 and above]*

## Files & description:

1. .colors (dir): Define color schemes for grep (GREP_COLORS) and shell prompt (PS1). 
                  Set shell variable `SHELL_COLORS` to use a different colorscheme.
                            `export SHELL_COLORS=gruvbox` will look for file `gruvbox.colors` in `.colors`
                  
1. .dir_colors.xterm: Directory colors for terminals supporting xterm TERM.

1. .dir_colors.xterm-256color: Directory colors for terminals supporting TERM=xterm-256color.

1. inputrc: `readline` configuration for bash.

1. .logout: Cleanup temporary files on shell exit.

1. .profile.addon: Main configuration calling all sub-profile configurations.

1. .profile.aliases: All aliases go here.

1. .profile.bash.opts: Bash only. All bash relevant options go here.

1. .profile.functions: Handy functions for faster results.

1. .profile.prompt: Customization for PS1

## Installation:

After cloning the git repository, go to .dotfiles and run ./install.sh. This will back-up existing files and create softlinks in user $HOME directory.

## Update:

git pull in the repo directory

