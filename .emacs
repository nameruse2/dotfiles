
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define and initialise package repositories
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)			
(setq use-package-always-ensure t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic quality of life improvements
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-visual-line-mode 0)
(setq inhibit-startup-message t) ;; Don't show the splash screen
(global-display-line-numbers-mode 0) ;; Display line numbers in every buffer
(when (display-graphic-p) (scroll-bar-mode -1))
(tool-bar-mode -1)
(tooltip-mode -1)
;; (menu-bar-mode -1)
(setq-default word-wrap t) ;; Line wrapping
(setq ring-bell-function 'ignore)
(when (display-graphic-p) (set-fringe-mode 10)) ;; Breathing room

(set-face-attribute 'default nil :font "Source Code Pro") ;; Set font
(if (window-system)
    (set-frame-font "Source Code Pro 12"))

;; Y or N instead of needing yes or no
(fset 'yes-or-no-p 'y-or-n-p)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package command-log-mode)

;; Theme
(use-package zenburn-theme
  :init (load-theme 'zenburn t))

;; Better Modeline
;; use `M-x all-the-icons-install-fonts` first install
(use-package all-the-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))


(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))


;; Set up file handling
;; (setq-default truncate-lines t)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Set up key bindings
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c e") 'neotree-toggle)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator #x2501
      org-agenda-compact-blocks t
      org-agenda-files '("~/Documents/notes/")
      org-agenda-custom-commands '(("w" todo "WAITING" nil))
      org-log-done 'time
      org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "DONE(d)"))
      org-refile-targets '((org-agenda-files :maxlevel . 5))
      org-refile-use-outline-path 'file
      org-archive-location "~/org/archive.org::"
      org-log-into-drawer t
      org-capture-templates
      '(("n" "note" entry (file "~/Documents/notes/Inbox.org") "" nil nil)
	("t" "todo" entry (file "~/Documents/notes/Inbox.org") "* TODO %^{Title}" )))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b40f11c174e7e475508f1e2c1cfca354d37212494c143a494f27239c7d71a294" "18631300c9090ac9f588b07d0ef4b1d093143a31e8c8c29e9fc2a57db1cdf502" "2cc1b50120c0d608cc5064eb187bcc22c50390eb091fddfa920bf2639112adb6" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(elfeed-feeds '("https://krebsonsecurity.com/feed/"))
 '(ispell-dictionary nil)
 '(org-capture-templates
   '(("n" "note" entry
      (file "~/Documents/notes/Inbox.org")
      "\"\"")
     ("t" "todo" entry
      (file "~/Documents/notes/Inbox.org")
      "* TODO %^{Title}")) t)
 '(package-selected-packages
   '(todotxt slack olivetti modus-themes vterm elfeed evil company rg helm-fuzzy-find json-mode helpful ivy-rich command-log-mode ivy notmuch fzf helm writegood-mode which-key vertico python neotree markdown-mode deadgrep counsel better-defaults))
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (load-theme 'spacemacs-dark) ;; Set theme
