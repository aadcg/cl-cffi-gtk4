(in-package :gtk-test)

(def-suite gtk-video :in gtk-suite)
(in-suite gtk-video)

;;; Types and Values

;;;     GtkVideo

(test gtk-video-class
  ;; Type check
  (is (g:type-is-object "GtkVideo"))
  ;; Check the registered name
  (is (eq 'gtk:video
          (glib:symbol-for-gtype "GtkVideo")))
  ;; Check the type initializer
  (is (eq (g:gtype "GtkVideo")
          (g:gtype (cffi:foreign-funcall "gtk_video_get_type" :size))))
  ;; Check the parent
  (is (eq (g:gtype "GtkWidget") (g:type-parent "GtkVideo")))
  ;; Check the children
  (is (equal '()
             (list-children "GtkVideo")))
  ;; Check the interfaces
  (is (equal '("GtkAccessible" "GtkBuildable" "GtkConstraintTarget")
             (list-interfaces "GtkVideo")))
  ;; Check the class properties
  (is (equal '("autoplay" "file" "loop" "media-stream")
             (list-properties "GtkVideo")))
  ;; Check the list of signals
  (is (equal '()
             (list-signals "GtkVideo")))
  ;; CSS information
  (is (string= "video"
               (gtk:widget-class-css-name "GtkVideo")))
  (is (string=
"video:dir(ltr)
  overlay:dir(ltr)
    picture:dir(ltr)
    image.circular.large-icons.osd:dir(ltr)
    revealer:dir(ltr)
      controls.bottom.osd:dir(ltr)
        box.horizontal:disabled:dir(ltr)
          button.flat.image-button:disabled:dir(ltr)
            image:disabled:dir(ltr)
          box.horizontal:disabled:dir(ltr)
            label:disabled:dir(ltr)
            scale.horizontal:disabled:dir(ltr)
              trough:disabled:dir(ltr)
                highlight.top:disabled:dir(ltr)
                slider:disabled:dir(ltr)
            label:disabled:dir(ltr)
          scalebutton.scale:disabled:dir(ltr)
            button.flat.image-button.toggle:disabled:dir(ltr)
              image:disabled:dir(ltr)
            [popover.background.scale-popup:disabled:dir(ltr)]
              contents:disabled:dir(ltr)
                box.vertical:disabled:dir(ltr)
                  button.flat.image-button:disabled:dir(ltr)
                    image:disabled:dir(ltr)
                  scale.vertical:disabled:dir(ltr)
                    trough:disabled:dir(ltr)
                      highlight.bottom:disabled:dir(ltr)
                      slider:disabled:dir(ltr)
                  button.flat.image-button:disabled:dir(ltr)
                    image:disabled:dir(ltr)
              arrow:dir(ltr)
"
               (print-style-context "GtkVideo")))
  ;; Check the class definition
  (is (equal '(DEFINE-G-OBJECT-CLASS "GtkVideo" GTK-VIDEO
                       (:SUPERCLASS GTK-WIDGET :EXPORT T :INTERFACES
                        ("GtkAccessible" "GtkBuildable" "GtkConstraintTarget")
                        :TYPE-INITIALIZER "gtk_video_get_type")
                       ((AUTOPLAY GTK-VIDEO-AUTOPLAY "autoplay" "gboolean" T T)
                        (FILE GTK-VIDEO-FILE "file" "GFile" T T)
                        (LOOP GTK-VIDEO-LOOP "loop" "gboolean" T T)
                        (MEDIA-STREAM GTK-VIDEO-MEDIA-STREAM "media-stream"
                         "GtkMediaStream" T T)))
             (gobject:get-g-type-definition "GtkVideo"))))

;;; --- Properties -------------------------------------------------------------

;;;     autoplay
;;;     file
;;;     loop
;;;     media-stream

(test gtk-video-properties
  (let ((video (make-instance 'gtk:video)))
    (is-false (gtk:video-autoplay video))
    (is-false (gtk:video-file video))
    (is-false (gtk:video-loop video))
    (is-false (gtk:video-media-stream video))))

;;; --- Functions --------------------------------------------------------------

;;;     gtk_video_new

(test gtk-video-new
  (is (typep (gtk:video-new) 'gtk:video)))

;;;     gtk_video_new_for_file

(test gtk-video-new-for-file
  (let* ((file (g:file-new-for-path (sys-path "gtk-logo.webm")))
         (video (gtk:video-new-for-file file)))
    (is (typep video 'gtk:video))
    (is (string= "gtk-logo.webm" (g:file-basename (gtk:video-file video))))))

;;;     gtk_video_new_for_filename

(test gtk-video-new-for-filename
  (let* ((filename (sys-path "gtk-logo.webm"))
         (video (gtk:video-new-for-filename filename)))
    (is (typep video 'gtk:video))
    (is (string= "gtk-logo.webm" (g:file-basename (gtk:video-file video))))))

;;;     gtk_video_new_for_media_stream

(test gtk-video-new-for-media-stream
  (let* ((filename (sys-path "gtk-logo.webm"))
         (stream (gtk:media-file-new-for-filename filename))
         (video (gtk:video-new-for-media-stream stream)))
      (is (typep video 'gtk:video))
      (is-false (gtk:video-file video))
      (is (typep (gtk:video-media-stream video) 'gtk:media-file))))

;;;     gtk_video_new_for_resource

(test gtk-video-new-for-resource
  (with-g-resources (resource (sys-path "resource/rtest-resource.gresource"))
    (let* ((path "/com/crategus/test/gtk-logo.webm")
           (video (gtk:video-new-for-resource path)))
      (is (typep video 'gtk:video))
      (is (string= "gtk-logo.webm" (g:file-basename (gtk:video-file video)))))))

;;;     gtk_video_set_filename
;;;     gtk_video_set_resource

;;; --- 2023-5-29 --------------------------------------------------------------
