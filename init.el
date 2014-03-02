;;; clojure-pack.el --- Clojure configuration

;;; Commentary:

;;; Code:

(install-packs '(cider
                 midje-mode
                 expectations-mode
                 clojure-mode))

(require 'cider)
(require 'clojure-mode)
(require 'expectations-mode)

;; datomic file open in clojure-mode
(add-to-list 'auto-mode-alist '("\.dtm$" . clojure-mode))

;; deal with camel case movement inside the clojure mode
(add-hook 'clojure-mode-hook 'subword-mode)

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (and (fboundp 'smartscan-mode) smartscan-mode (smartscan-mode -1))
            (local-set-key (kbd "M-RET") 'cider-doc)))

;; help in repl with :
;; (setq cider-repl-shortcut-dispatch-char ?\:)

(add-hook 'cider-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c n e b") 'cider-eval-buffer)
            (local-set-key (kbd "M-RET") 'cider-doc)))

;;; clojure-pack.el ends here
