;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RPM spec mode
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-11 13:48:10 dfa>

(setq auto-mode-alist 
      (append '(("\\.spec" . rpm-spec-mode) 
		("\\.spectemplate" . rpm-spec-mode))
	      auto-mode-alist))
