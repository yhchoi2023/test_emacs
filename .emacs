;; commit???

;;; .emacs

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

;; ----------------------------------------
;; Prerequisite (Dependacy)
;; - Target OS version: CentOS Linux release 7.9.2009 (Core)
;; - NAME="CentOS Linux"
;; - VERSION="7 (Core)"
;; - ID="centos"
;; - ID_LIKE="rhel fedora"
;; - VERSION_ID="7"
;; - PRETTY_NAME="CentOS Linux 7 (Core)"
;; - ANSI_COLOR="0;31"
;; - CPE_NAME="cpe:/o:centos:centos:7"
;; - Important
;; ----------------------------------------
;; 0. Install an Emacs
;; - Reference: https://snapcraft.io/install/emacs/centos
;; - Step1: sudo yum install epel-release
;; - Step2: sudo yum install snapd
;; - Step3: sudo systemctl enable --now snapd.socket
;; - Step4: sudo ln -s /var/lib/snapd/snap /snap
;; - Step5: sudo snap install emacs --classic
;; - Step6: Cechk emacs version using C-u M-x emacs-version command:
;; -   GNU Emacs 28.2 (build 2, x86_64-pc-linux-gnu, GTK+ Version 3.24.20, cairo version 1.16.0) of 2023-04-03

;; - Reference: https://www.pluralsight.com/resources/blog/cloud/how-to-install-emacs
;;   - [error] no libpng libjpg libgif/libungif libtiff
;;   - sudo yum install libjpeg-devel libpng-devel libungif-devel libtiff-devel
;;     - Reference: https://tiborsimon.io/articles/tools/compiling-emacs/
;; - Step1: wget https://ftp.gnu.org/gnu/emacs/emacs-29.2.tar.xz (Emacs ftp site: https://ftp.gnu.org/gnu/emacs/)
;; - Step2: sudo yum install texinfo libX11-devel Xaw3d-devel libjpeg-devel libpng-devel libungif-devel libtiff-devel ncurses-devel
;; - Step3: tar xvf emacs-29.2.tar.xz
;; - Step4: cd emacs-29.2
;; - Step5: ./configure --with-gif=ifavailable --with-mailutils
;; - Step6: sudo make
;; - Step7: sudo make install

;; 1. Install a rg (linux program)
;; - Reference: https://www.linode.com/docs/guides/ripgrep-linux-installation/
;; - Step1: sudo yum install yum-util
;; - Step2: sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
;; - Step3: sudo yum install ripgrep

;; 2. Install a fd (linux program)
;; - Reference: https://enting.org/how-to-install-fd-on-centos/
;; - Step1: Downlaod fd-v8.7.0-x86_64-unknown-linux-musl.tar.gz form https://github.com/sharkdp/fd/releases?ref=enting.org
;; - Step2: untar
;; - Stap3: cd untar folder
;; - Step4: cp ./fd /usr/local/bin/
;; - Step5: cp ./fd.1 /usr/local/share/man/man1/
;; - Step6: mandb

;; 3. Install an Iosevka font (linux program)
;; - Reference: https://github.com/be5invis/Iosevka
;; - Step0: Download super-ttc-iosevka-24.1.1.zip from https://github.com/be5invis/Iosevka/releases
;; - Step1: Copy to /usr/share/fonts/Iosevka folder
;; - Step2: Unzip using unzip super-ttc-iosevka-24.1.1.zip command
;; - Step3: run 'sudo fc-cache' or 'sudo fc-cache -f -v'

;; 4. Install a use-package: M-x package-install RET use-package
;; 5. Refresh package contents: M-x package-refresh-contents
;; 6. Once you start .emacs, do
;; - M-x all-the-icons-install-fonts to use icon fonts.
;; - list-package yasnippet-snippets
;; 7. Restart Emacs
;; 8. Update dimmer.el code from: https://github.com/gonewest818/dimmer.el/blob/master/dimmer.el
;; ----------------------------------------
;; Font: Office Code Pro
;; Language server: Eglot
;; File tree: treemacs

;;; Encodings
;; Contrary to what many Emacs users have in their configs, you don't need more
;; than this to make UTF-8 the default coding system:
(set-language-environment "UTF-8")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
 '(diff-switches "-u")
 '(ediff-diff-options "-w")
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(ignored-local-variable-values
   '((verilog-library-flags "-f /data/33_arm_nic-400/all_folder_list.txt")))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(pdf-tools dumb-jump verilog-ext yasnippet-snippets all-the-icons-dired vlf verilog-mode aggressive-indent indent-guide highlight-indentation literate-calc-mode dimmer treemacs-tab-bar eglot rg multiple-cursors all-the-icons fd-dired projectile embark-consult embark marginalia consult neotree doom-modeline zenburn-theme use-package))
 '(safe-local-variable-values
   '((verilog-library-flags "-f /data/33_arm_nic-400/all_folder_list.txt")))
 '(vlf-application 'dont-ask)
 '(vlf-tune-enabled nil)
 '(warning-suppress-log-types '(((unlock-file)))))

;; ----------------------------------------
;; Global package install
;; Do package install even if not define :ensure t
;; ----------------------------------------
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; ----------------------------------------
;; Package auto update
;; Maintain up to date package
;; ----------------------------------------
;; (use-package auto-package-update
;;   :config
;;   (setq auto-package-update-delete-old-version t)
;;   (setq auto-package-update-hide-result t)
;;   (auto-package-update-maybe))

;; ----------------------------------------
;; Package update
;; ----------------------------------------
(require 'package)
(setq package-archives
		'(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
		  ("MELPA Stable" . "https://stable.melpa.org/packages/")
		  ("MELPA"        . "https://melpa.org/packages/"))
		;; package-archive-priorities was introduced in Emacs 25.1
		;; In Emacs 25, there is a variable package-archive-priorities that you can use to prioritize your package repos (e.g. prefer ELPA over MELPA)
		;; The higher the number, the higher the priority of a package archive.
		;; Although archives that are not in package-archive-priorities have a default priority of 0, it's all too easy to forget that.
		package-archive-priorities
		'(("MELPA Stable" . 0)
		  ("GNU ELPA"     . 5)
		  ("MELPA"        . 10)))
(package-initialize)

;; ----------------------------------------
;; Restart emacs from within emacs
;; Reference: https://emacs.stackexchange.com/questions/5428/restart-emacs-from-within-emacs
;; ----------------------------------------
;; In order to automatically update the list of packages, only if there is no package list already
(when (not package-archive-contents)
  (package-refresh-contents))

(defun launch-separate-emacs-in-terminal ()
  (suspend-emacs "fg ; emacs -nw"))

(defun launch-separate-emacs-under-x ()
  (call-process "sh" nil nil nil "-c" "emacs &"))

(defun restart-emacs ()
  (interactive)
  ;; We need the new emacs to be spawned after all kill-emacs-hooks
  ;; have been processed and there is nothing interesting left
  (let ((kill-emacs-hook (append kill-emacs-hook (list (if (display-graphic-p)
																			  #'launch-separate-emacs-under-x
																			#'launch-separate-emacs-in-terminal)))))
	 (save-buffers-kill-emacs)))

;; ----------------------------------------
;; Frame size
;; ----------------------------------------
;; (add-to-list 'default-frame-alist '(height . 50))
;; (add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(height . 85))
(add-to-list 'default-frame-alist '(width . 279))

;; ----------------------------------------
;; User interface
;; ----------------------------------------
;; (scroll-bar-mode 0)
;; (menu-bar-mode 0)
(tool-bar-mode 0)

;; ----------------------------------------
;; User interface
;; ----------------------------------------
(use-package verilog-mode
  :ensure t
  )

;; ----------------------------------------
;; verilog-mode indent is the same with notepad++ or VScode
;; ----------------------------------------
;; Enable syntax highlighting of **all** languages
(global-font-lock-mode t)

;; User customization for Verilog mode
(setq verilog-indent-level                    2 ;; Statement indentation (eg if)
		verilog-indent-level-module             2 ;; Modue indnentation (eg always, initial)
		verilog-indent-level-declaration        2 ;; Inside module declaration (eg wire, reg, param)
		verilog-indent-level-behavioral         2
		verilog-indent-level-directive          1
		verilog-case-indent                     2 ;; case indentation
		verilog-auto-newline                    t ;; (default t)
		verilog-auto-indent-on-newline          t ;; (default t)
		verilog-tab-always-indent               t ;; (default t)
		verilog-auto-endcomments                t ;; (default t)
		verilog-minimum-comment-distance        40
		verilog-indent-begin-after-if           t ;; (default t)
		verilog-auto-lineup                     'declarations
		verilog-highlight-p1800-keywords        nil
		verilog-linter			                   "my_lint_shell_command"
		verilog-auto-delete-trailing-whitespace t ;; (default t)
		verilog-cexp-indent                     2 ;;
		verilog-highlight-modules               t ;; (default t)
      verilog-indent-lists                    nil ;; (default t)
		)
(defun my-verilog-hook ()
  (setq indent-tabs-mode nil)
  (setq tab-width 3)
  (add-hook 'verilog-mode-hook 'my-verilog-hook))

;; ----------------------------------------
;; Set tab key enable
;; ----------------------------------------
;; (global-set-key (kbd "TAB") 'self-insert-command)
(global-set-key (kbd "TAB") 'tab-to-tab-stop)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)
(setq indent-line-function 'insert-tab)

;; ----------------------------------------
;; Switch Emacs autosave and backupfile location
;; https://snarfed.org/gnu_emacs_backup_files
;; ----------------------------------------
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.


;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; ----------------------------------------
;; Ediff
;; - to 1. ignore space, 2. split side by side, 3. prevent popup
;; - https://www.reddit.com/r/emacs/comments/skj37/an_emacs_diff_ediff_tutorial/
;; ----------------------------------------



;; ----------------------------------------
;; Comment block with stars
;; ----------------------------------------
(defun insert-doc-comment () (interactive)
		 (insert "/**\n * Description. \n * @param \n * @return \n * @exception \n * @see \n * @author \n */"))
(define-key global-map [(S-f1)] 'insert-doc-comment)

;; ----------------------------------------
;; Enable display line numbers
;; ----------------------------------------
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; ----------------------------------------
;; org-mode
;; - Adding the workflow states to evey org-file
;; ----------------------------------------
(setq org-todo-keywords
		'((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;; ----------------------------------------
;; Emacs Keybindings
;; ----------------------------------------
;; To select rectangular with shift + mouse drag BTN
(defun mouse-start-rectangle (start-event)
  (interactive "e")
  (deactivate-mark)
  (mouse-set-point start-event)
  (rectangle-mark-mode +1)
  (let ((drag-event))
	 (track-mouse
		(while (progn
					(setq drag-event (read-event))
					(mouse-movement-p drag-event))
		  (mouse-set-point drag-event)))))

(global-set-key (kbd "S-<down-mouse-1>") #'mouse-start-rectangle)

;; Window size adjustment
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; 221109 enalbe C-x C-d to duplicate 1 line
;; (global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-c C-d") 'duplicate-line)

;; Not requires the region to start at the beginning of a line when comment
(defun comment-eclipse ()
  (interactive)
  (let ((start (line-beginning-position))
		  (end (line-end-position)))
	 (when (or (not transient-mark-mode) (region-active-p))
		(setq start (save-excursion
						  (goto-char (region-beginning))
						  (beginning-of-line)
						  (point))
				end (save-excursion
						(goto-char (region-end))
						(end-of-line)
						(point))))
	 (comment-or-uncomment-region start end)))

;; Mapping C-x C-b to list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Set Verilog-mode to disable rolling when insert ;
(setq verilog-auto-newline nil)

;; ----------------------------------------
;; Dashboard
;; - Emacs frontpage
;; ----------------------------------------
(use-package try
  :ensure t
  )

;; ----------------------------------------
;; Dashboard
;; - Emacs frontpage
;; ----------------------------------------
(use-package verilog-ext
  :hook ((verilog-mode . verilog-ext-mode))
  :init
  ;; Can also be set through `M-x RET customize-group RET verilog-ext':
  ;; Comment out/remove the ones you do not need
  (setq verilog-ext-feature-list
        '(font-lock
          xref
          capf
          hierarchy
          eglot
          lsp
          ;; lsp-bridge
          ;; lspce
          ;; flycheck
          ;; beautify
          navigation
          template
          formatter
          compilation
          imenu
          which-func
          hideshow
          typedefs
          time-stamp
          block-end-comments
          ports))
  :config
  (verilog-ext-mode-setup))

;; ----------------------------------------
;; Dashboard
;; - Emacs frontpage
;; ----------------------------------------
(use-package dashboard
  :ensure t
  :after all-the-icons
  :config
  ;; Dashboard to open automatically at startup
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  ;; Set the title
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
  ;; Set the banner
  (setq dashboard-startup-banner 1) ;; 1, 2, 3, nil, `official, path/to/your/image.png or text.txt
  (setq dashboard-items '((recents  . 5)
								  (bookmarks . 5)
								  (projects . 5)
								  (agenda . 5)
								  (registers . 5)))
  (setq dashboard-icon-type 'all-the-icons) ;; use `all-the-icons' package
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  ;; To modify heading icons with another icon from all-the-icons octicons:
  (dashboard-modify-heading-icons '((recents . "file-text")
												(bookmarks . "book")))
  ;; To show navigator below the banner:
  (setq dashboard-set-navigator t)
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-navigator-buttons
		  `(;; line1
			 ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
				"Homepage"
				"Browse homepage"
				(lambda (&rest _) (browse-url "https://github.com/yhchoi2023")))
			  ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
			  ("?" "" "?/h" #'show-help nil "<" ">"))
			 ;; line 2
			 ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
				"Linkedin"
				""
				(lambda (&rest _) (browse-url "Linkedin homepage")))
			  ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))
  (setq dashboard-set-init-info t)
  (setq dashboard-set-footer nil)
  ;; To display today’s agenda items on the dashboard, add agenda to dashboard-items:
  (add-to-list 'dashboard-items '(agenda) t)
  ;; To show agenda for the upcomming seven days set the variable dashboard-week-agenda to t
  (setq dashboard-week-agenda t)
  (setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda))

;; ----------------------------------------
;; nyan-mode
;; Error running timer ‘nyan-swich-anim-frame’: (void-function redraw-modeline) [12 times]
;; ----------------------------------------
(use-package nyan-mode
  :init
  :config
  (setq nyan-animate-nyancat t)
  ;; (setq nyan-minimum-window-width 80)
  ;; (setq nyan-bar-length 20)
  (nyan-mode t))

;; ----------------------------------------
;; Neotree
;; - File tree
;; ----------------------------------------
(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  ;; (global-set-key [f8] 'neotree-project-dir)
  (setq neo-theme 'ascii)
  (setq neo-smart-open t)
  ;; (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-window-width 50))

;; ----------------------------------------
;; Ace window
;; ----------------------------------------
(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "C-x o") 'ace-window))

;; ;; ----------------------------------------
;; ;; Dimmer
;; ;; ----------------------------------------
;; (use-package dimmer
;;   :ensure t

;;   :config
;;   (dimmer-configure-org)
;;   (dimmer-configure-posframe)
;;   (dimmer-configure-which-key)
;;   (setq dimmer-fraction 0.4)
;;   (dimmer-mode t))

;; ----------------------------------------
;; Literate Calc Mode
;; ----------------------------------------
(use-package literate-calc-mode
  :ensure t
  :commands
  (literate-calc-minor-mode))

;; ----------------------------------------
;; Indent-guide
;; ----------------------------------------
(use-package indent-guide
  :ensure t
  :config
  ;; Change the character for guides
  (setq indent-guide-char "|")
  (indent-guide-global-mode))

;; ----------------------------------------
;; Aggressive indent
;; ----------------------------------------
(use-package aggressive-indent
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'c-mode-hook #'aggressive-indent-mode)
  (add-hook 'c++-mode-hook #'aggressive-indent-mode)
  ;; You can use this hook on any mode you want
  ;; (global-aggressive-indent-mode 1)
  :config
  (add-to-list
	'aggressive-indent-dont-indent-if
	'(and (derived-mode-p 'c++-mode 'c-mode)
			(null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
									  (thing-at-point 'line))))))

;; ----------------------------------------
;; Multiple-cursors
;; ----------------------------------------
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; ----------------------------------------
;; Smartparens
;; ----------------------------------------
(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode 1)
  :config
  (add-hook 'js-mode-hook #'smartparens-mode))

;; ----------------------------------------
;; Expand-region
;; ----------------------------------------
(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

;; ----------------------------------------
;; Undo-tree
;; - undo-tree-visulize is pure gold
;; ----------------------------------------
(use-package undo-tree
  :ensure t
  :init	(global-undo-tree-mode)
  :custom
  (undo-tree-visualizer-timestamps t)
  (undo-tree-visualizer-diff t)
  ;; Prevent undo tree files from polluting your git repo
  (undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  )

;; ----------------------------------------
;; YASnippets
;; Template system. It allows you to type an abbreviation and automatically expand it into function templates.
;; ----------------------------------------
(use-package yasnippet
  :ensure t
  :bind
  ("C-c y n" . yas-new-snippet)
  ("C-c y i" . yas-insert-snippet)
  ("C-c y v" . yas-visit-snippet-file)
  ("M-z" . yas-expand)
  :config
  (setq yas-snippet-dirs
		  '("~/.emacs.d/snippets"                 ;; personal snippets
			 ;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
			 ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
			 ))
  (yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.
  )
(use-package yasnippet-snippets         ; Collection of snippets
  :ensure t)


;; ----------------------------------------
;; pdf-tools
;; - pdf viewer
;; ----------------------------------------
(use-package pdf-tools
  :ensure t
  :pin manual ;; don't reinstall when package updates
  ;; :mode  ("\\.pdf\\'" . pdf-view-mode)
  :config
  (setq-default pdf-view-display-size 'fit-page)
  ;; ;; automatically annotate highlights
  ;; (pdf-tools-install)
  (setq pdf-annot-activate-created-annotations t)
  )

;; ----------------------------------------
;; vlf
;; ----------------------------------------
(use-package vlf
  :ensure t)
(require 'vlf-setup)


;; (setq vlf-batch-size 5242880)   ;; 5 MB
;; (setq vlf-batch-size 4194304) ;; 4 MB
;; (setq vlf-batch-size 2097152) ;; 2 MB
(setq vlf-batch-size 1048576) ;; 1 MB

;; ----------------------------------------
;; Corfu: In-buffer completion with a small completion popup.
;; Active in Main buffer
;; ----------------------------------------
(use-package corfu
  :ensure t
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-cycle nil)           ;; Disable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  ;; (:map corfu-map ("M-SPC" . corfu-insert-separator2))
  ;; (corfu-quit-at-boundary 'seperator) ;; a non-nil value is necessary
  (corfu-quit-at-boundary nil) ;; a non-nil value is necessary
  (corfu-separator ?\s)          ;; Orderless field separator (?\s: Regular space character)
  ;; (corfu-quit-no-match 'seperator)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  (corfu-scroll-margin 5)        ;; Use scroll margin
  (corfu-auto-delay 0)
  (corfu-auto-prefix 1)
  (completion-styles '(basic))
  ;; (completion-styles '(orderless-fast))
  (corfu-min-width 80)
  (completion-cycle-threshold 3)

  :bind
  ;; Configure SPC for separator insertion
  (:map corfu-map
		  ("M-SPC" . corfu-insert-separator)
		  ;; ("TAB" . corfu-next)
		  ;; ([tab] . corfu-next)
		  ;; ("S-TAB" . corfu-previous)
		  ;; ([backtab] . corfu-previous)
		  )


  :init
  (global-corfu-mode)

  :config
  ;; Enable Corfu more generally for every minibuffer, as long as no other
  ;; completion UI is active. If you use Mct or Vertico as your main minibuffer
  ;; completion UI. From
  ;; https://github.com/minad/corfu#completing-with-corfu-in-the-minibuffer
  (defun corfu-enable-always-in-minibuffer ()
	 "Enable Corfu in the minibuffer if Vertico/Mct are not active."
	 (unless (or (bound-and-true-p mct--active) ; Useful if I ever use MCT
					 (bound-and-true-p vertico--input))
		(setq-local corfu-auto nil)       ; Ensure auto completion is disabled
		(corfu-mode 1)))
  (add-hook 'minibuffer-setup-hook #'corfu-enable-always-in-minibuffer 1)
  )

;; ----------------------------------------
;; Related with Corfu
;; A few more useful configurations...
;; ----------------------------------------
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)
  )

;; ----------------------------------------
;; Carfu addon
;; After install, do M-x all-the-icons-install-fonts to use icon fonts.
;; ----------------------------------------
(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-use-icons t)
  (kind-icon-default-face 'corfu-default) ; Have background color be the same as `corfu' face background
  (kind-icon-blend-background nil)  ; Use midpoint color between foreground and background colors ("blended")?
  (kind-icon-blend-frac 0.08)

  ;; NOTE 2022-02-05: `kind-icon' depends `svg-lib' which creates a cache
  ;; directory that defaults to the `user-emacs-directory'. Here, I change that
  ;; directory to a location appropriate to `no-littering' conventions, a
  ;; package which moves directories of other packages to sane locations.
  ;; (svg-lib-icons-dir (no-littering-expand-var-file-name "svg-lib/cache/")) ; Change cache dir
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter) ; Enable `kind-icon'

  ;; Add hook to reset cache so the icon colors match my theme
  ;; NOTE 2022-02-05: This is a hook which resets the cache whenever I switch
  ;; the theme using my custom defined command for switching themes. If I don't
  ;; do this, then the backgound color will remain the same, meaning it will not
  ;; match the background color corresponding to the current theme. Important
  ;; since I have a light theme and dark theme I switch between. This has no
  ;; function unless you use something similar
  (add-hook 'kb/themes-hooks #'(lambda () (interactive) (kind-icon-reset-cache)))
  )


;; Carfu addon
;; (use-package corfu-doc
;;   ;; NOTE 2022-02-05: At the time of writing, `corfu-doc' is not yet on melpa
;;   :straight (corfu-doc :type git :host github :repo "galeo/corfu-doc")
;;   :after corfu
;;   :hook (corfu-mode . corfu-doc-mode)
;;   :general (:keymaps 'corfu-map
;;             ;; This is a manual toggle for the documentation popup.
;;             [remap corfu-show-documentation] #'corfu-doc-toggle ; Remap the default doc command
;;             ;; Scroll in the documentation window
;;             "M-n" #'corfu-doc-scroll-up
;;             "M-p" #'corfu-doc-scroll-down)
;;   :custom
;;   (corfu-doc-delay 0.5)
;;   (corfu-doc-max-width 70)
;;   (corfu-doc-max-height 20)

;;   ;; NOTE 2022-02-05: I've also set this in the `corfu' use-package to be
;;   ;; extra-safe that this is set when corfu-doc is loaded. I do not want
;;   ;; documentation shown in both the echo area and in the `corfu-doc' popup.
;;   (corfu-echo-documentation nil)
;; )



;; veri-kompass: verilog tree
;; (add-to-list 'load-path "/home/asic/.emacs.d/lisp")
;;  (require 'veri-kompass) ;; Enable veri kompass minor mode mode (add-hook 'verilog-mode-hook 'veri-kompass-minor-mode)

;; ----------------------------------------
;; Flycheck: Syntax checker
;; ----------------------------------------
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  )

;; ----------------------------------------
;; Avy: goto desired word in window
;; If not using use-package, write as below
;; (avy-setup-default)
;; (global-set-key (kbd "C-c C-j") 'avy-resume)
;; ----------------------------------------
(use-package avy
  :ensure t
  :bind ("C-:" . avy-goto-char)
  :bind ("C-'" . avy-goto-char-2)
  ;; :bind ("M-g e" . avy-goto-word-0)
  ;; :bind ("M-g w" . avy-goto-word-1)
  :bind ("M-g M-f" . avy-goto-line)
  ;; resume lastest avy command
  :bind ("C-c C-j" . wavy-resume)
  )

;; ----------------------------------------
;; Consult recommended packages
;; vertico: Fast and minimal vertical completion system
;; marginalia: Annotations for the completion candidates
;; embark and embark-consult: Action commands, which can act on the completion candidates
;; orderless: Completion style which offers flexible candidate filtering
;; ----------------------------------------
(use-package consult
  :ensure t
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :after projectile
  :bind (;; C-c bindings (mode-specific-map)
			("C-c M-x" . consult-mode-command)
			("C-c h" . consult-history)
			("C-c k" . consult-kmacro)
			("C-c m" . consult-man)
			("C-c i" . consult-info)
			([remap Info-search] . consult-info)
			;; C-x bindings (ctl-x-map)
			("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
			("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
			("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
			("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
			("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
			("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
			;; Custom M-# bindings for fast register access
			("M-#" . consult-register-load)
			("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
			("C-M-#" . consult-register)
			;; Other custom bindings
			("M-y" . consult-yank-pop)                ;; orig. yank-pop
			;; M-g bindings (goto-map)
			("M-g e" . consult-compile-error)
			("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
			("M-g g" . consult-goto-line)             ;; orig. goto-line
			("M-g M-g" . consult-goto-line)           ;; orig. goto-line
			("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
			("M-g m" . consult-mark)
			("M-g k" . consult-global-mark)
			("M-g i" . consult-imenu)
			("M-g I" . consult-imenu-multi)
			;; M-s bindings (search-map)
			("M-s d" . consult-find)
			("M-s D" . consult-locate)
			("M-s g" . consult-grep)
			("M-s G" . consult-git-grep)
			("M-s r" . consult-ripgrep)
			("M-s l" . consult-line)
			("M-s L" . consult-line-multi)
			("M-s k" . consult-keep-lines)
			("M-s u" . consult-focus-lines)
			;; Isearch integration
			("M-s e" . consult-isearch-history)
			:map isearch-mode-map
			("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
			("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
			("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
			("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
			;; Minibuffer history
			:map minibuffer-local-map
			("M-s" . consult-history)                 ;; orig. next-matching-history-element
			("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
		  register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
		  xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
	consult-theme :preview-key '(:debounce 0.2 any)
	consult-ripgrep consult-git-grep consult-grep
	consult-bookmark consult-recent-file consult-xref
	consult--source-bookmark consult--source-file-register
	consult--source-recent-file consult--source-project-recent-file
	;; :preview-key "M-."
	:preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
	;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
	;;;; 2. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
	;;;; 3. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
	;;;; 4. projectile.el (projectile-project-root)
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-function (lambda (_) (projectile-project-root)))
	;;;; 5. No project support
  ;; (setq consult-project-function nil)

  ;; (setq projectile-indexing-method 'alien) ;; This should be activate to use "projectile-globally-ignored-directories"
  ;; (setq projectile-enable-caching t) ; To enable caching unconditionally
  ;; (setq projectile-sort-order 'recently-active) ; To sort files by recently active buffers and then recently opened files:
  ;; (setq projectile-file-exists-remote-cache-expire (* 1 10)) ; change the remote file exists cache expire to 10s
  )

;; ----------------------------------------
;; consult-projectile: A package to incorporate projectile into consult
;; Useage: Call function consult-projectile. Narrow selection with B for buffer, F for file or P for project.
;; ----------------------------------------
;; (use-package consult-projectile
;;   :ensure t)

;; This allows to set a not project related buffer be project related and makes consult-projectile treat it as one.
(defun set-buffer-local-project ()
  (interactive)
  (let ((consult-projectile-source-projectile-project-action (lambda (dir) (setq-local projectile-project-root dir))))
	 (consult-projectile)))


;; ----------------------------------------
;; Using projects as a source for consult-buffer
;; Useage: Execute consult-buffer (C-x b)
;; then you can see projectile project at the end of consult-buffer
;; Source: https://sachachua.com/dotemacs/index.html
;; ----------------------------------------
(use-package consult
  :after projectile
  :defines consult-buffer-sources
  :config
  (projectile-load-known-projects)
  (setq my-consult-source-projectile-projects
		  `(:name "Projectile projects"
					 :narrow   ?P
					 :category project
					 :action   ,#'projectile-switch-project-by-name
					 :items    ,projectile-known-projects))
  (add-to-list 'consult-buffer-sources my-consult-source-projectile-projects 'append))


;; ----------------------------------------
;; vertico: Fast and minimal vertical completion system
;; Active in Minibuffer
;; ----------------------------------------
(use-package vertico
  :ensure t
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure t
  :init
  (savehist-mode)
  )

;; A few more useful configurations...
(use-package emacs
  :ensure t
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
	 (cons (format "[CRM%s] %s"
						(replace-regexp-in-string
						 "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
						 crm-separator)
						(car args))
			 (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
		  '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t)
  )


;; ----------------------------------------
;; orderless: Completion style which offers flexible candidate filtering
;; Optionally use the `orderless' completion style.
;; ----------------------------------------
(use-package orderless
  :ensure t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
		  completion-category-defaults nil
		  completion-category-overrides '((file (styles partial-completion))))
  )


;; ----------------------------------------
;; marginalia: Annotations for the completion candidates
;; Enable rich annotations using the Marginalia package
;; ----------------------------------------
(use-package marginalia
  :ensure t
  ;; Either bind `marginalia-cycle' globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
			:map minibuffer-local-map
			("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode)
  )


;; ----------------------------------------
;; embark and embark-consult: Action commands, which can act on the completion candidates
;; ----------------------------------------
(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
	("C-;" . embark-dwim)        ;; good alternative: M-.
	("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
					'("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
					  nil
					  (window-parameters (mode-line-format . none))))
  )

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :after embark
  :hook
  (embark-collect-mode . consult-preview-at-point-mode)
  )

;; ----------------------------------------
;; Projectile
;; - Projectile officially supports Emacs 25.1+.
;; - Adding projectes key: M-x projectile-add-known-project
;; ----------------------------------------
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  ;; (setq projectile-project-search-path '("~/projects/" "~/work/" ("~/github" . 1))) ; Projectile is automatically going to check for projects on startup.

  :bind (:map projectile-mode-map
				  ("s-p" . projectile-command-map)
				  ("C-c p" . projectile-command-map))
  :config
  ;; (setq projectile-indexing-method 'alien) ;; This should be activate to use "projectile-globally-ignored-directories"
  ;; (setq projectile-indexing-method 'hybrid) ;; This should be activate to use "projectile-globally-ignored-directories"
  (setq projectile-indexing-method 'native) ;; This should be activate to use "projectile-globally-ignored-directories"
  (setq projectile-enable-caching t)
  (setq projectile-sort-order 'recently-active) ; To sort files by recently active buffers and then recently opened files:
  (setq projectile-file-exists-remote-cache-expire (* 10 60)) ; change the remote file exists cache expire to 10*60s

  (add-to-list 'projectile-globally-ignored-directories "*backup")
  (add-to-list 'projectile-globally-ignored-directories "backup")
  (add-to-list 'projectile-globally-ignored-directories "*simv.daidir")
  (add-to-list 'projectile-globally-ignored-directories "simv.daidir")
  (add-to-list 'projectile-globally-ignored-directories "*.daidir")
  (add-to-list 'projectile-globally-ignored-directories ".daidir")
  (add-to-list 'projectile-globally-ignored-directories "*DVEfiles")
  (add-to-list 'projectile-globally-ignored-directories "DVEfiles")
  (add-to-list 'projectile-globally-ignored-directories "*run")
  (add-to-list 'projectile-globally-ignored-directories "run")
  ;; Working projectile-globally-ignored-files if `native mode, 230512 verified
  ;; Via C-u C-c p s r command
  (add-to-list 'projectile-globally-ignored-files "*icqueue")
  (add-to-list 'projectile-globally-ignored-files "icqueue")
  (add-to-list 'projectile-globally-ignored-files "*#")
  (add-to-list 'projectile-globally-ignored-files "*.#")
  ;; (add-to-list 'projectile-globally-ignored-files "*#*")	 // Don't use
  ;; (add-to-list 'projectile-globally-ignored-files "*.#*") // Don't use
  (add-to-list 'projectile-globally-ignored-files "*~")
  (add-to-list 'projectile-globally-ignored-files "*TAGS")
  (add-to-list 'projectile-globally-ignored-files "TAGS")
  (add-to-list 'projectile-globally-ignored-files "*.ucli")
  (add-to-list 'projectile-globally-ignored-files ".ucli")
  )

;; ----------------------------------------
;; Magit
;; ----------------------------------------
(use-package magit
  :ensure t
  :bind ("C-x g" . magit))

;; ----------------------------------------
;; diff-hl
;; - Highlights uncommitted changes on the left side of the window (=gutter)
;; ----------------------------------------
(use-package diff-hl
  :ensure t
  :after magit
  :init
  (global-diff-hl-mode)
  :hook
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh)
  :config
  ;; Provides similar functionality in Dired.
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'prog-mode-hook #'diff-hl-mode)
  (add-hook 'org-mode-hook #'diff-hl-mode)
  ;; Changes the highlighting function to use the margin instead of the fringe.
  (diff-hl-margin-mode)
  ;; Implements highlighting changes on the fly.
  (diff-hl-flydiff-mode)
  ;; makes fringe and margin react to mouse clicks to show the curresponding hunk.
  (diff-hl-show-hunk-mouse-mode)
  )

;; ----------------------------------------
;; Eglot
;; ----------------------------------------
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure))

;; ----------------------------------------
;; Link-hint
;; ----------------------------------------
(use-package link-hint
  :ensure t
  :bind
  ("C-c l o" . link-hint-open-link)
  ("C-c l c" . link-hint-copy-link))

;; ----------------------------------------
;; Which Key
;; Useage: Press key binding
;; ----------------------------------------
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-bottom)
  ;; single characters are sorted alphabetically
  (setq which-key-sort-order 'which-key-key-order-alpha)
  ;; Set the time delay (in seconds) for the which-key popup to appear. A value of
  ;; zero might cause issues so a non-zero value is recommended.
  (setq which-key-idle-delay 1.0))

;; ----------------------------------------
;; Zenburn-theme
;; ----------------------------------------
(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ----------------------------------------
;; doom-modeline
;; ----------------------------------------
(use-package doom-modeline
  :ensure t
  :after all-the-icons
  :hook
  (after-init . doom-modeline-mode)
  :config
  ;; If non-nil, cause imenu to see `doom-modeline' declarations.
  ;; This is done by adjusting `lisp-imenu-generic-expression' to
  ;; include support for finding `doom-modeline-def-*' forms.
  ;; Must be set before loading doom-modeline.
  (setq doom-modeline-support-imenu t)

  ;; How tall the mode-line should be. It's only respected in GUI.
  ;; If the actual char height is larger, it respects the actual height.
  (setq doom-modeline-height 25)

  ;; How wide the mode-line bar should be. It's only respected in GUI.
  (setq doom-modeline-bar-width 1)

  ;; Whether to use hud instead of default bar. It's only respected in GUI.
  (setq doom-modeline-hud nil)

  ;; The limit of the window width.
  ;; If `window-width' is smaller than the limit, some information won't be
  ;; displayed. It can be an integer or a float number. `nil' means no limit."
  (setq doom-modeline-window-width-limit 85)

  ;; How to detect the project root.
  ;; nil means to use `default-directory'.
  ;; The project management packages have some issues on detecting project root.
  ;; e.g. `projectile' doesn't handle symlink folders well, while `project' is unable
  ;; to hanle sub-projects.
  ;; You can specify one if you encounter the issue.
  (setq doom-modeline-project-detection 'auto)

  ;; Determines the style used by `doom-modeline-buffer-file-name'.
  ;;
  ;; Given ~/Projects/FOSS/emacs/lisp/comint.el
  ;;   auto => emacs/l/comint.el (in a project) or comint.el
  ;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
  ;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
  ;;   truncate-with-project => emacs/l/comint.el
  ;;   truncate-except-project => ~/P/F/emacs/l/comint.el
  ;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
  ;;   truncate-all => ~/P/F/e/l/comint.el
  ;;   truncate-nil => ~/Projects/FOSS/emacs/lisp/comint.el
  ;;   relative-from-project => emacs/lisp/comint.el
  ;;   relative-to-project => lisp/comint.el
  ;;   file-name => comint.el
  ;;   buffer-name => comint.el<2> (uniquify buffer name)
  ;;
  ;; If you are experiencing the laggy issue, especially while editing remote files
  ;; with tramp, please try `file-name' style.
  ;; Please refer to https://github.com/bbatsov/projectile/issues/657.
  (setq doom-modeline-buffer-file-name-style 'auto)

  ;; Whether display icons in the mode-line.
  ;; While using the server mode in GUI, should set the value explicitly.
  (setq doom-modeline-icon t)

  ;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Whether display the colorful icon for `major-mode'.
  ;; It respects `all-the-icons-color-icons'.
  (setq doom-modeline-major-mode-color-icon t)

  ;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
  (setq doom-modeline-buffer-state-icon t)

  ;; Whether display the modification icon for the buffer.
  ;; It respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
  (setq doom-modeline-buffer-modification-icon t)

  ;; Whether display the time icon. It respects variable `doom-modeline-icon'.
  (setq doom-modeline-time-icon t)

  ;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
  (setq doom-modeline-unicode-fallback nil)

  ;; Whether display the buffer name.
  (setq doom-modeline-buffer-name t)

  ;; Whether highlight the modified buffer name.
  (setq doom-modeline-highlight-modified-buffer-name t)

  ;; Whether display the minor modes in the mode-line.
  (setq doom-modeline-minor-modes nil)

  ;; If non-nil, a word count will be added to the selection-info modeline segment.
  (setq doom-modeline-enable-word-count nil)

  ;; Major modes in which to display word count continuously.
  ;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
  ;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
  ;; remove the modes from `doom-modeline-continuous-word-count-modes'.
  (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

  ;; Whether display the buffer encoding.
  (setq doom-modeline-buffer-encoding t)

  ;; Whether display the indentation information.
  (setq doom-modeline-indent-info nil)

  ;; If non-nil, only display one number for checker information if applicable.
  (setq doom-modeline-checker-simple-format t)

  ;; The maximum number displayed for notifications.
  (setq doom-modeline-number-limit 99)

  ;; The maximum displayed length of the branch name of version control.
  (setq doom-modeline-vcs-max-length 12)

  ;; Whether display the workspace name. Non-nil to display in the mode-line.
  (setq doom-modeline-workspace-name t)

  ;; Whether display the perspective name. Non-nil to display in the mode-line.
  (setq doom-modeline-persp-name t)

  ;; If non nil the default perspective name is displayed in the mode-line.
  (setq doom-modeline-display-default-persp-name nil)

  ;; If non nil the perspective name is displayed alongside a folder icon.
  (setq doom-modeline-persp-icon t)

  ;; Whether display the `lsp' state. Non-nil to display in the mode-line.
  (setq doom-modeline-lsp t)

  ;; Whether display the GitHub notifications. It requires `ghub' package.
  (setq doom-modeline-github nil)

  ;; The interval of checking GitHub.
  (setq doom-modeline-github-interval (* 30 60))

  ;; Whether display the modal state.
  ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
  (setq doom-modeline-modal t)

  ;; Whether display the modal state icon.
  ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
  (setq doom-modeline-modal-icon t)

  ;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
  (setq doom-modeline-mu4e nil)
  ;; also enable the start of mu4e-alert
  ;; (mu4e-alert-enable-mode-line-display)

  ;; Whether display the gnus notifications.
  (setq doom-modeline-gnus t)

  ;; Whether gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
  (setq doom-modeline-gnus-timer 2)

  ;; Wheter groups should be excludede when gnus automatically being updated.
  (setq doom-modeline-gnus-excluded-groups '("dummy.group"))

  ;; Whether display the IRC notifications. It requires `circe' or `erc' package.
  (setq doom-modeline-irc t)

  ;; Function to stylize the irc buffer names.
  (setq doom-modeline-irc-stylize 'identity)

  ;; Whether display the battery status. It respects `display-battery-mode'.
  (setq doom-modeline-battery t)

  ;; Whether display the time. It respects `display-time-mode'.
  (setq doom-modeline-time t)

  ;; Whether display the misc segment on all mode lines.
  ;; If nil, display only if the mode line is active.
  (setq doom-modeline-display-misc-in-all-mode-lines t)

  ;; Whether display the environment version.
  (setq doom-modeline-env-version t)
  ;; Or for individual languages
  (setq doom-modeline-env-enable-python t)
  (setq doom-modeline-env-enable-ruby t)
  (setq doom-modeline-env-enable-perl t)
  (setq doom-modeline-env-enable-go t)
  (setq doom-modeline-env-enable-elixir t)
  (setq doom-modeline-env-enable-rust t)

  ;; Change the executables to use for the language version string
  (setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
  (setq doom-modeline-env-ruby-executable "ruby")
  (setq doom-modeline-env-perl-executable "perl")
  (setq doom-modeline-env-go-executable "go")
  (setq doom-modeline-env-elixir-executable "iex")
  (setq doom-modeline-env-rust-executable "rustc")

  ;; What to display as the version while a new one is being loaded
  (setq doom-modeline-env-load-string "...")

  ;; By default, almost all segments are displayed only in the active window. To
  ;; display such segments in all windows, specify e.g.
  (setq doom-modeline-always-visible-segments '(mu4e irc))

  ;; Hooks that run before/after the modeline version string is updated
  (setq doom-modeline-before-update-env-hook nil)
  (setq doom-modeline-after-update-env-hook nil)
  (setq inhibit-compacting-font-caches t)
  )

;; To use icons
;; all-the-icons are necessary. Then run M-x all-the-icons-install-fonts to install the resource fonts. On Windows, the fonts should be installed manually.
(use-package all-the-icons
  :if (display-graphic-p))
(use-package all-the-icons-dired
  :ensure t
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package multiple-cursors
  :ensure t)

;; ----------------------------------------
;; Projectile ignore settings
;; ----------------------------------------
;; Due to "alien" indexing method, globally ignore folders/files by
;; re-defining "rg" args
(mapc (lambda (item)
		  (add-to-list 'projectile-globally-ignored-directories item))
		;; '(""))
		;; '("DVEfiles" "Backup" "backup" "#*#" ".#*" "*~" ))
		'("DVEfiles" "TAGS"))
;; files to be ignored should be listed in "~/.emacs.d/rg_ignore"

;; Use the faster searcher to handle project files: ripgrep "rg"
(when (and (not (executable-find "fd"))
			  (executable-find "rg"))
  (setq projectile-generic-command
		  (let ((rg-cmd ""))
			 (dolist (dir projectile-globally-ignored-directories)
				(setq rg-cmd (format "%s --glob '!%s'" rg-cmd dir)))
			 (setq rg-ignorefile
					 (concat "--ignore-file" " "
								(expand-file-name "rg_ignore" user-emacs-directory)))
			 (concat "rg -0 --files --color=never --hidden" rg-cmd " " rg-ignorefile))))

;; https://emacs.stackexchange.com/questions/16497/how-to-exclude-files-from-projectile
;; ignoring folder by option --glob with folders read from projectile-globally-ignored-directories that you set;
;; ignoring files by option --ignore-file. However, this option specifies a file that lists all files to be ignored. The easy way is;; to create a global file (e.g., in ~/.emacs.d/) and list there all files that you like to put to projectile-globally-ignored-files

;; (setq projectile-enable-caching t)

;; ;;; Default rg arguments
;;   ;; https://github.com/BurntSushi/ripgrep
;;   (when (executable-find "rg")
;;     (progn
;;       (defconst modi/rg-arguments
;;         `("--line-number"                     ; line numbers
;;           "--smart-case"
;;           "--follow"                          ; follow symlinks
;;           "--mmap")                           ; apply memory map optimization when possible
;;         "Default rg arguments used in the functions in `projectile' package.")

;;       (defun modi/advice-projectile-use-rg ()
;;         "Always use `rg' for getting a list of all files in the project."
;;         (mapconcat 'identity
;;                    (append '("\\rg") ; used unaliased version of `rg': \rg
;;                            modi/rg-arguments
;;                            '("--null" ; output null separated results,
;;                              "--files")) ; get file names matching the regex '' (all files)
;;                    " "))

;;       (advice-add 'projectile-get-ext-command :override #'modi/advice-projectile-use-rg)))

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

;; --------------------------------------------------------------------------------
;; Follwong packages are needded additional program
;; - rg (linux program)
;; - Iosevka font
;; --------------------------------------------------------------------------------
;; ----------------------------------------
;; Directory searcher
;; ----------------------------------------
(use-package fd-dired
  :ensure t
  :init
  (let ((pkg-name "fd-dired"))
	 (ignore-errors
		(package-generate-autoloads pkg-name
											 (expand-file-name (concat "packages/" pkg-name)
																	 user-emacs-directory)))
	 (load (concat pkg-name "-autoloads.el")))
  )

;; ----------------------------------------
;; Text searcher
;; Speed: rg(Ripgrep) > ag(Silver Searcher)
;; ----------------------------------------
;; (use-package ag
;;	:ensure t)
(use-package rg
  :ensure t)

;; ----------------------------------------
;; Default fonts
;; ----------------------------------------
(add-to-list 'default-frame-alist
				 '(font . "iosevka-10.5"))

;; ----------------------------------------
;; Dumb-jump
;; - Jump to definition
;; - Dumb Jump uses The Silver Searcher ag, ripgrep rg, or grep to find potential definitions of a function or variable under point.
;; - GLobal ingnore file of rg is located at ~/.rgignore
;; ----------------------------------------
(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read)
  (setq dumb-jump-prefer-searcher 'rg)
  ;; to set additional command line arguments when using git-grep for searching (defaults to "").
  (setq dumb-jump-git-grep-search-args "")
  ;; to set additional command line arguments when using rg for searching (defaults to "--pcre2").
  (setq dumb-jump-rg-search-args "-g '!*.{vc,tcl,db,upf,xml,sdc,log,json,log,db,daidir}' -g '!{Xilinx_netlist,README,vc_list_flat}'")
  ;; (setq dumb-jump-rg-search-args "")
  )











;; --------------------------------------------------
;; ----------------------------------------
;; Verilog-mode verilog-library-file usage
;; - verilog-auto-inst, verilog-goto-defun reference path settings
;; ----------------------------------------
;; // Local Variables:
;; // verilog-library-flags:("-f /data/33_arm_nic-400/all_folder_list.txt")
;; // End:

;; File [all_folder_list.txt]
;; -y /data/33_arm_nic-400/nic400_1/
;; -y /data/33_arm_nic-400/nic400_1/amib_apb_group0/

;; /*AUTOWIRE*/
;; /*AUTOREGINPUT*/
;; /*AUTOINSTPARAM*/
;; /*AUTOINST*/

;; --------------------------------------------------
;; ----------------------------------------
;; Emacs syntax examples
;; ----------------------------------------
;; (use-package consult
;; :bind ("M-s" . avy-goto-char))
;; Above syntax of use-package is the same with following:
;; (global-set-key (kbd "C-:") 'avy-goto-char)


;; ----------------------------------------
;; How can I reload .emacs after changing it?
;; ----------------------------------------
;; C-x C-e ;; current line
;; M-x eval-region ;; region
;; M-x eval-buffer ;; whole buffer
;; M-x load-file ~/.emacs.d/init.el


;; --------------------------------------------------
;; ----------------------------------------
;; Linux tips
;; ----------------------------------------
;; 1. How to force change linux password even if similar as previous
;; - sudo passwd <myusername>
;; 2. Automatically mount "sshfs"
;; # Examples
;; # URL: https://www.tuwlab.com/10463
;; # URL: https://askubuntu.com/questions/43363/how-to-auto-mount-using-sshfs
;; yhchoi@192.168.4.210:/ /data/mnt_yhchoi_zc0 fuse.sshfs noauto,x-systemd.automount,_netdev,IdentityFile=/home/yhc/.ssh/id_rsa,allow_other,reconnect 0 0
;; yhchoi@192.168.4.211:/ /data/mnt_yhchoi_zc1 fuse.sshfs noauto,x-systemd.automount,_netdev,IdentityFile=/home/yhc/.ssh/id_rsa,allow_other,reconnect 0 0
;; leetj@192.168.4.210:/ /data/mnt_leetj_zc0 fuse.sshfs noauto,x-systemd.automount,_netdev,IdentityFile=/home/yhc/.ssh/id_rsa,allow_other,reconnect 0 0
;; leetj@192.168.4.211:/ /data/mnt_leetj_zc1 fuse.sshfs noauto,x-systemd.automount,_netdev,IdentityFile=/home/yhc/.ssh/id_rsa,allow_other,reconnect 0 0
;; 3. Automatically ssh login (ssh key metohd)
;; # URL: https://iot-lab.tistory.com/108
;; # 1. Make SSH key (User computer)
;; # - ssh-keygen -t rsa
;; # 2. Register "~/.ssh/id_ras.pub" file to a remote computer path "~/.ssh/authorized_keys"
;; # - Example
;; # - PATH: /data/mnt_leetj_zc1/home/leetj/.ssh/authorized_keys
;; # ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEApnBOF7M/BxTYR7HZoTtukumh3MblY9CxYQbykqWf1cnjaNHsx3AQha1n9ME5HO2HfXIoTRk3HPA0roFMNEer94BxegUr204OSuH+WvHpL8ejz/7pO22k7tNBJML/VSvIilEso4sbZQI9inmf6h53WLiSOOQA6pndNcW2IGnnWmsPtGJ2Fa2TTcPy5sp0J1j75gaC2WX4KqZPXKCH9+mttqxtZ/7n0DrI8+2ZSxAccoI9s4M9QmAO9AaGZNQlzho18jBnzyhRy58pff59OcaMDDiZW2q91qCP+Bb6VdtqqkUkrSg0OGbPnrJmzF9/HxxIZd7Vo/PKQw4w3ttz62vHrQ== leetj@localhost.localdomain

;; # ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtwSrRMKwd2kpos1e7SkfnvcBSUHsHjF9MS8wQmd23oaZVDJa7cb7Bjf2hC0KKmMmVXv5fWiuH1WSTG/mETOGKZOjs9c02r9iT3roITTzXPMpc2U7qc7XVUQZCi02rU7xoD3b+uyeomnyLOP3iSJNNMT2CL4VolDmUk0eEdf6wUrbpgPoTdQHe83SFpZV2HYif+A6wMN7VlDyFjb4QaNgaEtqCPWMQZBS5fqzwXWXNu7zH4IXbApy7PzbZ9B+59LpGXJqlyI0FW0OTI98k3cJUHwD1wvIgUC5DPkov+UrXm8myF5JHactx5oJphHa4mkNceXCs+UYq9P+YTNzAAw+D yhc(RSA-key)

;; 4. Manually mount "sshfs"
;; # Examples
;; # URL: https://wikidocs.net/167242
;; sudo sshfs -o allow_other leetj@192.168.4.211 /

;; 5. ssh on emacs
;; #Examples
;; /ssh:armasic@192.100.1.211:/path/to/file
