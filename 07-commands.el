;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom commands.
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-10 23:36:52 dfa>

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun back-to-indentation-or-beginning ()
  "switches the point to before the first non-space
    character, or if the point is already there it goes to the
    beginning of the line"
  (interactive)
  (if (= (point) (save-excursion (back-to-indentation) (point)))
      (beginning-of-line)
    (back-to-indentation)))

;; clone line as on netbeans
(defun clone-line-below()
  "Copy the current line below."
  (interactive)
  (beginning-of-line)
  (kill-line)
  (yank)
  (newline)
  (yank)
  (beginning-of-line))

(defun clone-line-above()
  "Copy the current line above."
  (interactive)
  (beginning-of-line)
  (kill-line)
  (yank)
  (newline)
  (yank)
  (beginning-of-line))

(defun clone-region ()
  "Copy the current region after itself."
  (interactive)
  (let ((start (region-beginning))) 
    (kill-ring-save (region-beginning) (region-end))
    (yank)
    (goto-char start)))

;; netbeans-like keybindings
(global-set-key [C-S-down]
		'(lambda () 
		   (interactive)
		   (if (region-active-p)
		       (clone-region)
		     (clone-line-below))))

(global-set-key [C-S-up] 
		'(lambda () 
		   (interactive)
		   (if (region-active-p)
		       (clone-region)
		     (clone-line-above))))

;; other special commands
(defun insert-shell-command-output (command)
  "Prompt for a command the insert it's output at point"
  (interactive "sInsert command output: ")
  (insert (shell-command-to-string command)))

;; source:
;;   http://www.emacswiki.org/cgi-bin/wiki/PopupRuler
(defun column-ruler (width)
  "Display temp ruler at point."
  (interactive `(,(+ (window-hscroll)(window-width))))
  (momentary-string-display
   (let* ((iterations (/ (1- width) 10))
	  (result1 "|...|....|")
	  (result2 "1   5   10")
	  (inc1 "....|....|")
	  (inc2 "        %d0")
	  (i 1))
     (while  (<= i iterations)
       (setq i (1+ i))
       (setq result1 (concat result1 inc1))
       (setq result2 (concat result2 (substring (format inc2 i) -10))))
     (concat (substring result2 0 width) "\n"
	     (substring result1 0 width) "\n"))
   (line-beginning-position) nil "[space] Clears ruler"))

(defun increment-number-at-point ()
  "Increment the number at point"
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun decrement-number-at-point ()
  "Decrement number at point"
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1- (string-to-number (match-string 0))))))

;; insert the date, the time, and the date and time at point. Insert
;; the date 31 days hence at point, eventually...
(defvar insert-time-format "%T"
  "*Format for \\[insert-time] (c.f. 'format-time-string' for how to format).")

(defvar insert-date-format "%Y%m%d"
  "*Format for \\[insert-date] (c.f. 'format-time-string' for how to
 format).")

(defun insert-time ()
  "Insert the current time according to the variable
  \"insert-time-format\"."
  (interactive "*")
  (insert (format-time-string insert-time-format
			      (current-time))))
(defun insert-date ()
  "Insert the current date according to the variable \"insert-date-format\"."
  (interactive "*")
  (insert (format-time-string insert-date-format
			      (current-time))))

(defun insert-time-and-date ()
  "Insert the current date according to the variable
 \"insert-date-format\", then a space, then the current time according
 to the variable \"insert-time-format\"."
  (interactive "*")
  (progn
    (insert-date)
    (insert " ")
    (insert-time)))

(defun insert-name-and-email()
  (interactive)
  "Insert my signature at point."
  (insert (concat user-full-name " <" user-mail-address ">")))

(setq gpl-header "This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307,
USA.
")

(defun insert-gpl-header ()
  "Insert standard GPL header at point."
  (interactive)
  (let ((mark (point)))
    (insert gpl-header)
    (comment-region mark (+ mark (length gpl-header)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ManHtml
;;
;; source:
;;   http://www.emacswiki.org/cgi-bin/wiki/ManHtml
(setq man-local-alist
      '(
	;; Clojure
	("clojure" "http://richhickey.github.com/clojure/clojure.core-api.html")

	;; Java
	("java5" "http://java.sun.com/j2se/1.5.0/docs/api/") 

	;; GNU Emacs
	("emacswiki" "http://www.emacswiki.org/cgi-bin/wiki/SiteMap")))

(defun man-local (what)
  "Browse HTML documentation according to man-local-alist"
  (interactive
   (let ((page (completing-read (format "What? (default %s): "
					(thing-at-point 'word))
				man-local-alist nil t)))
     (list page)))
  (browse-url (cadr (assoc what man-local-alist))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Handy macros
(setq local-vars "Local Variables:\n\nEnd:\n") 

(defun insert-local-variables ()
  "Insert local variables section at point"
  (interactive)
  (let ((mark (point)))
    (insert local-vars)
    (comment-region mark (+ mark (length local-vars)))))

(defun count-words-buffer ()
  "Print the number of words in the buffer in the minibuffer"
  (interactive)
  (save-excursion
    (let ((count 0))
      (goto-char (point-min))
      (while (< (point) (point-max))
	(forward-word)
	(setq count (1+ count)))
      (message "Buffer contains %d words." count))))

(defun ascii-table ()
  "Display basic ASCII table (0 thru 127)"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (save-excursion 
    (let ((i -1))
      (insert "ASCII characters 0 thru 127.\n\n")
      (insert " Hex  Dec  Char|  Hex  Dec  Char|  Hex  Dec  Char|  Hex  Dec  Char\n")
      (while (< i 31)
	(insert 
	 (format "%4x %4d %4s | %4x %4d %4s | %4x %4d %4s | %4x %4d %4s\n"
		 (setq i (+ 1  i)) i (single-key-description i)
		 (setq i (+ 32 i)) i (single-key-description i)
		 (setq i (+ 32 i)) i (single-key-description i)
		 (setq i (+ 32 i)) i (single-key-description i)))
	(setq i (- i 96)))))
  (toggle-read-only 1))

;; helpers (non interactive)
(defun join (join-char &rest others)
  "`join' as in perl"
  (mapconcat 'identity 'others join-char))

(eval-when-compile 
  (require 'cl)
  (assert (string-equal "a" (join "|" "a")))
  (assert (string-equal "a|b" (join "|" "a" "b")))
)

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
