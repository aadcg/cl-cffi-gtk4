(defpackage :gtk-test
  (:use :fiveam :iterate :common-lisp)
  (:export #:run!
           #:approx-equal)
  (:import-from :gtk-init *gtk-warn-deprecated*)
  (:import-from :glib-test #:approx-equal)
  (:import-from :gobject)
  (:import-from :gio)
  (:import-from :gtk)
  (:import-from :gdk))

(in-package :gtk-test)

(defvar *first-run-gtk-test* t)

(def-suite gtk-test)
(def-suite gsk-suite :in gtk-test)
(def-suite gdk-suite :in gtk-test)
(def-suite gtk-suite :in gtk-test)

(defun run-repeat (tests &key (count 1) (on-error nil) (linecount 50))
  (let ((fiveam:*on-error* on-error)
        (count (if (> count 0) (1- count) 0)))
    (format t "~&Run tests ~a times:~%" (1+ count))
    (format t "~6d " linecount)
    (let ((*test-dribble* nil))
      (dotimes (i count)
        (if (= 0 (mod (1+ i) linecount))
            (progn
              (format t ".~%")
              (format t "~6d " (+ 1 i linecount)))
            (format t "."))
        (fiveam:run tests)))
    (format t ".~%")
    ;; Explain the last run
    (fiveam:explain! (fiveam:run tests))))

;; push the hostname on *features*
(pushnew (intern (string-upcase (machine-instance)) :keyword) *features*)

(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; Set the current package for the testsuite
  (setf (glib-sys:get-current-package) "cl-cffi-gtk4")
  ;; Ensure directory for the output of test results
  (ensure-directories-exist
      (asdf:system-relative-pathname :cl-cffi-gtk4 "test/out/"))
  ;; Set the package and the prefix for this testsuite
  (setf gobject::*lisp-name-package* nil)
  (setf gobject::*strip-prefix* "")
  ;; We set a PRGNAME to avoid side effects when running the tests a second time
  (setf (g:prgname) "gtk-test")
  ;; Check and possibly create the resources
  (glib-sys:check-and-create-resources "test/rtest-gtk4.xml"
                                       :package "cl-cffi-gtk4"
                                       :sourcedir "test/resource/"
                                       :verbose t))

(defvar *some-text*
        (format nil "One of the important things to remember about text in ~
                     GTK is that it is in the UTF-8 encoding. This means that ~
                     one character can be encoded as multiple bytes. Character ~
                     counts are usually referred to as offsets, while byte ~
                     counts are called indexes. If you confuse these two, ~
                     things will work fine with ASCII, but as soon as your ~
                     buffer contains multibyte characters, bad things will ~
                     happen."))

(defvar *some-lines*
        (format nil
                "One of the important things to remember about text in
GTK is that it is in the UTF-8 encoding. This means that
one character can be encoded as multiple bytes. Character
counts are usually referred to as offsets, while byte
counts are called indexes. If you confuse these two,
things will work fine with ASCII, but as soon as your
buffer contains multibyte characters, bad things will
happen."))

(defvar *lorem-ipsum-short*
        (format nil "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ~
Nunc scelerisque aliquam dui id ullamcorper. Sed placerat felis sed aliquam ~
sodales. Cras et ultricies nulla. Nullam ipsum ante, gravida vel malesuada ac, ~
sollicitudin eu diam. Morbi pellentesque elit et odio hendrerit dignissim. ~
Maecenas sagittis auctor leo a dictum. Sed at auctor."))

(defvar *lorem-ipsum-long*
        (format nil "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ~
Morbi vitae condimentum ligula, vitae bibendum urna. Praesent vitae nisi ~
hendrerit lorem malesuada interdum vitae vitae massa. Integer elementum justo ~
nibh, non euismod odio tincidunt et. Praesent lobortis molestie mi quis ~
rhoncus. Interdum et malesuada fames ac ante ipsum primis in faucibus. ~
Curabitur luctus, tortor vel ornare aliquet, erat nulla tempus orci, ac ~
pulvinar velit turpis ac nulla. Orci varius natoque penatibus et magnis dis ~
parturient montes, nascetur ridiculus mus. Nam efficitur scelerisque erat. ~
Nunc nec viverra magna, eget consequat dui. Vestibulum vitae porttitor quam. ~
Fusce leo enim, molestie non sollicitudin sollicitudin, porta vel libero.

In hac habitasse platea dictumst. In ultricies nulla vel massa varius, eu ~
tempor metus condimentum. Duis nisl tortor, vestibulum ut auctor eu, tristique ~
lobortis libero. Nam congue volutpat leo a hendrerit. In ut purus ac risus ~
aliquet commodo in sit amet ante. Aenean sed tempus dolor. Aliquam a sagittis ~
metus. Donec eget urna eu justo fringilla tincidunt id et diam. Maecenas ~
ultrices pellentesque augue vitae rhoncus. Integer aliquet venenatis elit sed ~
lacinia. Praesent dui libero, aliquet imperdiet blandit ut, sollicitudin id ~
ipsum. Pellentesque venenatis vitae sem non fermentum. Ut orci libero, ~
interdum a pharetra at, mollis a mi.

Integer tempus cursus fringilla. Donec ornare fermentum nulla sed aliquet. ~
Mauris in velit metus. Quisque in diam id diam bibendum eleifend vitae id ~
tortor. Nulla condimentum ultricies ultrices. Nunc tincidunt, justo at blandit ~
condimentum, leo purus mollis orci, sed mollis dui metus eget eros. Mauris ~
quam nibh, laoreet eget arcu in, accumsan lacinia purus. Morbi aliquet nibh id ~
sem venenatis, vitae ultricies arcu laoreet."))

;;; ----------------------------------------------------------------------------

;; Destroy toplevel windows
(defun window-destroy-toplevels ()
  (dolist (window (gtk:window-list-toplevels))
    (gtk:window-destroy window))
  (gtk:window-list-toplevels))

(export 'window-destroy-toplevels)

;; Create and fill a GTK:STRING-LIST for use as a model
(defun create-string-list-for-package (&optional (package "GTK"))
  (let ((store (gtk:string-list-new '())))
    (do-external-symbols (symbol (find-package package))
      (gtk:string-list-append store (string-downcase (format nil "~a" symbol))))
    store))

;; Create and fill a GIO:LIST-STORE for use as a model
(defun create-g-list-store-for-package (&optional (package "GTK"))
  (let ((store (gtk:list-store-new "GtkStringObject")))
    (do-external-symbols (symbol (find-package package))
      (let* ((str (string-downcase (format nil "~a" symbol)))
             (item (gtk:string-object-new str)))
      (g:list-store-append store item)))
    store))

;; Create and fill a GTK:LIST-STORE for use as a model
(defun create-list-store-for-package (&optional (package "GTK"))
  (let ((store (make-instance 'gtk:list-store
                                  :column-types
                                  '("gint" "gchararray" "gboolean")))
        (counter 0))
    ;; Fill in external symbols of the given package
    (do-external-symbols (symbol (find-package package))
      ;; Add a new row to the model
      (gtk:list-store-set store
                          (gtk:list-store-append store)
                          (incf counter)
                          (symbol-name symbol)
                          nil))
    ;; Return the new list store
    store))

;;; 2024-10-2
