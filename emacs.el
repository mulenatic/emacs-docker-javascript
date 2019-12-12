(message "==== Reading configuration from .emacs.el ===")

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(load-theme 'zenburn t)

;;company
(global-company-mode)

(add-to-list 'company-backends '(company-shell company-shell-env company-irony))

;; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)
;; Cusom mod configurations
;; turn of the menu bar
(menu-bar-mode -1)
;; turn of the tool bar
(if window-system
    (tool-bar-mode -1) )

(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-java :ensure t :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java :after (lsp-java))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-magit
  :after treemacs magit
    :ensure t)

(global-set-key (kbd "C-c x") 'lsp-execute-code-action);
