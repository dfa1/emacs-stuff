;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic ERC customizations
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-01-16 17:36:03 dfa>
   
(defun erc-maybe ()
  "Connect to IRC."
  (interactive)
  (when (y-or-n-p "IRC? ")
    (erc :server "irc.freenode.net" 
	 :port 6667
	 :nick "dfa2" 
	 :full-name "Davide Angelocola")))

   
(require 'erc-join)

(add-hook 'erc-mode-hook
          '(lambda ()
	     (setq erc-server-coding-system '(utf-8 . utf-8))
	     (setq erc-user-full-name "dfa")
	     (setq erc-email-userid "dfa")
	     (setq erc-interpret-mirc-color t)
	     (setq erc-kill-buffer-on-part t)
	     (setq erc-kill-queries-on-quit t)
	     (setq erc-kill-server-buffer-on-quit t)
	     (setq erc-auto-reconnect t)
	     (setq erc-part-reason 
		   (lambda (ignored) "nerds deal only with nerds"))
	     (erc-button-mode 1) 
             (require 'erc-pcomplete)
             (pcomplete-erc-setup)
             (erc-completion-mode 1)))


;; autojoin
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
          '(("freenode.net" "#clojure" "#emacs")))
