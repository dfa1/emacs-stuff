;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Java 

(add-hook 'java-mode-hook
	  (lambda ()
	    ;; My Java style
	    (defconst my-java-style
	      '(
		(c-set-style . "java")
		(c-tab-always-indent . t)
		(c-tab-width . 4)
		(c-indent-tabs-mode . 1)
		(c-basic-offset . 4)
		(c-label-offet -2)
		(comment-multi-line t)
		)
	      "My Java Programming Style")

	    ;; add my personal style and set it for the current buffer
	    (c-add-style "PERSONAL" my-java-style t)))


;; Java specific skeletons
(add-hook 'java-mode-hook
	  (lambda ()
	    ;; main
	    (define-skeleton java-skeleton-main
	      "Insert a main()" nil
	      > "public static int main(String args[])"\n
	      -4"{"\n
	      _ \n
	      -4"}")

	    ;; mapping skeletons
	    (local-set-key "\C-cim" 'java-skeleton-main)

	    ;; end
	    (setq skeleton-end-hook nil)))
