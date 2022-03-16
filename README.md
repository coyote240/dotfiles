# Personal .files

It's not unusual to see folks manage their dotfiles in source control these
days, and this is nothing more than that.  As I'll be moving around a bit in the
coming months, I've decided to update a few things to make it easy to start on a
new machine.

## Usage

After cloning this repository, running `make install` from within the project
directory will symlink all dotfiles to thier appropriate locations in your home
directory. To remove these files, run `make clean`.

## .bash\_profile

Custom PS1, aliases, colors.
Python environment and package configurations.
Auto-complete scripts, including for ssh hosts.

## .vimrc

Basic editor preferences, syntax, etc.
Shop/project specific configurations, some no longer used.

## .vim/ directory

Submodules for my favorite plugins.

* Command-T
* NERDTree
* jshint
* Flake8
* Fugitive
* Solarized
* Gruvbox

## xorg

Simple key remappings and configuration for my monitors.

## i3wm

These files include all of my i3 desktop configuration, from basic usage and
light theming to dmenu scripts and status bar.
