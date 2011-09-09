;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; text-mode
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-10 00:57:49 dfa>

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
