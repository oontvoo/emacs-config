;; This module allows you to view JVM bytecode of a class file 
(add-to-list 'file-name-handler-alist '("\\.class$" . class-file-handler))
 
(defun class-file-handler (op &rest args)
  "For .class files, call javap on them, and print the output to the main buffer."
  (cond
   ((eq op 'get-file-buffer)
    (let ((file (car args)))
      (with-current-buffer (create-file-buffer file)
        (call-process "javap" nil (current-buffer) nil "-verbose" ;TODO make this configurable
                      "-classpath" (file-name-directory file)
                      (file-name-sans-extension (file-name-nondirectory file)))
        (setq buffer-file-name file)
;        (setq buffer-read-only nil) TODO: make this configurable
        (set-buffer-modified-p nil)
        (goto-char (point-min))
        (java-mode)
        (current-buffer))))
   ((do-class-file-handler op args))))

(defun do-class-file-handler (op args)
  "Run the real handler without the javap handler installed."
  (let ((inhibit-file-name-handlers
         (cons 'class-file-handler
               (and (eq inhibit-file-name-operation op)
                    inhibit-file-name-handlers)))
        (inhibit-file-name-operation op))
    (apply op args)))