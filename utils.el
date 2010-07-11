;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; unused functions 
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2010-07-11 17:17:45 dfa>

(defmacro join (join-char &rest others)
  "join as in perl"
  `(mapconcat 'identity ',others ,join-char))

(defun string-repeat (str times)
  "As the x operator in perl"
  (let ((res ""))
    (let ((i 0))
      (while (< i times)
	(setq res (concat str res))
	(setq i (+ i 1)))) 
    res))

(defun secure-string-match(regexp string)
  "prevent string-match to receive a nil as string" ;; FIXME
  (if (not (eq string nil))
      (string-match regexp buffer-file-name)))

