(in-package :gtk-test)

(def-suite gtk-string-list :in gtk-list-model-support)
(in-suite gtk-string-list)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkStringObject

(test gtk-string-object-class
  ;; Check type
  (is (g:type-is-object "GtkStringObject"))
  ;; Check registered name
  (is (eq 'gtk:string-object
          (glib:symbol-for-gtype "GtkStringObject")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkStringObject")
          (g:gtype (cffi:foreign-funcall "gtk_string_object_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GObject")
          (g:type-parent "GtkStringObject")))
  ;; Check children
  (is (equal '()
             (glib-test:list-children "GtkStringObject")))
  ;; Check interfaces
  (is (equal '()
             (glib-test:list-interfaces "GtkStringObject")))
  ;; Check properties
  (is (equal '("string")
             (glib-test:list-properties "GtkStringObject")))
  ;; Check signals
  (is (equal '()
             (glib-test:list-signals "GtkStringObject")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-GOBJECT "GtkStringObject" GTK:STRING-OBJECT
                      (:SUPERCLASS G:OBJECT
                       :EXPORT T
                       :INTERFACES NIL
                       :TYPE-INITIALIZER "gtk_string_object_get_type")
                      ((STRING STRING-OBJECT-STRING "string" "gchararray" T NIL)))
             (gobject:get-gtype-definition "GtkStringObject"))))

;;; --- Properties -------------------------------------------------------------

;;;     string

(test gtk-string-object-string
  (glib-test:with-check-memory (object)
    (setf object (make-instance 'gtk:string-object))
    (is-false (gtk:string-object-string object))
    (is (typep (setf object (gtk:string-object-new "abcdef"))
               'gtk:string-object))
    (is (string= "abcdef" (gtk:string-object-string object)))))

;;; --- Functions --------------------------------------------------------------

;;;     gtk_string_object_new

(test gtk-string-object-new
  (glib-test:with-check-memory (object)
    (setf object (gtk:string-object-new "string"))
    (is (typep object 'gtk:string-object))
    (is (string= "string" (gtk:string-object-string object)))
    (is (typep (setf object
                     (gtk:string-object-new (cffi:null-pointer)))
               'gtk:string-object))
    (is-false (gtk:string-object-string object))
    (is (typep (setf object
                     (gtk:string-object-new nil)) 'gtk:string-object))
    (is-false (gtk:string-object-string object))
    (is (typep (setf object
                     (gtk:string-object-new)) 'gtk:string-object))
    (is-false (gtk:string-object-string object))))

;;; --- Types and Values -------------------------------------------------------

;;;     GtkStringList

(test gtk-string-list-class
  ;; Check type
  (is (g:type-is-object "GtkStringList"))
  ;; Check registered name
  (is (eq 'gtk:string-list
          (glib:symbol-for-gtype "GtkStringList")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkStringList")
          (g:gtype (cffi:foreign-funcall "gtk_string_list_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GObject")
          (g:type-parent "GtkStringList")))
  ;; Check children
  (is (equal '()
             (glib-test:list-children "GtkStringList")))
  ;; Check interfaces
  (is (equal '("GtkBuildable" "GListModel")
             (glib-test:list-interfaces "GtkStringList")))
  ;; Check properties
  (is (equal '("item-type" "n-items" "strings")
             (glib-test:list-properties "GtkStringList")))
  ;; Check signals
  (is (equal '()
             (glib-test:list-signals "GtkStringList")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-GOBJECT "GtkStringList" GTK:STRING-LIST
                      (:SUPERCLASS G:OBJECT
                       :EXPORT T
                       :INTERFACES ("GListModel" "GtkBuildable")
                       :TYPE-INITIALIZER "gtk_string_list_get_type")
                      ((ITEM-TYPE STRING-LIST-ITEM-TYPE "item-type" "GType" T NIL)
                       (N-ITEMS STRING-LIST-N-ITEMS "n-items" "guint" T NIL)
                       (STRINGS STRING-LIST-STRINGS "strings" "GStrv" NIL NIL)))
             (gobject:get-gtype-definition "GtkStringList"))))

;;; --- Properties -------------------------------------------------------------

(test gtk-string-list-properties
  (glib-test:with-check-memory (model)
    (setf model (make-instance 'gtk:string-list))
    (is (eq (g:gtype "GObject") (gtk:string-list-item-type model)))
    (is (= 0 (gtk:string-list-n-items model)))))

;;;     strings                                            Since 4.10

;; not readable and not writable, there is no accessor exported

;;; --- Functions --------------------------------------------------------------

;;;     gtk_string_list_new
;;;     gtk_string_list_get_string

(test gtk-string-list-new.1
  (glib-test:with-check-memory (model)
    (setf model (gtk:string-list-new '()))
    (is (eq (g:gtype "GObject") (g:list-model-item-type model)))
    (is (= 0 (g:list-model-n-items model)))
    (is (typep model 'gtk:string-list))))

(test gtk-string-list-new.2
  (glib-test:with-check-memory (model)
    (setf model (gtk:string-list-new '("Factory" "Home" "Subway")))
    (is (= 1 (g:object-ref-count model)))
    (is (= 2 (g:object-ref-count (g:list-model-item model 0))))
    (is (= 2 (g:object-ref-count (g:list-model-item model 0))))

    (is (typep model 'gtk:string-list))
    (is (eq (g:gtype "GObject") (g:list-model-item-type model)))
    (is (= 3 (g:list-model-n-items model)))

    (is (string= "Factory" (gtk:string-list-string model 0)))
    (is (string= "Home" (gtk:string-list-string model 1)))
    (is (string= "Subway" (gtk:string-list-string model 2)))

    (is (string= "Factory"
                 (gtk:string-object-string (g:list-model-item model 0))))
    (is (string= "Home"
                 (gtk:string-object-string (g:list-model-item model 1))))
    (is (string= "Subway"
                 (gtk:string-object-string (g:list-model-item model 2))))
    ;; Remove references
    (is-false (gtk:string-list-remove model 2))
    (is-false (gtk:string-list-remove model 1))
    (is-false (gtk:string-list-remove model 0))))

(test gtk-string-list-new.3
  ;; Create with make instance
  (is (typep (make-instance 'gtk:string-list) 'gtk:string-list))
  (is (= 1 (g:object-ref-count (make-instance 'gtk:string-list))))
  ;; Create with object new
  (is (typep (g:object-new "GtkStringList") 'gtk:string-list))
  (is (= 1 (g:object-ref-count (g:object-new "GtkStringList")))))

;;;     gtk_string_list_append
;;;     gtk_string_list_remove

(test gtk-string-list-append/remove
  (glib-test:with-check-memory (model)
    (setf model (gtk:string-list-new '()))
    (is-false (gtk:string-list-append model "Factory"))
    (is-false (gtk:string-list-append model "Home"))
    (is-false (gtk:string-list-append model "Subway"))
    (is (= 3 (g:list-model-n-items model)))
    (is (string= "Factory" (gtk:string-list-string model 0)))
    (is (string= "Home" (gtk:string-list-string model 1)))
    (is (string= "Subway" (gtk:string-list-string model 2)))
    (is-false (gtk:string-list-remove model 0))
    (is (= 2 (g:list-model-n-items model)))
    (is (string= "Home" (gtk:string-list-string model 0)))
    (is (string= "Subway" (gtk:string-list-string model 1)))
    (is-false (gtk:string-list-remove model 0))
    (is (= 1 (g:list-model-n-items model)))
    (is (string= "Subway" (gtk:string-list-string model 0)))))

;;;     gtk_string_list_take                               not needed

;;;     gtk_string_list_splice

(test gtk-string-list-splice
  (glib-test:with-check-memory (model)
    (setf model (gtk:string-list-new '("Factory" "Home" "Subway")))
    (is (= 3 (g:list-model-n-items model)))
    (is (string= "Factory" (gtk:string-list-string model 0)))
    (is (string= "Home" (gtk:string-list-string model 1)))
    (is (string= "Subway" (gtk:string-list-string model 2)))
    (is-false (gtk:string-list-splice model 1 2
                                      '("Factory" "Home" "Subway")))
    (is (string= "Factory" (gtk:string-list-string model 0)))
    (is (string= "Factory" (gtk:string-list-string model 1)))
    (is (string= "Home" (gtk:string-list-string model 2)))
    (is (string= "Subway" (gtk:string-list-string model 3)))))

;;;     gtk_string_list_find

#+gtk-4-18
(test gtk-string-list-find
  (glib-test:with-check-memory (model)
    (setf model (gtk:string-list-new '("Factory" "Home" "Subway")))
    (is (= 0 (gtk:string-list-find model "Factory")))
    (is (= 1 (gtk:string-list-find model "Home")))
    (is (= 2 (gtk:string-list-find model "Subway")))))

;;; Example with a string list of external GTK symbols

(test gtk-string-list-gtk-symbols
  (glib-test:with-check-memory (model)
    (setf model (gtk:string-list-new '()))
    (do-external-symbols (symbol (find-package "GTK"))
      (gtk:string-list-append model (string-downcase (format nil "~a" symbol))))
    (is (g:type-is-object (g:list-model-item-type model)))
    (is (< 3000 (g:list-model-n-items model)))))

;;; 2025-3-29
