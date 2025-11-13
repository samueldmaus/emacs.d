;; Sam's init file begins here

;; core settings
(setq
 visible-bell t
 make-backup-files nil
 auto-save-default nil
 )

(tool-bar-mode -1)

;; attr setting
(set-face-attribute 'font-lock-string-face nil
		    :foreground "orange red"
		    )

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

;; ripgrep
(require 'rg)

;; ag
(require 'ag)

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







