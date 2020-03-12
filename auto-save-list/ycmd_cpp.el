;;;;================================================= < for ycmd start >
;;;; To use ycmd-mode in all supported modes
(require 'ycmd)
;(add-hook 'after-init-hook #'global-ycmd-mode)

;;;; Specify only support c/c++ mode
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'ycmd-mode)

;;;; Specify how to run the server
(set-variable 'ycmd-server-command '("/usr/bin/python3" "/opt/source/3rd/ycmd/ycmd"))

;;;; Specify a global emacs configuration
(set-variable 'ycmd-global-config "/opt/source/3rd/ycmd/ycmd/examples/.ycm_extra_conf.py")
(set-variable 'ycmd-extra-conf-whitelist '("/opt/source/work/wkc01/project/*"))

;;;; Completion framework
(require 'company-ycmd)
(company-ycmd-setup)
(add-hook 'after-init-hook #'global-company-mode)  

;;;; Enable flycheck
;(require 'flycheck-ycmd)
;(flycheck-ycmd-setup)
;(add-hook 'after-init-hook #'global-flycheck-mode)  

;;;; Set always complete immediately
(setq company-idle-delay 0)
;;;;================================================== < for ycmd end >
