;; handy insert-pair extensions for elisp/clojure
(setq skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe) 
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)

;; old functions, superseded by
;; (defun insert-brackets ()
;;   (interactive)
;;   (insert-pair 0 ?[ ?]))
;;
;; (defun insert-braces ()
;;   (interactive)
;;   (insert-pair 0 ?{ ?}))
;;
;; (defun insert-double-quotes ()
;;   (interactive)
;;   (insert-pair 0 ?\" ?\"))
;;
;; (local-set-key "(" 'insert-parentheses)
;; (local-set-key "[" 'insert-brackets)
;; (local-set-key "{" 'insert-braces)
;; (local-set-key "\"" 'insert-double-quotes)




 
