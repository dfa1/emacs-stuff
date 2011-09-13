;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MS Windows specific

(when (string-equal system-type "windows-nt")
    ;; setting homedir
    (setq default-directory "c:/Users/dfa/")

    ;; setting ispell bin
    (setq ispell-program-name 
	  "C:/Program Files (x86)/Aspell/bin/aspell.exe"))
