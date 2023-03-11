;;;;  Example Tree View Path - 2022-11-24

(in-package :gtk4-example)

(let ((col-path 0) (col-entry 1))

  (defun create-and-fill-model-path ()
    (let* ((model (gtk:tree-store-new "gchararray" "gchararray"))
           (parent (gtk:tree-store-append model nil))
           (parent1 nil)
           (child nil)
           (path (gtk:tree-model-path model parent)))
      (gtk:tree-store-set model
                          parent
                          (gtk:tree-path-to-string path)
                          "Songs")
      (setf child (gtk:tree-store-append model parent))
      (setf path (gtk:tree-model-path model child))
      (gtk:tree-store-set model
                          child
                          (gtk:tree-path-to-string path)
                          "MP3s")
      (setf child (gtk:tree-store-append model parent))
      (setf path (gtk:tree-model-path model child))
      (gtk:tree-store-set model
                          child
                          (gtk:tree-path-to-string path)
                          "Oggs")
      (setf parent (gtk:tree-store-append model nil))
      (setf path (gtk:tree-model-path model parent))
      (gtk:tree-store-set model
                          parent
                          (gtk:tree-path-to-string path)
                          "Videos")
      (setf parent1 (gtk:tree-store-append model parent))
      (setf path (gtk:tree-model-path model parent1))
      (gtk:tree-store-set model
                          parent1
                          (gtk:tree-path-to-string path)
                          "Clips")
      (setf child (gtk:tree-store-append model parent1))
      (setf path (gtk:tree-model-path model child))
      (gtk:tree-store-set model
                          child
                          (gtk:tree-path-to-string path)
                          "Funny Clips")
       (setf child (gtk:tree-store-append model parent1))
       (setf path (gtk:tree-model-path model child))
       (gtk:tree-store-set model
                           child
                           (gtk:tree-path-to-string path)
                           "Movie Trailers")
       (setf child (gtk:tree-store-append model parent))
       (setf path (gtk:tree-model-path model child))
       (gtk:tree-store-set model
                           child
                           (gtk:tree-path-to-string path)
                           "Movies")
      model))

  (defun create-view-and-model-path ()
    (let* ((model (create-and-fill-model-path))
           (view (gtk:tree-view-new-with-model model)))
      ;; Create renderer for the cells
      (let* ((renderer (gtk:cell-renderer-text-new))
             (column (gtk:tree-view-column-new-with-attributes "Path"
                                                               renderer
                                                               "text"
                                                               col-path)))
        (gtk:tree-view-append-column view column))
      (let* ((renderer (gtk:cell-renderer-text-new))
             (column (gtk:tree-view-column-new-with-attributes "Entry"
                                                               renderer
                                                               "text"
                                                               col-entry)))
        (gtk:tree-view-append-column view column))
      view))

  (defun do-tree-view-path (&optional application)
    (let* ((view (create-view-and-model-path))
           (window (make-instance 'gtk:window
                                  :title "Tree View Path"
                                  :child view
                                  :application application
                                  :default-width 350
                                  :default-height 250)))
        (gtk:widget-show window))))
