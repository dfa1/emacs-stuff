;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rc.d like, init loader for GNU Emacs.
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2010-12-30 13:26:21 dfa>

;; TODO: this file should be copied in site-lisp
;; TODO: add sample configuration
(defun load-splitted-init (path) 
  "Load (via `load-file') an ordered set of files in way similar to rc.d
init files."
  (dolist (file (discover-init-files path))
    (load-file (concat path "/" file))))

(defun filter (condp lst)
  "High-order `filter' function."
  (delq nil
	(mapcar (lambda (x) (if (funcall condp x) x)) lst)))

(defun init-file-p (path)
  "Returns nil if the path is an elisp file starting two-digits."
  (string-match-p "^[0-9][0-9]-.*\.el$" (file-name-nondirectory path)))

(defun discover-init-files (path)
  "Returns a sorted list of elisp files that starts with two digits." 
  (sort (filter 'init-file-p (directory-files path)) 'string-lessp))

(provide 'splitted-init)

;; unit tests
;; (eval-when-compile 
;;   (require 'assert)
;;   (assert (init-file-p "00-test.el"))
;;   (assert (init-file-p "/path/00-test.el"))
;;   (assert-nil (init-file-p "a.el"))
;;   (assert-nil (init-file-p "#a.el#")))
