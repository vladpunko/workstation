;;; init.el --- The main settings -*- lexical-binding:t -*-

;;; Author: Vladislav Punko

;;; Commentary:

;; Set the main settings for the preferred editor of the current operating system.

;;; Code:

(require 'package)

(setq package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")
    ("melpa-stable" . "https://stable.melpa.org/packages/")))
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
;; Bootstrap all packages into the current editor session.
(package-initialize)

;; Update the package metadata if the local cache is missing.
(unless package-archive-contents
  (package-refresh-contents))

;; Always load the newest byte code.
(setq load-prefer-newer t)

(setq gc-cons-threshold (* 100 1024 1024))

(setq inhibit-startup-screen t)  ;; disable startup screen

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

;; Set the main path to store the working server socket for all active sessions on the current machine.
(setq server-socket-dir (expand-file-name "server-socket" user-emacs-directory))

;; Suppress attempts to generate noise in the current interactive session.
(setq ring-bell-function 'ignore)

(setq-default indent-tabs-mode nil)  ;; don't use tabs to indent
(setq-default tab-width 4)

(delete-selection-mode t)  ;; delete the selection with a keypress

(fset 'yes-or-no-p 'y-or-n-p)

;; Set a new text restriction.
(fringe-mode '(0 . 0))

(setq use-dialog-box nil)

(setq require-final-newline t)  ;; create a new line at the end of the file

(column-number-mode t)
(line-number-mode t)
(size-indication-mode t)

;; Prevent all editor sessions from creating backup files.
(setq auto-save-default nil)
(setq backup-inhibited t)
(setq make-backup-files nil)

(unless (or (package-installed-p 'bind-key)
            (package-installed-p 'diminish)
            (package-installed-p 'use-package))
  (package-install 'bind-key)
  (package-install 'diminish)
  (package-install 'use-package))

(eval-when-compile
  (require 'bind-key)
  (require 'diminish)
  (require 'use-package))

(use-package autorevert
  :diminish auto-revert-mode
  :init
  (global-auto-revert-mode t))

(use-package frame
  :init
  (blink-cursor-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (tooltip-mode -1))

(use-package scroll-bar
  :config
  (setq scroll-conservatively 10000
        scroll-preserve-screen-position 'always
        scroll-step 1))

(use-package hl-line
  :init
  (global-hl-line-mode t))

(use-package elec-pair
  :init
  (electric-pair-mode t))

(use-package paren
  :config
  (setq show-paren-delay 0
        show-paren-style 'expression)
  :init
  (show-paren-mode t))

(use-package eldoc
  :diminish eldoc-mode
  :init
  (global-eldoc-mode -1))

(use-package subword
  :diminish subword-mode
  :init
  (global-subword-mode t))

(use-package tramp
  :config
  (setq tramp-default-method "ssh"))

(use-package font-lock
  :config
  (setq font-lock-maximum-decoration t)
  :init
  (global-font-lock-mode t))

(use-package python
  :config
  (setq python-environment-directory "~/.virtualenvs"))

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

(use-package org
  :config
  (setq org-agenda-files (list "~/todo.org")))

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward))

(use-package dired
  :config
  (put 'dired-find-alternate-file 'disabled nil)

  (setq dired-dwim-target t
        dired-recursive-copies 'always
        dired-recursive-deletes 'always)

  (require 'dired-x))

(use-package hl-todo
  :ensure t
  :init
  (global-hl-todo-mode t))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind (("C-c r" . undo-tree-redo)
         ("C-c u" . undo-tree-undo)
         ("C-x u" . undo-tree-visualize))
  :init
  (global-undo-tree-mode t))

(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :init
  (global-git-gutter-mode t))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package ws-butler
  :ensure t
  :diminish ws-butler-mode
  :hook ((prog-mode . ws-butler-mode)
         (text-mode . ws-butler-mode)))

(use-package whitespace
  :ensure t
  :diminish (whitespace-mode global-whitespace-mode)
  :config
  (setq whitespace-style '(face trailing tabs tab-mark)
        ;; Set a new size restriction.
        whitespace-line-column 100)
  :init
  (global-whitespace-mode t))

(use-package monokai-theme
  :ensure t
  :init
  (load-theme 'monokai t))

(use-package buffer-move
  :ensure t
  :bind (("C-c <down>" . buf-move-down)
         ("C-c <left>" . buf-move-left)
         ("C-c <right>" . buf-move-right)
         ("C-c <up>" . buf-move-up))
  :config
  (setq buffer-move-behavior 'move))

(use-package flycheck
  :ensure t
  :bind ("C-c e" . flycheck-list-errors)
  :init
  (global-flycheck-mode t))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(use-package smex
  :ensure t
  :config
  (setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory)
        smex-history-length 10))

(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (setq projectile-completion-system 'ivy)
  :init
  (projectile-mode t))

(use-package counsel-projectile
  :ensure t
  :init
  (counsel-projectile-mode t))

(use-package org-bullets
  :ensure t
  :hook (org-mode . (lambda () (org-bullets-mode t))))

(use-package markdown-mode
  :ensure t
  :commands markdown-mode)

(use-package yaml-mode
  :ensure t
  :commands yaml-mode)

(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode t))

(use-package sh-script
  :config
  (setq-default sh-basic-offset 2))

(use-package auto-virtualenv
  :ensure t
  :hook (python-mode . auto-virtualenv-set-virtualenv))

(use-package pip-requirements
  :ensure t
  :commands pip-requirements-mode)

(use-package cython-mode
  :ensure t
  :commands cython-mode)

(use-package exec-path-from-shell
  :ensure t
  :after (:any python)
  :config
  (setq exec-path-from-shell-check-startup-files nil)
  :init
  (exec-path-from-shell-initialize))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init
  (which-key-mode t))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (setq ivy-count-format ""
        ivy-initial-inputs-alist nil  ;; clean all initial inputs
        ivy-use-virtual-buffers t)
  :init
  (ivy-mode t))

(use-package counsel
  :ensure t
  :diminish counsel-mode
  :after (:any ivy)
  :init
  (counsel-mode t))

(global-set-key (kbd "C-c k") 'kill-this-buffer)

(global-set-key (kbd "M-[") 'previous-error)
(global-set-key (kbd "M-]") 'next-error)

(global-set-key (kbd "C-c t") 'beginning-of-buffer)
(global-set-key (kbd "C-c b") 'end-of-buffer)

;; Set the key combinations to change active panes.
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'meta))

;;; init.el ends here
