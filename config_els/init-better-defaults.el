(global-auto-revert-mode 1)
;;This configuration will delete the content that being selected,
;;when we paste something.
(delete-selection-mode 1)

(setq auto-save-default nil)
(setq make-backup-files nil)

(recentf-mode 1)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(defun indent-buffer ()
  "Indent all lines of current buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))


(provide 'init-better-defaults)
