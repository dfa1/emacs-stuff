;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RPM spec mode
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-04-28 13:55:03 dangelocola>

;; TODO: use autoload
(load-library "rpm-spec-mode")

(setq auto-mode-alist (append '(("\\.spec" . rpm-spec-mode))
 			       auto-mode-alist))
