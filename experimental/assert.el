;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; assert extesions on top of cl.
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2010-12-30 13:33:55 dfa>

(require 'cl)

(defmacro assert-nil (expr)
  `(assert (eq ,expr nil)))

(provide 'assert)

;; unit tests
(eval-when-compile 
  (assert-nil nil))
