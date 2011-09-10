;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rc.d like, init loader for GNU Emacs.
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-10 23:49:17 dfa>

(defun load-split-init (path) 
  "Load (via `load-file') an ordered set of files in way similar
   to rc.d init files."
  (dolist (file (discover-init-files path))
    (load-file (concat path "/" file))))

(defun filter (condp lst)
  "High-order `filter' function (eager)."
  (delq nil
	(mapcar (lambda (x) 
		  (if (funcall condp x) x)) lst)))

(defun init-file-p (path)
  "Returns nil if the path is an elisp file starting two-digits."
  (eq (string-match-p "^[0-9][0-9]-.+\.el$" (file-name-nondirectory path)) 0))

(eval-when-compile 
  (defmacro accept (value) 
    `(assert ,value)) 
  (defmacro refuse (value)
    `(assert (not ,value)))
  (accept (init-file-p "02-base.el"))
  (accept (init-file-p "/home/user/02-base.el"))
  (refuse (init-file-p "02-.el"))
  (refuse (init-file-p "foo.el")))

(defun discover-init-files (path)
  "Returns a sorted list of elisp files that starts with two digits." 
  (sort (filter 'init-file-p (directory-files path)) 'string-lessp))

(provide 'split-init)

