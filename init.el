(package-initialize)

(add-to-list 'load-path "~/.emacs.d/config_els")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)

(setq custom-file (expand-file-name "config_els/customize.el" user-emacs-directory))
(load-file custom-file)
