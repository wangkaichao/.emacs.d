(prefer-coding-system 'chinese-iso-8bit)
;(prefer-coding-system 'utf-8)

(setq make-backup-files nil)
(put 'narrow-to-page 'disabled nil)

;(global-set-key [C-M-S-v] 'scroll-other-window-down)

(defun scroll-other-window-up ()
  "Scroll the other window one line up."
  (interactive)
  (scroll-other-window -1)
)
(defun scroll-other-window-down ()
  "Scroll the other window one line down."
  (interactive)
  (scroll-other-window 1)
)
(global-set-key [C-M-S-up] 'scroll-other-window-up)
(global-set-key [C-M-S-down] 'scroll-other-window-down)

(global-linum-mode t)
(setq linum-format "%4d |")
