;文件保存默认编码格式
(prefer-coding-system 'chinese-iso-8bit)
;(prefer-coding-system 'utf-8)

;不产生备份文件
(setq make-backup-files nil)

;不产生临时文件
;(setq-default make-backup-files nil)

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

;自动显示显示行号
;(global-linum-mode t)
;(setq linum-format "%4d |")

; tab 改为插入空格
(setq-default indent-tabs-mode nil)

; c c++ 缩进4个空格
(setq c-basic-offset 4)
(setq tab-width 4)

;没有这个 { } 就会瞎搞
;(setq c-default-style "linux")
;(setq default-tab-width 4)

;高亮光标所在行
;(global-hl-line-mode 1)

; set gdb multi-windows when open
(setq gdb-many-windows t)

; customize the gdb multi-windows
(defadvice gdb-setup-windows (after my-setup-gdb-windows activate)
 "my gdb UI"
 (gdb-get-buffer-create 'gdb-stack-buffer)
 (set-window-dedicated-p (selected-window) nil)
 (switch-to-buffer gud-comint-buffer)
 (delete-other-windows)
 (let ((win0 (selected-window))
       (win1 (split-window nil nil 'left))  ;; code and output
       (win2 (split-window-below (/ (* (window-height) 3) 4)))  ;; stack
      )
  (select-window win2)
  (gdb-set-window-buffer (gdb-stack-buffer-name))
  (select-window win1)
  (set-window-buffer
    win1
    (if gud-last-last-frame
      (gud-find-file (car gud-last-last-frame))
      (if gdb-main-file
        (gud-find-file gdb-main-file)
        ;; Put buffer list in window if we
        ;; can't find a source file.
        (list-buffers-noselect))))
  (setq gdb-source-window (selected-window))
  (let ((win3 (split-window nil (/ (* (window-height) 3) 4))))  ;; io
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io) nil win3))
  (select-window win0)
 ))
