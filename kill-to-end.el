; This kills all lines starting at the current position
; to the end of the file

(defun kill-to-end ()
  "Kills text from the cursor position to EOF"
  (interactive)
  (save-excursion ((lambda (start end)
                     (kill-region start end))
                   (point)
                   (point-max))))

;(defun kill-to-end ()
;  "Kills text from the cursor postion to EOF."
;  (interactive)
;  (save-excursion (let ((start (point))
;                        (end (point-max)))
;                    (kill-region start end)))) 