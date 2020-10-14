;;; init-dired.el --- dired interactions  -*- lexical-binding: t; -*-


(use-package ibuffer
  :functions my-ibuffer-find-file
  :commands (ibuffer-find-file
             ibuffer-current-buffer)
  :init (setq ibuffer-filter-group-name-face '(:inherit (font-lock-string-face bold)))
  :config
  ;; Display buffer icons on GUI
  (with-eval-after-load 'counsel
    (defun my-ibuffer-find-file ()
      (interactive)
      (let ((default-directory (let ((buf (ibuffer-current-buffer)))
                                 (if (buffer-live-p buf)
                                     (with-current-buffer buf
                                       default-directory)
                                   default-directory))))
        (counsel-find-file default-directory)))
    (advice-add #'ibuffer-find-file :override #'my-ibuffer-find-file))

  ;; Group ibuffer's list by project root
  (use-package ibuffer-projectile
    :functions ibuffer-do-sort-by-alphabetic
    :hook ((ibuffer . (lambda ()
                        (ibuffer-projectile-set-filter-groups)
                        (unless (eq ibuffer-sorting-mode 'alphabetic)
                          (ibuffer-do-sort-by-alphabetic)))))))


;; directory operations
(use-package dired
  :ensure nil
  :config
  ;; Always delete and copy recursively
  (setq dired-recursive-deletes 'always
        dired-recursive-copies 'always)

  (when (eq system-type 'darwin)
    ;; Suppress the warning: `ls does not support --dired'.
    ;; https://stackoverflow.com/questions/4076360/error-in-dired-sorting-on-os-x
    (setq dired-use-ls-dired nil)
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil))

    (setq executable-find "ls")

    ;; Show directory first
    (setq dired-listing-switches "-alh --group-directories-first")


  ;; Show git info in dired
  (use-package dired-git-info
    :bind (:map dired-mode-map
                (")" . dired-git-info-mode)))
  (add-hook 'dired-after-readin-hook 'dired-git-info-auto-enable)

  ;; Allow rsync from dired buffers
  (use-package dired-rsync)

  ;; Colourful dired
  (use-package diredfl
    :hook (dired-mode . diredfl-mode))

  ;; Extra Dired functionality
  (use-package dired-aux :ensure nil)

  (use-package dired-x
    :ensure nil
    :hook (dired-mode . dired-omit-mode)
    :demand
    :custom
    (dired-omit-files (rx (or ".git" ".svn"
                              ".cache"))))
  )

;; `find-dired' alternative using `fd'
(when (executable-find "fd")
  (use-package fd-dired))


(provide 'init-dired)


;;; init-dired.el ends here
