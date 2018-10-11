
(cl:in-package :asdf)

(defsystem "autocar-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "controlCommand" :depends-on ("_package_controlCommand"))
    (:file "_package_controlCommand" :depends-on ("_package"))
    (:file "RecordState" :depends-on ("_package_RecordState"))
    (:file "_package_RecordState" :depends-on ("_package"))
  ))