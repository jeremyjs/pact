(interface i (defun f:bool ()))
(interface j (defun g:bool ()))

(module k g2 (defcap g2 () true)
  (defun f:bool () true)
  )

(module m g (defcap g () true)
  (implements i)
  (defschema s mr:module{i})
  (deftable t:{s})
  (defun f:bool () (k.f))
  ;; (defun f:bool () (let ((mr:module{i} (at 'mr (read t "")))) (mr::f)))
  )
(create-table t)
(insert t "" { 'mr: m })
(m.f)
  