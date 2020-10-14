;;; Init-ui.el --- initialize UI system -*- lexical-binding: t; -*-


;; fonts
;; https://manateelazycat.github.io/emacs/2020/04/02/org-font.html
(let ((emacs-font-size 14)
      (emacs-font-name "Sarasa Mono SC"))
  (when (display-grayscale-p)
    (set-frame-font (format "%s-%s" (eval emacs-font-name) (eval emacs-font-size)))
    (set-fontset-font (frame-parameter nil 'font) 'unicode (eval emacs-font-name))))


;; Title
(setq frame-title-format '("ymfsing - %b")
      icon-title-format frame-title-format)


;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t)


;; other in early-init
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(vertical-scroll-bars) default-frame-alist)


;; fullscreen on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; Theme
(use-package doom-themes
  :custom-face
  (doom-modeline-buffer-file ((t (:inherit (mode-line bold)))))
  :init
  ;; load it outside use-package due to some bugs
  (load-theme 'doom-solarized-light t)
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


;; linum
;; (global-linum-mode 0)
;; (global-display-line-numbers-mode)
;; (setq display-line-numbers-widen-start t)


;; Suppress GUI features
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Dialog-Boxes.html
(setq use-file-dialog nil
      use-dialog-box nil)


;; Unable to hide welcome screen in Emacs and startup message
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t)


;; Display dividers between windows
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Window-Dividers.html
(setq window-divider-default-places t
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)
(add-hook 'window-setup-hook #'window-divider-mode)


;; for macos
(with-no-warnings
  (when (eq system-type 'darwin)
    ;; Render thinner fonts
    (setq ns-use-thin-smoothing t)
    ;; Don't open a file in a new frame
    (setq ns-pop-up-frames nil)))


(provide 'init-ui)


;;; init-ui.el ends here
