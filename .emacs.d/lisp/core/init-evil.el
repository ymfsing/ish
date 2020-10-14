;;; init-evil.el --- init evil mode -*- lexical-binding: t; -*-


(use-package evil
  :hook (after-init . evil-mode)
  :config

  (use-package evil-magit
    :after evil magit)

  ;; start defining keybinding
  (use-package general)

  ;; I write lisp
  (progn
    (keyboard-translate ?\( ?\[)
    (keyboard-translate ?\[ ?\()
    (keyboard-translate ?\) ?\])
    (keyboard-translate ?\] ?\)))

  (general-create-definer my-leader-def
    :prefix "SPC"
    :states '(normal visual))

  (general-define-key
   :states '(normal visual)
   "C-r" 'undo-fu-only-redo
   "u" 'undo-fu-only-undo
   ";" 'evil-ex
   ":" 'evil-repeat-find-char)

  (my-leader-def
    ;; M-x
    "SPC" 'counsel-M-x

    ;; file related
    "ff" 'find-file
    "fF" 'find-file-other-window
    "fd" 'delete-file
    "fr" 'rename-file
    "fD" 'dired
    "fj" 'dired-jump
    "fJ" 'dired-jump-other-window
    "fm" 'make-directory

    ;; buffer related
    "bi" 'ibuffer
    "br" 'revert-buffer
    "bkc" 'kill-this-buffer
    "bka" 'kill-all-buffer
    "bko" 'kill-other-buffer
    "bb" 'ivy-switch-buffer
    "bp" 'previous-buffer
    "bn" 'next-buffer
    "bs" 'server-edit

    ;; projectile
    "p" 'projectile-command-map

    ;; shell
    "s" 'shell-pop

    ;; recentfile
    "r" 'recentf-open-files

    ;; windows
    "w" 'evil-window-map
    "wo" 'other-window
    "wd" 'evil-window-delete
    "w-" 'split-window-vertically
    "w=" 'split-window-horizontally
    "wl" 'evil-window-right
    "wh" 'evil-window-left
    "wk" 'evil-window-up
    "wj" 'evil-window-down

    ;; markdown
    "mo"  'markdown-open
    "mp"  'markdown-preview
    "mv"  'markdown-export-and-preview
    ))

(provide 'init-evil)


;;; init-evil.el ends here
