;;;; CSS Blend Modes
;;;;
;;;; You can blend multiple backgrounds using the CSS blend modes available.
;;;;
;;;; 2024-4-19

;; FIXME: This example gives a warning. What is the problem?
;;        Gtk-CRITICAL **: 16:38:45.006:
;;        gtk_root_get_focus: assertion 'GTK_IS_ROOT (self)' failed

(in-package :gtk4-example)

(defparameter +blend-modes+ '(("Color"         "color")
                              ("Color (burn)"  "color-burn")
                              ("Color (dodge)" "color-dodge")
                              ("Darken"        "darken")
                              ("Difference"    "difference")
                              ("Exclusion"     "exclusion")
                              ("Hard Light"    "hard-light")
                              ("Hue"           "hue")
                              ("Lighten"       "lighten")
                              ("Luminosity"    "luminosity")
                              ("Multiply"      "multiply")
                              ("Normal"        "normal")
                              ("Overlay"       "overlay")
                              ("Saturate"      "saturation")
                              ("Screen"        "screen")
                              ("Soft Light"    "soft-light")))

(defun do-css-blendmodes (&optional application)
  (let* ((path1 (glib-sys:sys-path "resource/css-blendmodes.ui"))
         (builder (gtk:builder-new-from-file path1))
         (listbox (make-instance 'gtk:list-box))
         (window (gtk:builder-object builder "window"))
         (provider (make-instance 'gtk:css-provider))
         (path2 (glib-sys:sys-path "gtk4-example.gresource"))
         (resource (g:resource-load path2)))
    ;; Register the resources
    (g:resources-register resource)
    ;; Add the window to the application
    (setf (gtk:window-application window) application)
    ;; Setup the CSS provider for window
    (gtk:widget-add-provider window provider)
    ;; Signal handler for listbox
    (g:signal-connect listbox "row-activated"
        (lambda (listbox row)
          (declare (ignore listbox))
          (let* ((mode (second (elt +blend-modes+
                                    (gtk:list-box-row-index row))))
                 (path (glib-sys:sys-path "resource/css-blendmodes.css"))
                 (str (format nil (read-file path) mode mode mode)))
            (gtk:css-provider-load-from-string provider str))))
    ;; Fill the list box
    (let ((normal nil))
      (dolist (mode +blend-modes+)
        (let ((row (make-instance 'gtk:list-box-row)))
           (setf (gtk:list-box-row-child row)
                 (make-instance 'gtk:label
                                :label (first mode)
                                :xalign 0.0))
           (gtk:list-box-insert listbox row -1)
           (when (string= "normal" (second mode))
             (setq normal row))))
      ;; Select the "normal" row
      (gtk:list-box-select-row listbox normal)
      (g:signal-emit normal "activate"))
    ;; Add listbox to scrolled window
    (setf (gtk:scrolled-window-child (gtk:builder-object builder
                                                         "scrolledwindow"))
          listbox)
    ;; Show the window
    (gtk:window-present window)))
