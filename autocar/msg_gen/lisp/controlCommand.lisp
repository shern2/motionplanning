; Auto-generated. Do not edit!


(cl:in-package autocar-msg)


;//! \htmlinclude controlCommand.msg.html

(cl:defclass <controlCommand> (roslisp-msg-protocol:ros-message)
  ((acc
    :reader acc
    :initarg :acc
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass controlCommand (<controlCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <controlCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'controlCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autocar-msg:<controlCommand> is deprecated: use autocar-msg:controlCommand instead.")))

(cl:ensure-generic-function 'acc-val :lambda-list '(m))
(cl:defmethod acc-val ((m <controlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autocar-msg:acc-val is deprecated.  Use autocar-msg:acc instead.")
  (acc m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <controlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autocar-msg:yaw-val is deprecated.  Use autocar-msg:yaw instead.")
  (yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <controlCommand>) ostream)
  "Serializes a message object of type '<controlCommand>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <controlCommand>) istream)
  "Deserializes a message object of type '<controlCommand>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<controlCommand>)))
  "Returns string type for a message object of type '<controlCommand>"
  "autocar/controlCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controlCommand)))
  "Returns string type for a message object of type 'controlCommand"
  "autocar/controlCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<controlCommand>)))
  "Returns md5sum for a message object of type '<controlCommand>"
  "28f23c7e5636e15985dc527e33bca955")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'controlCommand)))
  "Returns md5sum for a message object of type 'controlCommand"
  "28f23c7e5636e15985dc527e33bca955")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<controlCommand>)))
  "Returns full string definition for message of type '<controlCommand>"
  (cl:format cl:nil "float32 acc~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'controlCommand)))
  "Returns full string definition for message of type 'controlCommand"
  (cl:format cl:nil "float32 acc~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <controlCommand>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <controlCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'controlCommand
    (cl:cons ':acc (acc msg))
    (cl:cons ':yaw (yaw msg))
))
