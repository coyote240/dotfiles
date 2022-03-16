all: clean install

clean:
	rm -rf ~/.bash_profile
	rm -rf ~/.xprofile
	rm -rf ~/.xmodmaprc
	rm -rf ~/.vimrc
	rm -rf ~/.vim
	rm -rf ~/.config/i3
	rm -rf ~/.config/i3status

install: xorg i3
	git submodule init
	git submodule update
	ln -s $(CURDIR)/dotbash_profile ~/.bash_profile
	ln -s $(CURDIR)/dotvimrc ~/.vimrc
	ln -s $(CURDIR)/dotvim ~/.vim
	mkdir -p ~/env
	mkdir -p ~/.saves

xorg:
	ln -s $(CURDIR)/dotxprofile ~/.xprofile
	ln -s $(CURDIR)/doxmodmaprc ~/.xmodmaprc

i3:
	mkdir -p ~/.config/i3 ~/.config/i3status
	ln -s $(CURDIR)/i3/i3.conf ~/.config/i3/config
	ln -s $(CURDIR)/i3/i3status.conf ~/.config/i3status/config

brew:
	brew bundle
