; This kill all lines starting at the current position
; to the end of the file

(defun kill-to-end ()
  "Kills text from the cursor postion to EOF."
  (interactive)
  (save-excursion (let ((beg (point))
                        (end (point-max)))
                    (kill-region beg end)))) 