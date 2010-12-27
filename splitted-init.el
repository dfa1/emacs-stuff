;; TODO: this file should be copied in site-lisp
(defun load-splitted-init (path) 
  "Load (via `load-file') an ordered set of files in way similar to rc.d."
  (dolist (file (discover-init-files path))
    (load-file (concat path "/" file))))

  ;; ;; loads specific windows customizations
  ;; (when (string-equal system-type "windows-nt")
  ;;   (load-file "windows.el"))
  
  ;; ;; ditto for gnu/linux
  ;; (when (string-equal system-type "gnu/linux")
  ;;   (load-file "ubuntu.el"))

  ;; open recent files at init
  ;; (recentf-open-files))

(defun filter (condp lst)
  "Standard high-order `filter' function."
    (delq nil
          (mapcar (lambda (x) (if (funcall condp x) x)) lst)))

(defun elisp-file-p (path)
  "Returns nil if the path is not an elisp file."
   (string-match-p "^[0-9][0-9]-.*\.el$" path)) ;; TODO: improve regexp

;; unit tests
;; (elisp-file-p "00-test.el")
;; (elisp-file-p "a.el")
;; (elisp-file-p "#a.el#")

(defun discover-init-files (path)
  "Returns a sorted list of elisp files that starts with two digits." 
  (sort (filter 'elisp-file-p (directory-files path)) 'string-lessp))

(provide 'splitted-init)

