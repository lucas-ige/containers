;; Copyright (c) 2025-now Institut des Géosciences de l'Environnement, France.
;;
;; License: BSD 3-clause "new" or "revised" license (BSD-3-Clause).
;;
;; Emacs configuration to auto-format Python code with Ruff on save.

;; This configuration bit is copied from https://docs.astral.sh/ruff/editors/setup/
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(python-base-mode . ("ruff" "server"))))
(add-hook 'python-base-mode-hook
          (lambda ()
            (eglot-ensure)
            (add-hook 'after-save-hook 'eglot-format nil t)))
