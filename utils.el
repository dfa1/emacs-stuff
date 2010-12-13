;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Unused functions. 
;;
;; Author     : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp : <2010-12-13 21:41:09 dfa>

;; FIXME: macro abuse 
(defmacro join (join-char &rest others)
  "Join as in perl."
  `(mapconcat 'identity ',others ,join-char))

(defun string-repeat (str times)
  "As the x operator in perl."
  (let ((res ""))
    (let ((i 0))
      (while (< i times)
	(setq res (concat str res))
	(setq i (+ i 1)))) 
    res))

(defun secure-string-match(regexp string)
  "Prevent string-match to receive a nil as string." 
  (if (not (eq string nil))
      (string-match regexp buffer-file-name)))
