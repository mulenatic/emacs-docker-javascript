
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

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)
;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)
;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(json-jsonlist)))
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))
;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; Workaround from https://github.com/flycheck/flycheck/issues/1129#issuecomment-319600923
(with-eval-after-load 'flycheck
  (advice-add 'flycheck-eslint-config-exists-p :override (lambda() t)))


;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

(require 'dap-node)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


