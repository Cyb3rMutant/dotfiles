
;; If you are distributing this theme, please replace this comment
;; with the appropriate license attributing the original VS Code
;; theme author.

(deftheme beardedtheme-arc "A nice  theme.")


(let (
(color0 "#1c2433")
(color1 "#d0d7e4")
(color2 "#08101f")
(color3 "#8196b5")
(color4 "#EACD61")
(color5 "#000006")
(color6 "#030b1a")
(color7 "#bcc3d0")
(color8 "#00000b")
(color9 "#a8afbc")
(color10 "#4a5e84")
(color11 "#000000")
(color12 "#69C3FF")
(color13 "#E35535")
(color14 "#3CEC85")
(color15 "#22ECDB")
(color16 "#FF738A")
(color17 "#404a5f")
(color18 "#0d1524")
(color19 "#c1c8d5")
(color20 "#111928")
(color21 "#c5ccd9"))


(custom-theme-set-faces
'beardedtheme-arc


;; BASIC FACES
`(default ((t (:background ,color0 :foreground ,color1 ))))
`(hl-line ((t (:background ,color2 ))))
`(cursor ((t (:background ,color3 :foreground ,color4 ))))
`(region ((t (:background ,color5 ))))
`(secondary-selection ((t (:background ,color6 ))))
`(fringe ((t (:background ,color0 ))))
`(mode-line-inactive ((t (:background ,color2 :foreground ,color7 ))))
`(mode-line ((t (:background ,color8 :foreground ,color9 ))))
`(minibuffer-prompt ((t (:background ,color0 :foreground ,color10 ))))
`(vertical-border ((t (:foreground ,color11 ))))


;; FONT LOCK FACES
`(font-lock-builtin-face ((t (:foreground ,color12 ))))
`(font-lock-comment-face ((t (:fontStyle :italic t ))))
`(font-lock-constant-face ((t (:foreground ,color13 ))))
`(font-lock-function-name-face ((t (:foreground ,color12 ))))
`(font-lock-string-face ((t (:foreground ,color14 ))))
`(font-lock-type-face ((t (:foreground ,color15 ))))
`(font-lock-variable-name-face ((t (:foreground ,color16 ))))


;; linum-mode
`(linum ((t (:foreground ,color17 ))))
`(linum-relative-current-face ((t (:foreground ,color17 ))))


;; display-line-number-mode
`(line-number ((t (:foreground ,color17 ))))
`(line-number-current-line ((t (:foreground ,color17 ))))


;; THIRD PARTY PACKAGE FACES


;; doom-modeline-mode
`(doom-modeline-bar ((t (:background ,color8 :foreground ,color9 ))))
`(doom-modeline-inactive-bar ((t (:background ,color2 :foreground ,color7 ))))


;; web-mode
`(web-mode-string-face ((t (:foreground ,color14 ))))
`(web-mode-html-attr-name-face ((t (:foreground ,color15 ))))


;; company-mode
`(company-tooltip ((t (:background ,color18 :foreground ,color19 ))))


;; org-mode
`(org-block ((t (:background ,color20 :foreground ,color21 ))))))


(custom-theme-set-variables
  'beardedtheme-arc
  '(linum-format " %3i "))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


;;;###autoload
(defun beardedtheme-arc-theme()
  "Apply the beardedtheme-arc-theme."
  (interactive)
  (load-theme 'beardedtheme-arc t))


(provide-theme 'beardedtheme-arc)


;; Local Variables:
;; no-byte-compile: t
;; End:


;; Generated using https://github.com/nice/themeforge
;; Feel free to remove the above URL and this line.
