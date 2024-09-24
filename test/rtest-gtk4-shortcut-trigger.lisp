(in-package :gtk-test)

(def-suite gtk-shortcut-trigger :in gtk-suite)
(in-suite gtk-shortcut-trigger)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkShortcutTrigger

(test gtk-shortcut-trigger-class
  ;; Check type
  (is (g:type-is-object "GtkShortcutTrigger"))
  ;; Check registered name
  (is (eq 'gtk:shortcut-trigger
          (glib:symbol-for-gtype "GtkShortcutTrigger")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkShortcutTrigger")
          (g:gtype (cffi:foreign-funcall "gtk_shortcut_trigger_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GObject")
          (g:type-parent "GtkShortcutTrigger")))
  ;; Check children
  (is (equal '("GtkAlternativeTrigger" "GtkKeyvalTrigger" "GtkMnemonicTrigger"
               "GtkNeverTrigger")
             (glib-test:list-children "GtkShortcutTrigger")))
  ;; Check interfaces
  (is (equal '()
             (glib-test:list-interfaces "GtkShortcutTrigger")))
  ;; Check class properties
  (is (equal '()
             (glib-test:list-properties "GtkShortcutTrigger")))
  ;; Check signals
  (is (equal '()
             (glib-test:list-signals "GtkShortcutTrigger")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-GOBJECT "GtkShortcutTrigger" GTK:SHORTCUT-TRIGGER
                       (:SUPERCLASS G:OBJECT
                        :EXPORT T
                        :INTERFACES NIL
                        :TYPE-INITIALIZER "gtk_shortcut_trigger_get_type")
                       NIL)
             (gobject:get-gtype-definition "GtkShortcutTrigger"))))

;;;     GtkKeyvalTrigger

(test gtk-keyval-trigger-class
  ;; Check type
  (is (g:type-is-object "GtkKeyvalTrigger"))
  ;; Check registered name
  (is (eq 'gtk:keyval-trigger
          (glib:symbol-for-gtype "GtkKeyvalTrigger")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkKeyvalTrigger")
          (g:gtype (cffi:foreign-funcall "gtk_keyval_trigger_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GtkShortcutTrigger")
          (g:type-parent "GtkKeyvalTrigger")))
  ;; Check children
  (is (equal '()
             (glib-test:list-children "GtkKeyvalTrigger")))
  ;; Check interfaces
  (is (equal '()
             (glib-test:list-interfaces "GtkKeyvalTrigger")))
  ;; Check class properties
  (is (equal '("keyval" "modifiers")
             (glib-test:list-properties "GtkKeyvalTrigger")))
  ;; Check signals
  (is (equal '()
             (glib-test:list-signals "GtkKeyvalTrigger")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-GOBJECT "GtkKeyvalTrigger" GTK:KEYVAL-TRIGGER
                       (:SUPERCLASS GTK:SHORTCUT-TRIGGER
                        :EXPORT T
                        :INTERFACES NIL
                        :TYPE-INITIALIZER "gtk_keyval_trigger_get_type")
                       ((KEYVAL KEYVAL-TRIGGER-KEYVAL "keyval" "guint" T NIL)
                        (MODIFIERS KEYVAL-TRIGGER-MODIFIERS
                         "modifiers" "GdkModifierType" T NIL)))
             (gobject:get-gtype-definition "GtkKeyvalTrigger"))))

;;;     GtkMnemonicTrigger

(test gtk-mnemonic-trigger-class
  ;; Check type
  (is (g:type-is-object "GtkMnemonicTrigger"))
  ;; Check registered name
  (is (eq 'gtk:mnemonic-trigger
          (glib:symbol-for-gtype "GtkMnemonicTrigger")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkMnemonicTrigger")
          (g:gtype (cffi:foreign-funcall "gtk_mnemonic_trigger_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GtkShortcutTrigger")
          (g:type-parent "GtkMnemonicTrigger")))
  ;; Check children
  (is (equal '()
             (glib-test:list-children "GtkMnemonicTrigger")))
  ;; Check interfaces
  (is (equal '()
             (glib-test:list-interfaces "GtkMnemonicTrigger")))
  ;; Check class properties
  (is (equal '("keyval")
             (glib-test:list-properties "GtkMnemonicTrigger")))
  ;; Check signals
  (is (equal '()
             (glib-test:list-signals "GtkMnemonicTrigger")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-GOBJECT "GtkMnemonicTrigger" GTK:MNEMONIC-TRIGGER
                       (:SUPERCLASS GTK:SHORTCUT-TRIGGER
                        :EXPORT T
                        :INTERFACES NIL
                        :TYPE-INITIALIZER "gtk_mnemonic_trigger_get_type")
                       ((KEYVAL MNEMONIC-TRIGGER-KEYVAL "keyval" "guint" T NIL)))
             (gobject:get-gtype-definition "GtkMnemonicTrigger"))))

;;;     GtkAlternativeTrigger

(test gtk-alternative-trigger-class
  ;; Check type
  (is (g:type-is-object "GtkAlternativeTrigger"))
  ;; Check registered name
  (is (eq 'gtk:alternative-trigger
          (glib:symbol-for-gtype "GtkAlternativeTrigger")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkAlternativeTrigger")
          (g:gtype (cffi:foreign-funcall "gtk_alternative_trigger_get_type"
                                         :size))))
  ;; Check parent
  (is (eq (g:gtype "GtkShortcutTrigger")
          (g:type-parent "GtkAlternativeTrigger")))
  ;; Check children
  (is (equal '()
             (glib-test:list-children "GtkAlternativeTrigger")))
  ;; Check interfaces
  (is (equal '()
             (glib-test:list-interfaces "GtkAlternativeTrigger")))
  ;; Check class properties
  (is (equal '("first" "second")
             (glib-test:list-properties "GtkAlternativeTrigger")))
  ;; Check signals
  (is (equal '()
             (glib-test:list-signals "GtkAlternativeTrigger")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-GOBJECT "GtkAlternativeTrigger"
                                      GTK:ALTERNATIVE-TRIGGER
                       (:SUPERCLASS GTK:SHORTCUT-TRIGGER
                        :EXPORT T
                        :INTERFACES NIL
                        :TYPE-INITIALIZER "gtk_alternative_trigger_get_type")
                       ((FIRST ALTERNATIVE-TRIGGER-FIRST
                         "first" "GtkShortcutTrigger" T NIL)
                        (SECOND ALTERNATIVE-TRIGGER-SECOND
                         "second" "GtkShortcutTrigger" T NIL)))
             (gobject:get-gtype-definition "GtkAlternativeTrigger"))))

;;;     GtkNeverTrigger

(test gtk-never-trigger-class
  ;; Check type
  (is (g:type-is-object "GtkNeverTrigger"))
  ;; Check registered name
  (is (eq 'gtk:never-trigger
          (glib:symbol-for-gtype "GtkNeverTrigger")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkNeverTrigger")
          (g:gtype (cffi:foreign-funcall "gtk_never_trigger_get_type" :size))))
  ;; Check parent
  (is (eq (g:gtype "GtkShortcutTrigger")
          (g:type-parent "GtkNeverTrigger")))
  ;; Check children
  (is (equal '()
             (glib-test:list-children "GtkNeverTrigger")))
  ;; Check interfaces
  (is (equal '()
             (glib-test:list-interfaces "GtkNeverTrigger")))
  ;; Check class properties
  (is (equal '()
             (glib-test:list-properties "GtkNeverTrigger")))
  ;; Check signals
  (is (equal '()
             (glib-test:list-signals "GtkNeverTrigger")))
  ;; Check class definition
  (is (equal '(GOBJECT:DEFINE-GOBJECT "GtkNeverTrigger" GTK:NEVER-TRIGGER
                       (:SUPERCLASS GTK:SHORTCUT-TRIGGER
                        :EXPORT T
                        :INTERFACES NIL
                        :TYPE-INITIALIZER "gtk_never_trigger_get_type")
                       NIL)
             (gobject:get-gtype-definition "GtkNeverTrigger"))))

;;; --- Functions --------------------------------------------------------------

;;;     gtk_shortcut_trigger_trigger
;;;     gtk_shortcut_trigger_hash
;;;     gtk_shortcut_trigger_equal
;;;     gtk_shortcut_trigger_compare
;;;     gtk_shortcut_trigger_to_string
;;;     gtk_shortcut_trigger_print
;;;     gtk_shortcut_trigger_to_label
;;;     gtk_shortcut_trigger_print_label
;;;     gtk_shortcut_trigger_parse_string

;;;     gtk_keyval_trigger_new
;;;     gtk_keyval_trigger_get_modifiers
;;;     gtk_keyval_trigger_get_keyval

;;;     gtk_mnemonic_trigger_new
;;;     gtk_mnemonic_trigger_get_keyval

;;;     gtk_alternative_trigger_new
;;;     gtk_alternative_trigger_get_first
;;;     gtk_alternative_trigger_get_second

;;;     gtk_never_trigger_get

;;; 2024-9-20
