(defun change-eol (fPath sysName)
  "Change file's line ending to unix convention."
  (let (myBuffer)
    (setq myBuffer (find-file fPath))
    (set-buffer-file-coding-system sysName) ; or 'mac or 'dos
    (save-buffer)
    (kill-buffer myBuffer)
   )
)

