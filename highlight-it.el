(defun highlite-it ()
  "Highlight certain lines…"
  (interactive)
  (if (equal "log" (file-name-extension (buffer-file-name)))
      (progn
        (highlight-lines-matching-regexp "ERROR:" 'hi-red-b) 
        (highlight-lines-matching-regexp "NOTE:" 'hi-blue-b))))

(add-hook 'find-file-hook 'highlite-it)