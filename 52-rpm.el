;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RPM spec mode
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-05-19 11:00:50 dfa>

;; TODO: use autoload
(load-library "rpm-spec-mode")

(setq auto-mode-alist 
      (append '(("\\.spec" . rpm-spec-mode) 
		("\\.spectemplate" . rpm-spec-mode))
	      auto-mode-alist))
