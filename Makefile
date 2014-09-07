all: clean build

clean:
	rm -rf ~/.bash_profile
	rm -rf ~/.vimrc
	rm -rf ~/.gvimrc

build:
	ln -s $(CURDIR)/dotbash_profile ~/.bash_profile
	ln -s $(CURDIR)/dotvimrc ~/.vimrc
	ln -s $(CURDIR)/dotgvimrc ~/.gvimrc
