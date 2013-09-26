;; This module allows you to view Java bytecode of a class file 
;; (With syntax-highlighting, which makes it much easier than reading
;;  the plain output produced by javap ;) )
(add-to-list 'file-name-handler-alist '("\\.class$" . class-file-handler))

(defun class-file-handler (op &rest args)
  "For .class file(s), call javap on them, and print the output to the main buffer"
  (if (eq op 'get-file-buffer)
      ((lambda (file)
         (with-current-buffer (create-file-buffer file)
           (call-process "javap"
                         nil
                         (current-buffer)
                         nil
                         "-verbose" ;; TODO: make this configurable
                         "-classpath"
                         (file-name-directory file)
                         (file-name-sans-extension (file-name-nondirectory file)))
           (setq buffer-file-name file)
           (setq buffer-read-only nil) ;; TODO: make this configurable
           (goto-char (point-min))  ;; jump back to the beginning of the buffer
           (java-mode)              ;; *pretend* that this is a java file, so we can have the highlighting
           (current-buffer)))
       (car args))
    (do-class-file-handler op args)))

(defun do-class-file-handler (op args)
  "Run the handler"
  ((lambda (inhibit-file-name-handlers inhibit-file-name-operation)
     (apply op args))
   (cons 'class-file-handler
         (and (eq inhibit-file-name-operation op)
              inhibit-file-name-handlers))
   op))
    

