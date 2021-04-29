;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ayaan Retiwala"
      user-mail-address "ayaan.180410107098@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-Iosvkem)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/dotfiles/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type -t)

;; Toggle Fullscreen on open
(if (eq initial-window-system 'x)
    (toggle-frame-maximized)
  (toggle-frame-fullscreen))

(load! "~/.emacs.d/modules/private/ayaan/init.el")

(use-package! ttl-mode
  :hook (dart-mode . lsp))

(setq inferior-lisp-program "/usr/local/bin/clisp")

(setq geiser-chez-binary "chez")
(setq geiser-active-implementations '(chez))
(setq avy-all-windows t)
(setq evil-snipe-scope 'buffer)
(add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)

(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
                    vc-ignore-dir-regexp
                    tramp-file-name-regexp))
(setq tramp-verbose 1)

(map! :leader
      (
       (:prefix ("m" . "Local Leader")
        :desc "Go to Mark" "'" #'evil-goto-mark
        )))

(define-key evil-motion-state-map "'" 'evil-goto-mark)

;; TS specific config
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
(setq tide-tsserver-executable "/Users/ayaan/.config/yarn/global/node_modules/.bin/tsserver")
(setq tide-node-executable "/Users/ayaan/.nvm/versions/node/v14.9.0/bin/node")
(setq tide-tscompiler-executable "/Users/ayaan/.config/yarn/global/node_modules/.bin/tsc")

;; Word Wrap
;; (global-visual-line-mode t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
