(require 'split-init)

(defun compile()
  (setq libs (list-files-by (lambda (x) (string-match-p "^[a-z\-]+\.el$" x)) "."))
  (dolist (file libs) (load-file file))

  (setq sources (list-files-by (lambda (x) (string-match-p "^[0-9][0-9].*\.el$" x)) "."))
  (dolist (file sources) (byte-compile-file file)))

