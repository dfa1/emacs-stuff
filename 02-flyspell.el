;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FlySpell

;; try to speedup it
(setq ispell-extra-args '("--sug-mode=ultra"))

;; sort corrections
(setq flyspell-sort-corrections nil)

;; TODO: use (add-hook 'a-mode-hook 'flyspell-mode)
(defun enable-flyspell-for (hook)
  "Helper to enable `flyspell-mode' in hook."
  (add-hook hook (lambda ()
		    (flyspell-mode))))

;; TODO: use (add-hook 'a-mode-hook 'flyspell-prog--mode)
(defun enable-prog-flyspell-for (hook) 
  "Helper to enable `flyspell-prog-mode' in hook."
  (add-hook hook (lambda ()
		    (flyspell-prog-mode))))
