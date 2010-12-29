;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flyspell configuration.
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2010-12-29 16:52:01 dfa>

(require 'flyspell)

;; try to speedup it
(setq ispell-extra-args '("--sug-mode=ultra"))

;; sort corrections
(setq flyspell-sort-corrections t)




