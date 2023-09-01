;;;; Example Aspect Frame - 2023-8-23
;;;;
;;;; In this example, we place a drawing area in an aspect frame. Enlarge and
;;;; shrink the window to see how the ratio of the drawing area is preserved.

(in-package :gtk4-example)

(defun do-aspect-frame (&optional (application nil))
    (let* ((area (make-instance 'gtk:drawing-area))
           (frame (make-instance 'gtk:aspect-frame
                                 :child area
                                 :xalign 0.5
                                 :yalign 0.5
                                 :ratio 1.5
                                 :obey-child nil))
           (window (make-instance 'gtk:window
                                  :application application
                                  :child frame
                                  :title "Aspect Frame"
                                  :default-width 240
                                  :default-height 320)))
    ;; Set a drawing function
    (gtk:drawing-area-set-draw-func area
        (lambda (widget cr width height)
          (let* ((context (gtk:widget-style-context widget))
                 (color (gtk:style-context-color context)))
            ;; Paint a red background
            (cairo:set-source-rgb cr 1.0 0.0 0.0)
            (cairo:paint cr)
            ;; Set the color from the style context of the widget
            (gdk:cairo-set-source-rgba cr color)
            ;; Draw and fill a circle on the drawing area
            (cairo:arc cr
                       (/ width 2.0)
                       (/ height 2.0)
                       (- (/ (min width height) 2.0) 12)
                       0.0
                       (* 2.0 pi))
            (cairo:fill cr))))
      (setf (gtk:widget-visible window) t)))
