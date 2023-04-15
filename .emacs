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
(setq inhibit-startup-message t) ;; Don't show the splash screen
(global-display-line-numbers-mode 1) ;; Display line numbers in every buffer
(when (display-graphic-p) (scroll-bar-mode -1))
(tool-bar-mode -1)
(tooltip-mode -1)
;;(global-visual-line-mode 1) ;; Line wrapping
(setq ring-bell-function 'ignore)
(when (display-graphic-p) (set-fringe-mode 10)) ;; Breathing room

(set-face-attribute 'default nil :font "Source Code Pro") ;; Set font


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package command-log-mode)

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
(setq-default truncate-lines t)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Set up key bindings
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c e") 'neotree-toggle)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator #x2501
      org-agenda-compact-blocks t
      org-agenda-files '("~/notes/")
      org-log-done 'time
      org-refile-targets '((org-agenda-files :maxlevel . 5))
      org-refile-use-outline-path 'file
      org-log-into-drawer t
      org-capture-templates
      '(("n" "note" entry (file "~/notes/Inbox.org") "" nil nil)
	("t" "todo" entry (file "~/notes/Inbox.org") "* TODO %^{Title}" )))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(ispell-dictionary nil)
 '(org-capture-templates
   '(("n" "note" entry
      (file "~/Documents/notes/Inbox.org")
      "\"\"")
     ("t" "todo" entry
      (file "~/Documents/notes/Inbox.org")
      "* TODO %^{Title}")) t)
 '(package-selected-packages
   '(doom ewal-doom-themes rg doom-themes org-bullets helm-fuzzy-find json-mode helpful ivy-rich rainbow-delimiters command-log-mode ivy notmuch fzf helm zenburn-theme writegood-mode which-key vertico use-package spacemacs-theme solarized-theme python neotree material-theme markdown-mode gruvbox-theme dracula-theme deadgrep counsel better-defaults anti-zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'spacemacs-dark) ;; Set theme
