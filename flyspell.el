;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FlySpell

;; try to speedup it
(setq ispell-extra-args '("--sug-mode=ultra"))

;; sort corrections
(setq flyspell-sort-corrections nil)

;; TODO: enable-flyspell-for-mode
;; enable flyspell 
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda ()
		   (flyspell-mode 1))))

;; enable flyspell-prog-mode for some modes 
(dolist (hook '(clojure-mode-hook
		emacs-lisp-mode-hook))
  (add-hook hook (lambda ()
		   (flyspell-prog-mode))))
