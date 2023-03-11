;;;; Example Icon View Content Type - 2022-11-24

;; FIXME: The code does not work. GtkIconView uses GdkPixbufs, but
;; GtkIconTheme only gives us GdkPaintable objects.

(in-package :gtk4-example)

(let ((col-icon 0) (col-icon-name 1) (col-mime-type 2) (col-desc 3))

  (declare (ignore col-mime-type))

  (defun create-and-fill-model-icon-view ()
    (let ((data (g:content-types-registered))
          (model (gtk:list-store-new "GdkPixbuf"
                                     "gchararray" "gchararray" "gchararray"))
          (icon-theme (gtk:icon-theme-default)))
      (dolist (mime-type data)
        (let* ((description (g:content-type-description mime-type))
               (icon-name (g:content-type-generic-icon-name mime-type))
               (icon (gtk:icon-theme-load-icon icon-theme
                                               icon-name
                                               24
                                               0)))
          (gtk:list-store-set model (gtk:list-store-append model)
                                    icon
                                    icon-name
                                    mime-type
                                    description)))
      model))

  (defun do-icon-view (&optional application)
    (let* ((view (make-instance 'gtk:icon-view
                                :model (create-and-fill-model-icon-view)
                                :pixbuf-column col-icon
                                :text-column col-icon-name
                                :tooltip-column col-desc))
           (scrolled (make-instance 'gtk:scrolled-window
                                    :child view))
           (window (make-instance 'gtk:window
                                  :title "Example Icon View"
                                  :child scrolled
                                  :application application
                                  :default-width 500
                                  :default-height 350)))
      (gtk:widget-show window))))
