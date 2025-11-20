;; Sam's init file begins here

;; core settings
(setq
 visible-bell t
 make-backup-files nil
 auto-save-default nil
 )
(tool-bar-mode -1) ;; remove tool bar
(repeat-mode 1)
(winner-mode 1) ;; remember windows configuration
(tab-bar-mode 1)
(global-tab-line-mode 1)
(tab-bar-history-mode 1)
(global-visual-line-mode 1)
(toggle-truncate-lines 1)
(global-display-line-numbers-mode 1)
(column-number-mode 1) ;; display (line, column) in modeline
(global-superword-mode 1) ;; treats snake_case as one word
(global-subword-mode 1) ;; treats CamelCase as separate words
(show-paren-mode 1)
(electric-pair-mode 1)

;; global key settings
(global-set-key [remap list-buffers] 'ibuffer)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-[") 'tab-bar-history-back)
(global-set-key (kbd "M-]") 'tab-bar-history-forward)

;; set up package.el to work with MELPA
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     )

;; list of packages to install
(setq package-selected-packages '(rg
				  ag
				  magit
				  projectile
				  )
      )

;; if packages are not found install them
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages)
  )

;; windmove
(windmove-default-keybindings)

;; ripgrep
(require 'rg)

;; ag
(require 'ag)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq-default confirm-nonexistent-file-or-buffer nil)
(setq ido-ignore-extensions t)
(ido-mode 1)

;; eglot
(use-package eglot
  :ensure t
  :defer t
  :config
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) "clangd"))
  :hook
  ((c-mode . eglot-ensure)
   (c++-mode . eglot-ensure))
  )

;; projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)
	      )
  )

;; magit
(use-package magit
  :ensure t
  )
