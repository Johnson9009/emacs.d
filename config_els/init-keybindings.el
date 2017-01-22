(defun global-set-escape-sequence-key (key command)
  "Map escape sequence to KEY then `global-set-key' KEY with COMMAND."
  (map-escape-sequence-key key)
  (global-set-key (kbd key) command))

(defun map-escape-sequence-key (key)
  "Map KEY from escape sequence \"\e[emacs-KEY\"."
  (define-key function-key-map (concat "\e[emacs-" key) (kbd key)))

;;Key Binding for Swiper.
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "s-/") 'hippie-expand)

(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x n") 'next-file-buffer)
(global-set-key (kbd "C-x p") 'previous-file-buffer)

;;Insert spaces instead of TAB.
(global-set-key (kbd "TAB") 'tab-to-tab-stop)

(global-set-key (kbd "M-/") 'undo-tree-redo)

(global-set-key (kbd "C-o") 'origami-toggle-node)

(global-set-key (kbd "C-c e") 'er/expand-region)

;;Prevent dired-mode to create so many different temporary buffers.
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;Use C-n C-p to select items in company-mode
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(provide 'init-keybindings)
