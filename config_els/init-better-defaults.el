(global-auto-revert-mode 1)
;;This configuration will delete the content that being selected,
;;when we paste something.
(delete-selection-mode 1)

(setq auto-save-default nil)
(setq make-backup-files nil)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-defaults)
