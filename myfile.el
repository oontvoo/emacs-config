(add-to-list 'file-name-handler-alist '("\\.myfile$" . my-file-handler))

(defun my-file-handler (op &rest args)
  "dummy"
  (if (eq op 'get-file-buffer)
      ((lambda (file)
         (with-current-buffer (create-file-buffer file)
           (setq buffer-file-name file)
           (setq buffer-read-only nil)
           (insert "hello world")))
       (car args))
    (do-my-file-handler op args)))


(defun do-my-file-handler (op args)
  "Run the handler"
  ((lambda (inhibit-file-name-handlers inhibit-file-name-operation)
     (apply op args))
   (cons 'my-file-handler
         (and (eq inhibit-file-name-operation op)
              inhibit-file-name-handlers))
   op))


