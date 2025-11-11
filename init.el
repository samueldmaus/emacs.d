;; Sam's init file begins here

;; core settings
(setq
 visible-bell t
 make-backup-files nil
 auto-save-default nil
 )

;; set up package.el to work with MELPA
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     )

;; list of packages to install
(setq package-selected-packages '(magit
				  )
      )

;; if packages are not found install them
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages)
  )

;; magit
(use-package magit
  :ensure t
  )
