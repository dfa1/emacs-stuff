;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; text-mode

;; enabling autofill mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;; enter text-mode when opening a file named 'README', 'INSTALL' and so on
(add-to-list 'auto-mode-alist '("README" . text-mode))
(add-to-list 'auto-mode-alist '("INSTALL" . text-mode))
(add-to-list 'auto-mode-alist '("NEWS" . text-mode))
(add-to-list 'auto-mode-alist '("TODO" . text-mode))
(add-to-list 'auto-mode-alist '("AUTHORS" . text-mode))
(add-to-list 'auto-mode-alist '("THANKS" . text-mode))
(add-to-list 'auto-mode-alist '("COPYING" . text-mode))
