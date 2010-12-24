(dolist (file '("basic.el" 
		"gui.el" 
		"misc.el" 
		"smart-tab.el" 
		"flyspell.el"
		"erc.el"
		"hg.el"
		"latex.el"
		"clojure.el"
		"elisp.el"
		"keymap.el"
		))
  (load-file file))

;; loads specific windows customizations
(when (string-equal system-type "windows-nt")
  (load-file "windows.el"))

;; ditto for gnu/linux
(when (string-equal system-type "gnu/linux")
  (load-file "ubuntu.el"))

;; open recent files at init
(recentf-open-files)

