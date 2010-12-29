;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erc-mode
   
(add-hook 'erc-mode-hook
          '(lambda ()
	     (setq  erc-server-coding-system '(utf-8 . utf-8))
	     (setq erc-user-full-name "Davide Angelocola")
	     (setq erc-email-userid "davide.angelocola@gmail.com")
	     (erc-button-mode -1) 
             (require 'erc-pcomplete)
             (pcomplete-erc-setup)
             (erc-completion-mode 1)))

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
	     (setq erc-user-full-name "Davide Angelocola")
	     (setq erc-email-userid "davide.angelocola@gmail.com")
	     (setq erc-interpret-mirc-color t)
	     (setq erc-kill-buffer-on-part t)
	     (setq erc-kill-queries-on-quit t)
	     (setq erc-kill-server-buffer-on-quit t)
	     (erc-button-mode -1) 
             (require 'erc-pcomplete)
             (pcomplete-erc-setup)
             (erc-completion-mode 1)))


;; autojoin
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
          '(("freenode.net" "#clojure" "#emacs")))
