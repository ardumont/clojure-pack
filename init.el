(install-packs '(;; midje (testing framework for clojure)
                 nrepl
                 nrepl-ritz
                 midje-mode
                 expectations-mode))

(require 'expectations-mode)

(add-to-list 'auto-mode-alist '("\.dtm$" . clojure-mode))

(defun my-nrepl-mode-setup ()
  (interactive)
  (require 'nrepl-ritz))

(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)
;; deal with camel case movement inside the clojure mode
(add-hook 'clojure-mode-hook 'subword-mode)

;; (defun jack-in-once ()
;;   "Check the existence of a repl session (nrepl). If it doesn't exist, launch it."
;;   (interactive)
;;   (exists-session-or-spawn-it "*nrepl-server*" (lambda () (nrepl-ritz-jack-in nil))))

;; (add-hook 'clojure-mode-hook 'jack-in-once)

;; remove the limitation of emacs-live concerning the clojure nrepl
(defun nrepl-remove-limit-print-length ()
  (interactive)
  (nrepl-send-string-sync "(set! *print-length* nil)" "clojure.core"))

;; reset the limitation of emacs-live concerning the clojure nrepl
(defun nrepl-set-limit-print-length ()
  (interactive)
  (nrepl-send-string-sync "(set! *print-length* 100)" "clojure.core"))

;; Load bindings config
(live-load-config-file "bindings.el")
