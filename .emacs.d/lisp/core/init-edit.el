;;; init-edit.el --- henhanced file editing  -*- lexical-binding: t; -*-


;; Automatically reload files was modified by external program
(use-package autorevert
  :ensure nil
  :diminish
  :hook
  (after-init . global-auto-revert-mode)
  )


;; Pass a URL to a WWW browser
(use-package browse-url
  :ensure nil
  :defines dired-mode-map
  )


;; Jump to things in Emacs tree-style
(use-package avy
  :hook
  (after-init . avy-setup-default)
  :config
  (setq avy-all-windows nil
        avy-all-windows-alt t
        avy-background t
        avy-style 'pre)
  )


;; Quickly follow links
(use-package ace-link
  :defines
  (org-mode-map
   gnus-summary-mode-map
   gnus-article-mode-map
   ert-results-mode-map)
  )


;; Show number of matches in mode-line while searching
(use-package anzu
  :diminish
  :bind
  (([remap query-replace] . anzu-query-replace)
   ([remap query-replace-regexp] . anzu-query-replace-regexp)
   :map isearch-mode-map
   ([remap isearch-query-replace] . anzu-isearch-query-replace)
   ([remap isearch-query-replace-regexp] . anzu-isearch-query-replace-regexp))
  :hook
  (after-init . global-anzu-mode)
  )


(use-package ediff
  :ensure nil
  :hook
  (;; show org ediffs unfolded
   (ediff-prepare-buffer . outline-show-all)
   ;; restore window layout when done
   (ediff-quit . winner-undo)
   )
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-merge-split-window-function 'split-window-horizontally)
  )


;; Automatic parenthesis pairing
(use-package elec-pair
  :ensure nil
  :hook (after-init . electric-pair-mode)
  :init (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit))


;; Windows-scroll command
(use-package pager)


;; Undo/Redo
(use-package undo-fu
  :bind (([remap undo] . undo-fu-only-undo)
         ([remap undo-only] . undo-fu-only-undo)))


;; Click to browse URL or to send to e-mail address
(use-package goto-addr
  :ensure nil
  :hook ((text-mode . goto-address-mode)
         (prog-mode . goto-address-prog-mode)))


(use-package origami
  :hook (prog-mode . origami-mode)
  :init (setq origami-show-fold-header t)
  :config (face-spec-reset-face 'origami-fold-header-face))


(use-package yasnippet
  :diminish yas-minor-mode
  :hook (after-init . yas-global-mode)
  :config (use-package yasnippet-snippets))


(provide 'init-edit)


;;; init-edit ends here
