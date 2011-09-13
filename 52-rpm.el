;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RPM spec mode

(setq auto-mode-alist 
      (append '(("\\.spec" . rpm-spec-mode) 
		("\\.spectemplate" . rpm-spec-mode))
	      auto-mode-alist))
