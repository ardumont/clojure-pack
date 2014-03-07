;;; clojure-pack.el --- Clojure configuration

;;; Commentary:

;;; Code:

(install-packs '(cider
                 midje-mode
                 clojure-mode
                 smartscan))

(require 'cider)
(require 'clojure-mode)

;; datomic file open in clojure-mode
(add-to-list 'auto-mode-alist '("\.dtm$" . clojure-mode))

;; deal with camel case movement inside the clojure mode
(add-hook 'clojure-mode-hook 'subword-mode)

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (local-set-key (kbd "M-RET") 'cider-doc)))

(add-hook 'cider-repl-mode-hook 'enable-paredit-mode)

;; help in repl with :
;; (setq cider-repl-shortcut-dispatch-char ?\:)

(defun cider-namespace-refresh () "Add [org.clojure/tools.namespace \"0.2.4\"] to project.clj - Help to deal with clojure namespace"
  (interactive)
  (cider-interactive-eval
   "(require 'clojure.tools.namespace.repl)
    (clojure.tools.namespace.repl/refresh)"))

(add-hook 'cider-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c c e b") 'cider-eval-buffer)
            (local-set-key (kbd "C-c c M-r") 'cider-namespace-refresh)
            (local-set-key (kbd "M-RET") 'cider-doc)))

(require 'smartscan)
(add-hook 'clojure-mode-hook (lambda () (smartscan-mode)))

;;; clojure-pack.el ends here
