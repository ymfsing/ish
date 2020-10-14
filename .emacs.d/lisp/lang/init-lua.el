;;; init-lua.el --- lua config -*- lexical-binding: t; -*-


(use-package lua-mode
  :mode "\\.lua$"
  :interpreter "lua"
  :config
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents t)
  (setq lua-prefix-key nil)

  ;; https://github.com/EmmyLua/EmmyLua-LanguageServer
  (use-package lsp-lua-emmy
    :ensure nil
    :load-path "lisp/modules/lsp-lua-emmy"
    :demand
    :config
    (setq lsp-lua-emmy-jar-path (expand-file-name "tools/emmylua/EmmyLua-LS-all.jar" user-emacs-directory)))
  )


(provide 'init-lua)


;;; init-lua.el ends here
