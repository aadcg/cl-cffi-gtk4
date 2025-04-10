(in-package :gtk-test)

(def-suite gtk-box-layout :in gtk-layout-managers)
(in-suite gtk-box-layout)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkBoxLayout

(test gtk-box-layout-class
  ;; Check type
  (is (g:type-is-object "GtkBoxLayout"))
  ;; Check registered name
  (is (eq 'gtk:box-layout
          (glib:symbol-for-gtype "GtkBoxLayout")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkBoxLayout")
          (g:gtype (cffi:foreign-funcall "gtk_box_layout_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GtkLayoutManager")
          (g:type-parent "GtkBoxLayout")))
  ;; Check children
  (is (equal '()
             (glib-test:list-children "GtkBoxLayout")))
  ;; Check interfaces
  (is (equal '("GtkOrientable")
             (glib-test:list-interfaces "GtkBoxLayout")))
  ;; Check properties
  (is (equal '("baseline-child" "baseline-position" "homogeneous" "orientation"
               "spacing")
             (glib-test:list-properties "GtkBoxLayout")))
  ;; Check signals
  (is (equal '()
             (glib-test:list-signals "GtkBoxLayout")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-GOBJECT "GtkBoxLayout" GTK:BOX-LAYOUT
                      (:SUPERCLASS GTK:LAYOUT-MANAGER
                       :EXPORT T
                       :INTERFACES ("GtkOrientable")
                       :TYPE-INITIALIZER "gtk_box_layout_get_type")
                      ((BASELINE-CHILD BOX-LAYOUT-BASELINE-CHILD
                        "baseline-child" "gint" T T)
                       (BASELINE-POSITION BOX-LAYOUT-BASELINE-POSITION
                        "baseline-position" "GtkBaselinePosition" T T)
                       (HOMOGENEOUS BOX-LAYOUT-HOMOGENEOUS
                        "homogeneous" "gboolean" T T)
                       (SPACING BOX-LAYOUT-SPACING "spacing" "gint" T T)))
             (gobject:get-gtype-definition "GtkBoxLayout"))))

;;; --- Properties -------------------------------------------------------------

(test gtk-box-layout-properties
  (let ((manager (gtk:box-layout-new :horizontal)))
    (is (= -1 (gtk:box-layout-baseline-child manager)))
    (is (eq :center (gtk:box-layout-baseline-position manager)))
    (is-false (gtk:box-layout-homogeneous manager))
    (is (= 0 (gtk:box-layout-spacing manager)))))

;;; --- Functions --------------------------------------------------------------

;;;     gtk_box_layout_new

(test gtk-box-layout-new
  (is (typep (gtk:box-layout-new :horizontal) 'gtk:box-layout)))

;;; 2024-9-19
