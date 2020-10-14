;;; Init-ui.el --- initialize UI system -*- lexical-binding: t; -*-


;; font
(set-face-attribute 'default nil :height 100)


;; Title
(setq frame-title-format '("ymfsing - %b")
      icon-title-format frame-title-format)


;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t)


;; linum
;; (global-linum-mode 0)
;; (global-display-line-numbers-mode)
;; (setq display-line-numbers-widen-start t)


;; Unable to hide welcome screen in Emacs and startup message
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t)


;; Display dividers between windows
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Window-Dividers.html
(setq window-divider-default-places t
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)
(add-hook 'window-setup-hook #'window-divider-mode)


(provide 'init-ui)


;;; init-ui.el ends here
