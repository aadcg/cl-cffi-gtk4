(in-package :gtk-test)

(def-suite gtk-native-dialog :in gtk-suite)
(in-suite gtk-native-dialog)

(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; FIXME: After loading GTK the symbol for "GtkNativeDialog" is not
  ;; registered. Why?
  (g:type-ensure "GtkNativeDialog")
  (setf (glib:symbol-for-gtype "GtkNativeDialog") 'gtk:native-dialog))

;;; --- Types and Values -------------------------------------------------------

;;;     GtkNativeDialog

(test gtk-native-dialog-class
  ;; Check type
  (is (g:type-is-object "GtkNativeDialog"))
  ;; Check registered name
  ;; FIXME: We have no symbol for GtkNativeDialog. Why!?
  (is (eq 'gtk:native-dialog
          (glib:symbol-for-gtype "GtkNativeDialog")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkNativeDialog")
          (g:gtype (cffi:foreign-funcall "gtk_native_dialog_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GObject")
          (g:type-parent "GtkNativeDialog")))
  ;; Check children
  (is (equal '("GtkFileChooserNative")
             (glib-test:list-children "GtkNativeDialog")))
  ;; Check interfaces
  (is (equal '()
             (glib-test:list-interfaces "GtkNativeDialog")))
  ;; Check properties
  (is (equal '("modal" "title" "transient-for" "visible")
             (glib-test:list-properties "GtkNativeDialog")))
  ;; Check signals
  (is (equal '("response")
             (glib-test:list-signals "GtkNativeDialog")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-GOBJECT "GtkNativeDialog" GTK:NATIVE-DIALOG
                       (:SUPERCLASS G:OBJECT
                        :EXPORT T
                        :INTERFACES NIL
                        :TYPE-INITIALIZER "gtk_native_dialog_get_type")
                       ((MODAL NATIVE-DIALOG-MODAL "modal" "gboolean" T T)
                        (TITLE NATIVE-DIALOG-TITLE "title" "gchararray" T T)
                        (TRANSIENT-FOR NATIVE-DIALOG-TRANSIENT-FOR
                         "transient-for" "GtkWindow" T T)
                        (VISIBLE NATIVE-DIALOG-VISIBLE
                         "visible" "gboolean" T T)))
             (gobject:get-gtype-definition "GtkNativeDialog"))))

;;; --- Properties -------------------------------------------------------------

;;;     modal
;;;     title
;;;     transient-for
;;;     visible

;;; --- Signals ----------------------------------------------------------------

;;;     response

;;; --- Functions --------------------------------------------------------------

;;;     gtk_native_dialog_show
;;;     gtk_native_dialog_hide
;;;     gtk_native_dialog_destroy

;;; 2024-9-20
