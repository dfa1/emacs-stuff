all: clean compile

compile:
	emacs -batch -l split-init.el -l _compile.el -f compile 

clean:
	rm -f *.elc

test:
	emacs -f kill-emacs --debug-init
