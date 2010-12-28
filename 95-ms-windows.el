;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Windows specific stuff.
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2010-12-28 00:42:17 dfa>

(when (string-equal system-type "windows-nt")
    ;; setting homedir
    (setq default-directory "c:/Users/dfa/")

    ;; setting ispell bin
    (setq ispell-program-name 
	  "C:\\Program Files (x86)\\Aspell\\bin\\aspell.exe"))
