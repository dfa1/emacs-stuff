;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  X window stuff
(when window-system
  (print "aa")
  ;; display various non-editing buffers in their own frames
  (setq special-display-buffer-names
	(nconc '("*Backtrace*"
		 "*vc-change-log*"
		 "*VC-log*"
		 "*ASCII*") 
	       special-display-buffer-names))

  ;; display those special buffer frames without a tool bar
  (setq special-display-frame-alist nil)
  (add-to-list 'special-display-frame-alist '(tool-bar-lines . 0))
  (add-to-list 'special-display-frame-alist '(menu-bar-lines . 0))
  (add-to-list 'special-display-frame-alist '(height . 10))
  (add-to-list 'special-display-frame-alist '(width . 80))
  (add-to-list 'special-display-frame-alist '(unsplittable . t))

  ;; customizing frame look
  (add-to-list 'default-frame-alist '(cursor-color . "white"))
  (add-to-list 'default-frame-alist '(foreground-color . "white"))
  (add-to-list 'default-frame-alist '(background-color . "MidnightBlue"))

  ;; disabling the toolbar and the scrollbar
  (tool-bar-mode -1)
  (scroll-bar-mode -1)

  ;; enabling my wheeled trackball
  (mouse-wheel-mode 1)

  ;; setting a decent wheel behavior
  (setq mouse-progressive-speed nil)
  (setq mouse-wheel-progressive-speed nil)
  (setq scroll-step 1)
  (setq scroll-conservatively 1))

