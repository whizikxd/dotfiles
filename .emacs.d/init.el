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

(load-theme `naysayer t)

(set-face-attribute 'default nil :font "Fira Code-14")

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

(c-add-style "my-c-style"
	     '("gnu"
	       (c-basic-offset . 8)
	       (tab-width . 8)
	       (indent-tabs-mode . t)
	       (c-label-minimum-indentation . 0)
	       (c-offsets-alist .
				((arglist-close . c-lineup-arglist)
				 (arglist-cont-nonempty . c-lineup-arglist)
				 (arglist-intro . c-lineup-arglist)
				 (label . -1000)
				 (case-label . 0)))))

(setq c-default-style
      '((c-mode . "linux")
	(c++-mode . "linux")
	(other . "gnu")))
