(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setopt display-fill-column-indicator-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

(setq inhibit-startup-screen t)

(editorconfig-mode 1)

(setq ring-bell-function 'ignore)

;; (setq display-line-numbers-type 'relative)
;; (global-display-line-numbers-mode 1)

;; Dont create <filename>~ files
(setq make-backup-files nil)

;; Put #<filename># backup files into ~/.emacs-backups
(setq backup-directory-alist `(("." . ".emacs-backups")))
;; Prevent some issues with symlinks and dont keep versions
(setq backup-by-copying t)
(setq version-control nil)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load-theme `naysayer-old t)

(set-face-attribute 'default nil :font "Fira Code-14" :height 140)

;; (setq-default fill-column 80)
;; (add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)

(setq-default show-trailing-whitespace t)

(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq completion-ignore-case t)

(defun my/copy-line-or-region ()
  (interactive)
  (if (use-region-p)
      (call-interactively #'kill-ring-save)
    (kill-new (buffer-substring (line-beginning-position) (line-end-position)))
    (message "Copied line")))
(global-set-key (kbd "M-w") `my/copy-line-or-region)

(global-set-key (kbd "C-x C-b") `switch-to-buffer)


(defun my/isearch-move-to-match-beginning ()
  (when isearch-other-end
    (goto-char (min (point) isearch-other-end))))
(add-hook 'isearch-mode-end-hook #'my/isearch-move-to-match-beginning)

(setq-default tab-always-indent nil)

(setq dired-kill-when-opening-new-dired-buffer t)

(setq c-default-style
      '((c-mode . "linux")
	(c++-mode . "linux")
	(other . "gnu")))

;; Colemak dh binds
(global-set-key (kbd "C-e") 'previous-line)
(global-set-key (kbd "C-i") 'move-end-of-line)

(global-set-key (kbd "C-t") 'forward-char)
(global-set-key (kbd "C-s") 'backward-char)

(global-set-key (kbd "M-t") 'forward-word)
(global-set-key (kbd "M-s") 'backward-word)

(global-set-key (kbd "M-v") 'find-file)
(global-set-key (kbd "M-h") 'switch-to-buffer)

(global-set-key (kbd "C-v") 'delete-forward-char)
(global-set-key (kbd "M-d") 'kill-word)

(global-set-key (kbd "C-u") 'undo)

(global-set-key (kbd "M-i") 'isearch-forward)
(define-key isearch-mode-map (kbd "M-i") 'isearch-repeat-forward)
(global-set-key (kbd "M-y") 'isearch-backward)
(define-key isearch-mode-map (kbd "M-y") 'isearch-repeat-backward)

(global-set-key (kbd "M-e") 'scroll-down-command)
(global-set-key (kbd "M-n") 'scroll-up-command)

(global-set-key (kbd "M-u") 'pop-to-mark-command)

;; Dired
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "n") 'dired-next-line)
  (define-key dired-mode-map (kbd "e") 'dired-previous-line)

  (define-key dired-mode-map (kbd "%") 'dired-up-directory))
