;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)


;;-------------Customised configs--------------

; turn on line/column number for easy navigation
(require 'linum)         
(column-number-mode t)    
(global-linum-mode t)


; maximum characters on a line (for readability)
(setq-default fill-column 80)

; spell check (in comments)
(setq ispell-check-comments t)

; tab-indent
(setq-default indent-tabs-mode nil)

; load change EOL func
(load "/home/vynguye/emacs-plugins/change-eol.el")

; hightlight error:
;(load "/home/vynguye/emacs-plugins/highlight-it.el")

; generate/view bytecode from .class file(s)
(load "/home/vynguye/emacs-plugins/class-file-handler.el")

; kill from current cursor to the end
(load "/home/vynguye/emacs-plugins/kill-to-end.el")

; to show battery usage
(display-battery-mode)

