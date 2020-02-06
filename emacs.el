
(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package hydra :ensure t)
;;(use-package js2-mode :ensure t)

(use-package lsp-mode
  :hook (js-mode . lsp)
  :hook (php-mode . lsp)
  :hook (css-mode . lsp)
  :hook (web-mode . lsp)
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'js-mode-hook 'flycheck-mode)
(add-hook 'js-jsx-mode-hook 'flycheck-mode)
(use-package company-lsp :commands company-lsp)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(setq lsp-language-id-configuration '((css-mode . "css")
				      (xml-mode . "xml")
				      (web-mode . "html")
				      (html-mode . "html")
				      (sgml-mode . "html")
				      (mhtml-mode . "html")
				      (php-mode . "php")
				      (json-mode . "json")
				      (js-mode . "javascript")
				      (js-jsx-mode . "javascript")
				      ;;(typescript-mode . "typescript")
				      ))


(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(global-set-key (kbd "C-c x") 'lsp-execute-code-action);

;;(yas-reload-all)
;;(add-hook 'js-mode-hook #'yas-minor-mode)
(yas-global-mode 1)

(setq lsp-prefer-flymake nil)

;; Use web-mode for Javascript development
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files

(when (fboundp 'winner-mode)
        (winner-mode 1))
