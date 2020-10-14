;;; init-lsp.el --- The language server. 	-*- lexical-binding: t -*-
;; https://emacs-lsp.github.io/lsp-mode/

(use-package lsp-mode
  :hook
  (lsp-mode . lsp-ui-mode)
  (sh-mode . lsp-deferred)
  (c-mode . lsp-deferred)
  (cmake-mode . lsp-deferred)
  (python-mode . lsp-deferred)
  (lua-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :custom
  (lsp-log-io nil)
  (lsp-keymap-prefix "C-c l")
  (lsp-enable-indentation nil)
  (lsp-enable-links nil)
  (lsp-prefer-capf t)
  )


(use-package lsp-ui
  :commands (lsp-ui-mode lsp-ui-peek-find-definistions lsp-ui-peek-find-references)
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references))
  :hook (lsp-mode . lsp-ui-mode)
  )


(use-package lsp-ivy
  :after lsp-mode
  :bind (:map lsp-mode-map
              ([remap xref-find-apropos] . lsp-ivy-workspace-symbol)
              ("C-s-." . lsp-ivy-global-workspace-symbol))
  )


(use-package company-lsp
  :commands company-lsp
  :after company
  :custom
  (company-lsp-cache-candidates 'auto)
  :config
  (add-to-list 'company-backends 'company-lsp)
  )


;; https://github.com/gregsexton/origami.el
(use-package lsp-origami
  :after lsp-mode
  :hook (origami-mode . lsp-origami-mode)
  )


(provide 'init-lsp)


;;; init-lsp.el ends here
