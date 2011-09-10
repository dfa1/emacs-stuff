;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rc.d like, init loader for GNU Emacs.
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-10 22:59:38 dfa>

(defun filter (condp lst)
  "High-order `filter' function."
  (delq nil
	(mapcar (lambda (x) 
		  (if (funcall condp x) x)) lst)))

(defun list-files-by (predicate path)
  "Returns a list of files in PATH that matches the given PREDICATE."
  (filter predicate (directory-files path)))

(defun init-file-p (path)
  "Returns nil if the PATH is an elisp file starting two-digits."
  (string-match-p "^[0-9][0-9]-.*\.el$" (file-name-nondirectory path)))

(defun discover-init-files (path)
  "Returns a sorted list of elisp init files in PATH." 
  (sort (list-files-by 'init-file-p path) 'string-lessp))

(defun load-split-init (path) 
  "Load (via `load-file') an ordered set of files in way similar
   to rc.d init files."
  (dolist (file (discover-init-files path))
    (load-file (concat path "/" file))))

(provide 'split-init)

