all: clean build

clean:
	rm -rf ~/.bash_profile
	rm -rf ~/.vimrc
	rm -rf ~/.vim

build:
	ln -s $(CURDIR)/dotbash_profile ~/.bash_profile
	ln -s $(CURDIR)/dotvimrc ~/.vimrc
	ln -s $(CURDIR)/dotvim ~/.vim
	mkdir -p ~/env
	mkdir -p ~/.saves
