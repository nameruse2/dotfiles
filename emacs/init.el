(setq gc-cons-threshold (* 50 1000 1000))


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

(setq-default word-wrap t) ;; Line wrapping
(setq ring-bell-function 'ignore)
(when (display-graphic-p) (set-fringe-mode 10)) ;; Breathing room


;; Default frame configuration: full screen, good-looking title bar on macOS
(setq frame-resize-pixelwise t)
(tool-bar-mode -1)                      ; All these tools are in the menu-bar anyway
(setq default-frame-alist '((fullscreen . maximized)

                            ;; You can turn off scroll bars by uncommenting these lines:
                            ;; (vertical-scroll-bars . nil)
                            ;; (horizontal-scroll-bars . nil)

                            ;; Setting the face in here prevents flashes of
                            ;; color as the theme gets activated
                            (background-color . "#000000")
                            (ns-appearance . dark)
                            (ns-transparent-titlebar . t)))


;; Y or N instead of needing yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Use hash on Mac with right ctrl
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Example configuration for Consult
(use-package consult)


(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  ;; (setq completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function. As an alternative,
  ;; try `cape-dict'.
  (setq text-mode-ispell-word-completion nil)

  ;; Emacs 28 and newer: Hide commands in M-x which do not apply to the current
  ;; mode.  Corfu commands are hidden, since they are not used via M-x. This
  ;; setting is useful beyond Corfu.
  (setq read-extended-command-predicate #'command-completion-default-include-p))




(use-package cape
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  :bind (("C-c p p" . completion-at-point) ;; capf
         ("C-c p t" . complete-tag)        ;; etags
         ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
         ("C-c p h" . cape-history)
         ("C-c p f" . cape-file)
         ("C-c p k" . cape-keyword)
         ("C-c p s" . cape-elisp-symbol)
         ("C-c p e" . cape-elisp-block)
         ("C-c p a" . cape-abbrev)
         ("C-c p l" . cape-line)
         ("C-c p w" . cape-dict)
         ("C-c p :" . cape-emoji)
         ("C-c p \\" . cape-tex)
         ("C-c p _" . cape-tex)
         ("C-c p ^" . cape-tex)
         ("C-c p &" . cape-sgml)
         ("C-c p r" . cape-rfc1345))
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-elisp-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
  )



;; cape?
;; Corfu?
;; Embark ?
;; Avy ?
;; Treesitter?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Vertical minibugger completion

(use-package vertico
   :init
   (vertico-mode))




;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))
(setq history-length 25) ;;limit length to reduce impact on start


(use-package orderless ;; Use orderless searching
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))


(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package magit)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package doom-themes)
(setq custom-safe-themes t)
(load-theme 'doom-one)



;;(add-to-list 'load-path "/usr/local/Cellar/mu/1.12.1/share/emacs/site-lisp/mu/mu4e")
;;(require 'mu4e)

(setq ispell-really-aspell t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dont think this is needed
;;(setq org-cycle-seperator-lines 1)

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator #x2501
      org-agenda-compact-blocks t
      org-agenda-files '("~/Documents/notes/inbox.org"))


(setq org-agenda-custom-commands
   '(("x" "Stuck projects" stuck "" nil)
     ("w" todo "WAITING" nil)
     ("z" "agenda and todos" ((agenda) (todo "TODO" ((org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled) (org-agenda-skip-entry-if 'deadline)))) (todo "WAITING")))))

;; (setq org-agenda-custom-commands
;;       '(("w" todo "WAITING" nil)
;;       ("z" "Weekly Review"
;;          ((agenda "" ((org-agenda-span 7))); review upcoming deadlines and appointments
;;                                            ; type "l" in the agenda to review logged items 
;;           (stuck "") ; review stuck projects as designated by org-stuck-projects
;;           (todo "PROJECT") ; review all projects (assuming you use todo keywords to designate projects)
;;           (todo "MAYBE") ; review someday/maybe items
;;           (todo "WAITING"))) ; review waiting items
;;          ;; ...other commands here
;;         ))

;;      '(("x" "Stuck projects" stuck nil))

(setq org-log-done 'time) ;Log date and time a task is complete

(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "DONE(d)")))


;; Projects are tagged with :project:
;; Don't want this tag inheritable
;; Stuck projects are any :project: without TODO's
(setq org-tags-exclude-from-inheritance '("project")
      org-stuck-projects '("+project/-DONE"
			   ("TODO") ()))


(setq org-refile-targets '((org-agenda-files :maxlevel . 5))
      org-outline-path-complete-in-steps nil
      org-refile-use-outline-path 'file
      org-refile-allow-creating-parent-nodes 'confirm
      org-archive-location "~/Documents/notes/archive.org::"
      org-log-into-drawer t)

(setq org-capture-templates
      '(("n" "note" entry (file "~/Documents/notes/inbox.org") "" nil nil)
	("t" "todo" entry (file "~/Documents/notes/inbox.org") "* TODO %^{Title}" )))

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map "\C-cl" 'org-store-link)

(setq-default org-enforce-todo-dependencies t) ;; Cannot set a headline to DONE if children aren’t DONE.

(setq org-agenda-start-with-log-mode t)

;; Make the indentation look nicer
(add-hook 'org-mode-hook 'org-indent-mode)

;; (setq org-todo-keyword-faces
;;     (quote (("TODO" :foreground "red" :weight bold)
;;             ("NEXT" :foreground "blue" :weight bold)
;;             ("DONE" :foreground "forest green" :weight bold)
;;             ("WAITING" :foreground "orange" :weight bold)
;;             ("HOLD" :foreground "magenta" :weight bold)
;;             ("CANCELLED" :foreground "forest green" :weight bold)
;;             ("MEETING" :foreground "forest green" :weight bold)
;;             ("PHONE" :foreground "forest green" :weight bold))))


	
;; (setq gnus-select-method
;;      '(nnimap "imap.gmail.com"))

;; ROAM
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Documents/notes/roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" "1781e8bccbd8869472c09b744899ff4174d23e4f7517b8a6c721100288311fa5" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "6e33d3dd48bc8ed38fd501e84067d3c74dfabbfc6d345a92e24f39473096da3f" "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" "4e2e42e9306813763e2e62f115da71b485458a36e8b4c24e17a2168c45c9cf9d" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" default))
 '(elfeed-feeds
   '("https://www.ripe.net/news.xml" "https://www.icann.org/en/feed/board_materials" "https://www.icann.org/en/blogs" "https://krebsonsecurity.com/feed/"))
 '(package-selected-packages
   '(yapfify lsp-pyright pyvenv hide-mode-line dap-mode lsp-ui company lsp-mode jinx avy embark-consult embark restclient request nano-agenda nano-modeline org-super-agenda corfu-terminal corfu-popupinfo vertico-directory deft company-jedi jedi swiper-helm ivy nano-theme lua-mode helm-fuzzy-find langtool consult helm-org helm-org-rifle helm todotxt flycheck-aspell org-modern org-roam magit vterm treemacs mu4easy lsp-docker docker-compose-mode w3m gruvbox-theme ef-themes markdown-mode elfeed pdf-tools doom-themes which-key rainbow-delimiters)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)


(setq gc-cons-threshold (* 2 1000 1000))
