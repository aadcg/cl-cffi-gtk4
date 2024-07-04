(in-package :gtk-test)

(def-suite gtk-shortcuts-group :in gtk-suite)
(in-suite gtk-shortcuts-group)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkShortcutsGroup

(test gtk-shortcuts-group-class
  ;; Check type
  (is (g:type-is-object "GtkShortcutsGroup"))
  ;; Check registered name
  (is (eq 'gtk:shortcuts-group
          (glib:symbol-for-gtype "GtkShortcutsGroup")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkShortcutsGroup")
          (g:gtype (cffi:foreign-funcall "gtk_shortcuts_group_get_type"
                                         :size))))
  ;; Check parent
  (is (eq (g:gtype "GtkBox")
          (g:type-parent "GtkShortcutsGroup")))
  ;; Check children
  (is (equal '()
             (gtk-test:list-children "GtkShortcutsGroup")))
  ;; Check interfaces
  (is (equal '("GtkAccessible" "GtkBuildable" "GtkConstraintTarget"
               "GtkOrientable")
             (gtk-test:list-interfaces "GtkShortcutsGroup")))
  ;; Check properties
  (is (equal '("accel-size-group" "height" "title" "title-size-group" "view")
             (gtk-test:list-properties "GtkShortcutsGroup")))
  ;; Check signals
  (is (equal '()
             (gtk-test:list-signals "GtkShortcutsGroup")))
  ;; Check CSS name
  (is (string= "shortcuts-group"
               (gtk:widget-class-css-name "GtkShortcutsGroup")))
  ;; Check accessible role
  (is (eq :group (gtk:widget-class-accessible-role "GtkShortcutsGroup")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-G-OBJECT-CLASS "GtkShortcutsGroup"
                                             GTK-SHORTCUTS-GROUP
                               (:SUPERCLASS GTK-BOX :EXPORT T :INTERFACES
                                ("GtkAccessible" "GtkBuildable"
                                 "GtkConstraintTarget" "GtkOrientable")
                                :TYPE-INITIALIZER
                                "gtk_shortcuts_group_get_type")
                               ((ACCEL-SIZE-GROUP
                                 GTK-SHORTCUTS-GROUP-ACCEL-SIZE-GROUP
                                 "accel-size-group" "GtkSizeGroup" NIL T)
                                (HEIGHT GTK-SHORTCUTS-GROUP-HEIGHT "height"
                                 "guint" T NIL)
                                (TITLE GTK-SHORTCUTS-GROUP-TITLE "title"
                                 "gchararray" T T)
                                (TITLE-SIZE-GROUP
                                 GTK-SHORTCUTS-GROUP-TITLE-SIZE-GROUP
                                 "title-size-group" "GtkSizeGroup" NIL T)
                                (VIEW GTK-SHORTCUTS-GROUP-VIEW "view"
                                 "gchararray" T T)))
             (gobject:get-g-type-definition "GtkShortcutsGroup"))))

;;; --- Properties -------------------------------------------------------------

;;;     accel-size-group
;;;     height
;;;     title
;;;     title-size-group
;;;     view

;;; 2024-7-3
