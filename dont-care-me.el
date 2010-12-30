;; elisp learning
(defmacro ++ (var)
  `(setq ,var (+ ,var 1)))

(setq a 1)
(macroexpand (++ a))

(defmacro for (var = init .. final do &rest body)
  `(let ((,var ,init)
	 (max ,final))
     (while (<= ,var max)
       ,@body
       (++ ,var))))

(for i = 0 .. 10 do
     (print i))
