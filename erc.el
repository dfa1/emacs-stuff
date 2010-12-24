;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erc-mode
   
(require 'erc-join) 
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
          '(("freenode.net" "#clojure" "#emacs")))

(add-hook 'erc-mode-hook
          '(lambda ()
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
