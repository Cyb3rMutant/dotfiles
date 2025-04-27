;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Comic Code Ligatures" :size 15)
      doom-variable-pitch-font (font-spec :family "Comic Code Ligatures" :size 15)
      doom-big-font (font-spec :family "Comic Code Ligatures")
      doom-symbol-font (font-spec :family "Comic Code Ligatures" :size 15))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-bluloco-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq treemacs-width 25)
(setq centaur-tabs-style "wave")
(setq centaur-tabs-height 10)
;; Tab to switch to the next tab
(map! :n "<tab>" #'centaur-tabs-forward)
;; Shift + Tab to switch to the previous tab
(map! :n "<backtab>" #'centaur-tabs-backward)
;; Leader + x to close the current tab
(map! :leader
      :desc "Close current tab" "x" #'centaur-tabs--kill-this-buffer-dont-ask)



;; Move between windows with Ctrl + h/j/k/l
(map! :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right)

;; Resize windows with Ctrl + arrow keys
(map! :n "C-<left>"  #'evil-window-decrease-width
      :n "C-<right>" #'evil-window-increase-width
      :n "C-<down>"  #'evil-window-decrease-height
      :n "C-<up>"    #'evil-window-increase-height)

;; Move in text with Ctrl + h/j/k/l in insert mode
(map! :i "C-h" #'evil-backward-char
      :i "C-j" #'evil-next-line
      :i "C-k" #'evil-previous-line
      :i "C-l" #'evil-forward-char)

;; Toggle vterm horizontally with Alt + h
(map! :n "M-h" #'+vterm/toggle)

;; Toggle treemacs with leader + e
(map! :leader
      :desc "Toggle Treemacs" "e" #'treemacs)
;; Treemacs mode keybindings
(after! treemacs
  (map! :map treemacs-mode-map
        "a" #'treemacs-create-file
        "d" #'treemacs-delete
        "c" #'treemacs-copy
        "x" #'treemacs-cut
        "p" #'treemacs-paste
        "y" #'treemacs-copy-filepath-at-point
        "r" #'treemacs-rename))

;; Ctrl + / to comment/uncomment the selected region or current line
(map! :nv "C-/" #'evilnc-comment-or-uncomment-lines)

;; Enable format on save for all buffers
(setq +format-on-save-enabled-modes
      '(not sql-mode  ;; Disable in SQL mode as an example
        tex-mode  ;; Disable in TeX modes as an example
        latex-mode))                                

;; Enable format on save globally
(add-hook 'before-save-hook #'+format/buffer)

;; Enable company-mode for autocompletion
(after! company
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 1))

;; Enable yasnippet for snippets
(after! yasnippet
  (yas-global-mode 1))

(after! lsp-mode
  (setq lsp-pylsp-server-command "pylsp"))  ;; For pyls
;;(setq lsp-pyright-multi-root nil)  ;; Uncomment for Pyright

;; Enable flycheck for Python
(add-hook 'python-mode-hook 'flycheck-mode)

(use-package auto-virtualenv
  :ensure t
  :init
  (use-package pyvenv
    :ensure t)
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv)  ;; If using projectile
  )

;; Web-mode for HTML, CSS, and JS files
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))

;; Enable Emmet mode for HTML and CSS
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

;; Company mode auto-completion
(after! company
  (add-hook 'web-mode-hook 'company-mode)
  (add-hook 'css-mode-hook 'company-mode)
  (add-to-list 'company-backends 'company-web-html))


;; Turn on horizontal scrolling with mouse wheel
(defun my/scroll-right() (interactive)
       (save-selected-window
         (select-window (window-at (cadr (mouse-position))
                                   (cddr (mouse-position))
                                   (car (mouse-position))))
         (scroll-right 2)))
(defun my/scroll-left() (interactive)
       (save-selected-window
         (select-window (window-at (cadr (mouse-position))
                                   (cddr (mouse-position))
                                   (car (mouse-position))))
         (scroll-left 2)))

(defun my/scroll-left() (interactive) (scroll-left 2))
(global-set-key (kbd "<left-margin> <triple-wheel-left>")  'my/scroll-left)
(global-set-key (kbd "<left-margin> <triple-wheel-right>")  'my/scroll-right)

(global-set-key (kbd "<right-margin> <triple-wheel-right>") 'my/scroll-left)
(global-set-key (kbd "<right-margin> <triple-wheel-left>") 'my/scroll-right)
