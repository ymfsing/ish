;;; init-python.el --- initialize python mode settings -*- lexical-binding: t; -*-


(use-package python
  :ensure nil
  :hook (inferior-python-mode . (lambda ()
                                  (process-query-on-exit-flag
                                   (get-process "Python"))))
  :init
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)
  :config
  ;; Default to Python 3. Prefer the versioned Python binaries since some
  ;; systems stupidly make the unversioned one point at Python 2.
  (when (and (executable-find "python3")
             (string= python-shell-interpreter "python"))
    (setq python-shell-interpreter "python3"))

  ;; Format using YAPF
  ;; Install: pip install yapf
  (use-package yapfify
    :diminish yapf-mode
    :hook (python-mode . yapf-mode))

  ;; https://emacs-lsp.github.io/lsp-python-ms/
  ;; https://pvsc.blob.core.windows.net/python-language-server-stable?restype=container&comp=list&prefix=Python-Language-Server-osx-x64
  ;; extract and "sudo chmod -R +x ~/.emacs.d/tool/mspyls/"
  (use-package lsp-python-ms
    :ensure t
    :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp-deferred)))
    :config
    (setq lsp-python-ms-executable "~/.emacs.d/tools/mspyls/Microsoft.Python.LanguageServer/Microsoft.Python.LanguageServer"))

  )


(provide 'init-python)


;;; init-python.el ends here
