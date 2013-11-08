; This provides three functions to kill text
;   0) kill-to-end: kills all lines starting at the current position
;      to the end of the file
;   1) kill-to-start: kills all lines starting at the current pos to the start
;   2) do-kill: kills lines between two given points

(defun kill-to-end ()
  "Kills text from the cursor position to EOF"
  (interactive)
  (save-excursion (do-kill (point)
                           (point-max))))

(defun kill-to-start ()
  "Kills text from the cursor position to the beginning"
  (interactive)
  (save-excursion (do-kill (point-min)
                           (point))))

(defun do-kill(start end)
  (kill-region start end))
