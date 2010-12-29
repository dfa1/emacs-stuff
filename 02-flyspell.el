;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FlySpell

(require 'flyspell)

;; try to speedup it
(setq ispell-extra-args '("--sug-mode=ultra"))

;; sort corrections
(setq flyspell-sort-corrections nil)

;; TODO: use (add-hook 'a-mode-hook 'flyspell-mode)
;; TODO: use (add-hook 'a-mode-hook 'flyspell-prog--mode)

