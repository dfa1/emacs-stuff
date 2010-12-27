;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FlySpell

;; try to speedup it
(setq ispell-extra-args '("--sug-mode=ultra"))

;; sort corrections
(setq flyspell-sort-corrections nil)

(defun enable-flyspell-for (hook)
  "Helper to enable `flyspell-mode' in hook."
  (add-hook hook (lambda ()
		    (flyspell-mode))))

(defun enable-prog-flyspell-for (hook) 
  "Helper to enable `flyspell-prog-mode' in hook."
  (add-hook hook (lambda ()
		    (flyspell-prog-mode))))
