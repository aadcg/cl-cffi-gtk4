(in-package :gtk-test)

(def-suite gtk-print-operation-preview :in gtk-printing)
(in-suite gtk-print-operation-preview)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkPrintOperationPreview

(test gtk-print-operation-preview-interface
  ;; Check type
  (is (g:type-is-interface "GtkPrintOperationPreview"))
  ;; Check registered name
  (is (eq 'gtk:print-operation-preview
          (glib:symbol-for-gtype "GtkPrintOperationPreview")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkPrintOperationPreview")
          (g:gtype (cffi:foreign-funcall "gtk_print_operation_preview_get_type"
                                         :size))))
  ;; Check interface prerequisites
  (is (equal '("GObject")
             (glib-test:list-interface-prerequisites "GtkPrintOperationPreview")))
  ;; Check interface properties
  (is (equal '()
             (glib-test:list-interface-properties "GtkPrintOperationPreview")))
  ;; Check interface signals
  (is (equal '("got-page-size" "ready")
             (glib-test:list-signals "GtkPrintOperationPreview")))
  ;; Check interface definition
  (is (equal '(GOBJECT:DEFINE-GINTERFACE "GtkPrintOperationPreview"
                                         GTK:PRINT-OPERATION-PREVIEW
                       (:EXPORT T
                        :TYPE-INITIALIZER
                        "gtk_print_operation_preview_get_type"))
             (gobject:get-gtype-definition "GtkPrintOperationPreview"))))

;;; --- Signals ----------------------------------------------------------------

;;;     got-page-size
;;;     ready

;;; --- Functions --------------------------------------------------------------

;;;     gtk_print_operation_preview_end_preview
;;;     gtk_print_operation_preview_is_selected
;;;     gtk_print_operation_preview_render_page

;;; 2024-9-20
