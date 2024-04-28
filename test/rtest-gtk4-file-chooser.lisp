(in-package :gtk-test)

(def-suite gtk-file-chooser :in gtk-suite)
(in-suite gtk-file-chooser)

;;; --- Types and Values -------------------------------------------------------

;;;     GtkFileChooserAction

(test gtk-file-chooser-action
  ;; Check type
  (is (g:type-is-enum "GtkFileChooserAction"))
  ;; Check type initializer
  (is (eq (g:gtype "GtkFileChooserAction")
          (g:gtype (cffi:foreign-funcall "gtk_file_chooser_action_get_type"
                                         :size))))
  ;; Check registered name
  (is (eq 'gtk:file-chooser-action
          (glib:symbol-for-gtype "GtkFileChooserAction")))
  ;; Check names
  (is (equal '("GTK_FILE_CHOOSER_ACTION_OPEN" "GTK_FILE_CHOOSER_ACTION_SAVE"
               "GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER")
             (list-enum-item-name "GtkFileChooserAction")))
  ;; Check values
  (is (equal '(0 1 2)
             (list-enum-item-value "GtkFileChooserAction")))
  ;; Check nick names
  (is (equal '("open" "save" "select-folder")
             (list-enum-item-nick "GtkFileChooserAction")))
  ;; Check enum definition
  (is (equal '(GOBJECT:DEFINE-G-ENUM "GtkFileChooserAction"
                             GTK-FILE-CHOOSER-ACTION
                             (:EXPORT T
                              :TYPE-INITIALIZER
                              "gtk_file_chooser_action_get_type")
                             (:OPEN 0)
                             (:SAVE 1)
                             (:SELECT-FOLDER 2))
             (gobject:get-g-type-definition "GtkFileChooserAction"))))

;;;     GtkFileChooser

(test gtk-file-chooser-interface
  ;; Check type
  (is (g:type-is-interface "GtkFileChooser"))
  ;; Check registered name
  (is (eq 'gtk:file-chooser
          (glib:symbol-for-gtype "GtkFileChooser")))
  ;; Check type initializer
  (is (eq (g:gtype "GtkFileChooser")
          (g:gtype (cffi:foreign-funcall "gtk_file_chooser_get_type" :size))))
  ;; Check interface prerequisites
  (is (equal '("GObject")
             (list-interface-prerequisites "GtkFileChooser")))
  ;; Check interface properties.
  (is (equal '("action" "create-folders" "filter" "filters" "select-multiple"
               "shortcut-folders")
             (list-interface-properties "GtkFileChooser")))
  ;; Check interface signals
  (is (equal '()
             (list-signals "GtkFileChooser")))
  ;; Get interface definition
  (is (equal '(GOBJECT:DEFINE-G-INTERFACE "GtkFileChooser" GTK-FILE-CHOOSER
                                  (:EXPORT T
                                   :TYPE-INITIALIZER "gtk_file_chooser_get_type")
                                  (ACTION GTK-FILE-CHOOSER-ACTION
                                   "action" "GtkFileChooserAction" T T)
                                  (CREATE-FOLDERS GTK-FILE-CHOOSER-CREATE-FOLDERS
                                   "create-folders" "gboolean" T T)
                                  (FILTER GTK-FILE-CHOOSER-FILTER
                                   "filter" "GtkFileFilter" T T)
                                  (FILTERS GTK-FILE-CHOOSER-FILTERS
                                   "filters" "GListModel" T NIL)
                                  (SELECT-MULTIPLE
                                   GTK-FILE-CHOOSER-SELECT-MULTIPLE
                                   "select-multiple" "gboolean" T T)
                                  (SHORTCUT-FOLDERS
                                   GTK-FILE-CHOOSER-SHORTCUT-FOLDERS
                                   "shortcut-folders" "GListModel" T NIL))
             (gobject:get-g-type-definition "GtkFileChooser"))))

;;; --- Properties -------------------------------------------------------------

(test gtk-file-chooser-properties
  (let ((*gtk-warn-deprecated* nil))
    (let ((chooser (make-instance 'gtk:file-chooser-dialog)))
      (is (eq :open (gtk:file-chooser-action chooser)))
      (is-true (gtk:file-chooser-create-folders chooser))
      (is-false (gtk:file-chooser-filter chooser))
      (is (typep (gtk:file-chooser-filters chooser) 'g:list-model))
      (is-false (gtk:file-chooser-select-multiple chooser))
      (is (typep (gtk:file-chooser-shortcut-folders chooser) 'g:list-model)))))

;;; --- Functions --------------------------------------------------------------

;;;     gtk_file_chooser_set_current_name
;;;     gtk_file_chooser_get_current_name

(test gtk-file-chooser-current-name
  (let ((*gtk-warn-deprecated* nil))
    (let ((chooser (make-instance 'gtk:file-chooser-dialog
                                  :action :save)))
      (is (string= "" (gtk:file-chooser-current-name chooser)))
      (is (string= "New name"
                   (setf (gtk:file-chooser-current-name chooser) "New name")))
      (is (string= "New name"
                   (gtk:file-chooser-current-name chooser))))))

;;;     gtk_file_chooser_get_file
;;;     gtk_file_chooser_set_file

(test gtk-file-chooser-file
  (let ((*gtk-warn-deprecated* nil))
    (let* ((filename (sys-path "rtest-gtk4-file-chooser.lisp"))
           (file (g:file-new-for-path filename))
           (chooser (make-instance 'gtk:file-chooser-widget
                                   :action :open)))
      (is (g:type-is-a (g:type-from-instance file) "GFile"))
      (is-false (gtk:file-chooser-file chooser))
      (is (eq file (setf (gtk:file-chooser-file chooser) file)))
      ;; TODO: FILE is not stored in the GtkFileChooserDialog object. Why?
      (is-false (gtk:file-chooser-file chooser)))))

(test gtk-file-chooser-namestring
  (let ((*gtk-warn-deprecated* nil))
    (let* ((path (sys-path "rtest-gtk4-file-chooser.lisp"))
           (chooser (make-instance 'gtk:file-chooser-widget
                                   :action :open)))
      (is-false (gtk:file-chooser-namestring chooser))
      (is (eq path
              (setf (gtk:file-chooser-namestring chooser) path)))
      ;; TODO: PATH is not stored in the GtkFileChooserDialog object. Why?
      (is-false (gtk:file-chooser-namestring chooser)))))

;;;     gtk_file_chooser_get_files

(test gtk-file-chooser-files
  (let ((*gtk-warn-deprecated* nil))
    (let ((chooser (make-instance 'gtk:file-chooser-widget)))
      (is (typep (gtk:file-chooser-files chooser) 'g:list-model)))))

;;;     gtk_file_chooser_set_current_folder
;;;     gtk_file_chooser_get_current_folder

(test gtk-file-chooser-current-folder
  (let ((*gtk-warn-deprecated* nil))
    (let ((path (sys-path ""))
          (chooser (make-instance 'gtk:file-chooser-widget)))
      (is-false (gtk:file-chooser-current-folder chooser))
      (is (eq path (setf (gtk:file-chooser-current-folder chooser) path)))
      (is-false (gtk:file-chooser-current-folder chooser)))))

;;;     gtk_file_chooser_add_filter
;;;     gtk_file_chooser_remove_filter
;;;     gtk_file_chooser_add_shortcut_folder
;;;     gtk_file_chooser_remove_shortcut_folder
;;;     gtk_file_chooser_add_choice
;;;     gtk_file_chooser_remove_choice
;;;     gtk_file_chooser_set_choice
;;;     gtk_file_chooser_get_choice

;;; 2024-4-26
