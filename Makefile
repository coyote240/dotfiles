all: clean build

clean:
	rm -rf ~/.bash_profile
	rm -rf ~/.vimrc
	rm -rf ~/.vim

build:
	git submodule init
	git submodule update
	ln -s $(CURDIR)/dotbash_profile ~/.bash_profile
	ln -s $(CURDIR)/dotvimrc ~/.vimrc
	ln -s $(CURDIR)/dotvim ~/.vim
	mkdir -p ~/env
	mkdir -p ~/.saves
	cd $(CURDIR)/dotvim/bundle/command-t/ruby/command-t;\
		make clean;\
		ruby extconf.rb;\
		make
