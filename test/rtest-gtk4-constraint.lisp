(in-package :gtk-test)

(def-suite gtk-constraint :in gtk-suite)
(in-suite gtk-constraint)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkConstraintAttribute                             gtk.enumerations
;;;     GtkConstraintRelation                              gtk.enumerations
;;;     GtkConstraintStrength                              gtk.enumerations

;;;     GtkConstraintTarget

(test gtk-constraint-target-interface
  ;; Check type
  (is (g:type-is-interface "GtkConstraintTarget"))
  ;; Check registered name
  (is (eq 'gtk:constraint-target
          (glib:symbol-for-gtype "GtkConstraintTarget")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkConstraintTarget")
          (g:gtype (cffi:foreign-funcall "gtk_constraint_target_get_type"
                                         :size))))
  ;; Check interface prerequisites
  (is (equal '("GObject")
             (list-interface-prerequisites "GtkConstraintTarget")))
  ;; Check interface properties
  (is (equal '()
             (list-interface-properties "GtkConstraintTarget")))
  ;; Check interface signals
  (is (equal '()
             (list-signals "GtkConstraintTarget")))
  ;; Get interface definition
  (is (equal '(GOBJECT:DEFINE-G-INTERFACE "GtkConstraintTarget"
                                          GTK-CONSTRAINT-TARGET
                            (:EXPORT T :TYPE-INITIALIZER
                             "gtk_constraint_target_get_type"))
             (gobject:get-g-type-definition "GtkConstraintTarget"))))

;;;     GtkConstraint

(test gtk-constraint-class
  ;; Check type
  (is (g:type-is-object "GtkConstraint"))
  ;; Check registered name
  (is (eq 'gtk:constraint
          (glib:symbol-for-gtype "GtkConstraint")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkConstraint")
          (g:gtype (cffi:foreign-funcall "gtk_constraint_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GObject")
          (g:type-parent "GtkConstraint")))
  ;; Check children
  (is (equal '()
             (list-children "GtkConstraint")))
  ;; Check interfaces
  (is (equal '()
             (list-interfaces "GtkConstraint")))
  ;; Check properties
  (is (equal '("constant" "multiplier" "relation" "source" "source-attribute"
               "strength" "target" "target-attribute")
             (list-properties "GtkConstraint")))
  ;; Check signals
  (is (equal '()
             (list-signals "GtkConstraint")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-G-OBJECT-CLASS "GtkConstraint" GTK-CONSTRAINT
                               (:SUPERCLASS G-OBJECT :EXPORT T :INTERFACES NIL
                                :TYPE-INITIALIZER "gtk_constraint_get_type")
                               ((CONSTANT GTK-CONSTRAINT-CONSTANT "constant"
                                 "gdouble" T NIL)
                                (MULTIPLIER GTK-CONSTRAINT-MULTIPLIER
                                 "multiplier" "gdouble" T NIL)
                                (RELATION GTK-CONSTRAINT-RELATION "relation"
                                 "GtkConstraintRelation" T NIL)
                                (SOURCE GTK-CONSTRAINT-SOURCE "source"
                                 "GtkConstraintTarget" T NIL)
                                (SOURCE-ATTRIBUTE
                                 GTK-CONSTRAINT-SOURCE-ATTRIBUTE
                                 "source-attribute" "GtkConstraintAttribute" T
                                 NIL)
                                (STRENGTH GTK-CONSTRAINT-STRENGTH "strength"
                                 "gint" T NIL)
                                (TARGET GTK-CONSTRAINT-TARGET "target"
                                 "GtkConstraintTarget" T NIL)
                                (TARGET-ATTRIBUTE
                                 GTK-CONSTRAINT-TARGET-ATTRIBUTE
                                 "target-attribute" "GtkConstraintAttribute" T
                                 NIL)))
             (gobject:get-g-type-definition "GtkConstraint"))))

;;; --- Properties -------------------------------------------------------------

(test gtk-constraint-properties
  (let ((constraint (make-instance 'gtk:constraint)))
    (is (= 0.0d0 (gtk:constraint-constant constraint)))
    (is (= 1.0d0 (gtk:constraint-multiplier constraint)))
    (is (eq :eq (gtk:constraint-relation constraint)))
    (is-false (gtk:constraint-source constraint))
    (is (eq :none (gtk:constraint-source-attribute constraint)))
    (is (= 1001001000 (gtk:constraint-strength constraint)))
    (is-false (gtk:constraint-target constraint))
    (is (eq :none (gtk:constraint-target-attribute constraint)))))

;;; --- Functions --------------------------------------------------------------

;;;     gtk_constraint_new
;;;     gtk_constraint_new_constant
;;;     gtk_constraint_is_required
;;;     gtk_constraint_is_attached
;;;     gtk_constraint_is_constant

;;; 2024-4-23
