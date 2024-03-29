;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic editing environment.

;; inhibit startup message
(setq inhibit-startup-message t)

;; setting username, email address and other stuff
(setq user-login-name "dfa")
(setq user-full-name "Davide Angelocola")
(setq user-mail-address "davide.angelocola@gmail.com")
(setq current-language-environment "English")

;; see what I'm typing *immediately*
(setq echo-keystrokes 0.01)

;; enabling case-fold-search
(setq case-fold-search t)

;; change backup behavior to save in a directory, not in a miscellany
;; of files all over the place
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.saves"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control nil)

;; _always_ require final newline
(setq require-final-newline t)

;; cursor follow compilation's output
(setq compilation-scroll-output t)

;; undo limit
(setq undo-limit 1000000)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; disabling narrowing
(put 'narrow-to-region 'disabled nil)

;; allow a command to erase an entire buffer
(put 'erase-buffer 'disabled nil)

;; the following reduces the amount of warning signals but does not
;; turn them off in general
(setq ring-bell-function
      (lambda ()
	(unless (memq this-command
		      '(isearch-abort
			abort-recursive-edit
			exit-minibuffer
			keyboard-quit))
	  (ding))))

;; date and time
(setq calendar-week-start-day 1)
(setq european-calendar-style 't)

;; the bullet indicates the start of a new paragraph
(setq paragraph-start "\\*\\|$\\|-"
      paragraph-separate "$")

;; sentences
(setq sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*"
      sentence-end-double-space nil)

;; do a "chmod u+x" when you save a script file (starting with "#!")
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; don't echo passwords when communicating with interactive programs
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font lock mode

;; enable font locking globally
(global-font-lock-mode t)

;; highlight FIXME, TODO and XXX as warning in some major modes
;; TODO: these should not be declared here
(dolist (mode '(
		latex-mode
		LaTeX-mode
		html-mode
		css-mode
		clojure-mode
		emacs-lisp-mode))
  (font-lock-add-keywords mode 
			  '(("\\(XXX\\|FIXME\\|TODO\\)" 
			     1 font-lock-warning-face prepend))))

(setq font-lock-maximum-decoration t
      font-lock-maximum-size nil)

(setq font-lock-support-mode 'jit-lock-mode
      fast-lock-cache-directories '("~/.emacs-flc"))


;; recent files.. love it 
(recentf-mode 1)

;; cua mode
(cua-mode 1)

;; enable column number on all major modes
(column-number-mode 1)

;; can replace the region just by typing text, and delete it just by
;; typing the Backspace key (DEL)
(delete-selection-mode 1)

;; other useful minor modes
(show-paren-mode 1)
(size-indication-mode 1)
(blink-cursor-mode 1)

;; ibuffer
(require 'ibuffer)

;; file templates
(require 'autoinsert)

(setq auto-insert-query nil)
(setq auto-insert-alist ;; TODO: move in specific files; use add-to-list
      '(((shell-script-mode . "Shell Program")
	 nil
	 "#!/bin/bash\n")
	((cperl-mode . "Perl Program")
	 nil
	 "#!/usr/bin/perl\n\nuse strict;\nuse warnings;\n\n")))

(auto-insert-mode 1)

;; enabling active region highlighting
(setq transient-mark-mode t)

;; disable over-write mode
(put 'overwrite-mode 'disabled t)

;; basic setup for uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; midnight
(require 'midnight) 
(midnight-delay-set 'midnight-delay "4:30am")

;; flyspell
(require 'flyspell)

;; sort corrections
(setq flyspell-sort-corrections t)

