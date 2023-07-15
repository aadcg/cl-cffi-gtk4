;;; ----------------------------------------------------------------------------
;;; gtk4.box-layout.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.10 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk4/>.
;;;
;;; Copyright (C) 2022 - 2023 Dieter Kaiser
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining a
;;; copy of this software and associated documentation files (the "Software"),
;;; to deal in the Software without restriction, including without limitation
;;; the rights to use, copy, modify, merge, publish, distribute, sublicense,
;;; and/or sell copies of the Software, and to permit persons to whom the
;;; Software is furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included in
;;; all copies or substantial portions of the Software.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
;;; THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
;;; DEALINGS IN THE SOFTWARE.
;;; ----------------------------------------------------------------------------
;;;
;;; GtkBoxLayout
;;;
;;;     Layout manager for placing all children in a single row or column
;;;
;;; Types and Values
;;;
;;;     GtkBoxLayout
;;;
;;; Accessors
;;;
;;;     gtk_box_layout_set_homogeneous
;;;     gtk_box_layout_get_homogeneous
;;;     gtk_box_layout_set_spacing
;;;     gtk_box_layout_get_spacing
;;;     gtk_box_layout_set_baseline_position
;;;     gtk_box_layout_get_baseline_position
;;;
;;; Functions
;;;
;;;     gtk_box_layout_new
;;;
;;; Properties
;;;
;;;     baseline-position
;;;     homogeneous
;;;     spacing
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GtkLayoutManager
;;;         ╰── GtkBoxLayout
;;;
;;; Implemented Interfaces
;;;
;;;     GtkOrientable
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; GtkBoxLayout
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkBoxLayout" box-layout
  (:superclass layout-manager
   :export t
   :interfaces ("GtkOrientable")
   :type-initializer "gtk_box_layout_get_type")
  ((baseline-position
    box-layout-baseline-position
    "baseline-position" "GtkBaselinePosition" t t)
   (homogeneous
    box-layout-homogeneous
    "homogeneous" "gboolean" t t)
   (spacing
    box-layout-spacing
    "spacing" "gint" t t)))

#+liber-documentation
(setf (documentation 'box-layout 'type)
 "@version{#2023-4-18}
  @begin{short}
    A @sym{gtk:box-layout} class is a layout manager that arranges the children
    of any widget using it into a single row or column.
  @end{short}
  Whether it is a row or column depends on the value of its
  @slot[gtk:orientable]{orientation} property. Within the other dimension all
  children all allocated the same size. The @sym{gtk:box-layout} object will
  respect the @slot[gtk:widget]{halign} and @slot[gtk:widget]{valign} properties
  of each child widget.

  If you want all children to be assigned the same size, you can use the
  @slot[gtk:box-layout]{homogeneous} property.

  If you want to specify the amount of space placed between each child, you
  can use the @slot[gtk:box-layout]{spacing} property.
  @see-constructor{gtk:box-layout-new}
  @see-class{gtk:layout-manager}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- box-layout-baseline-position -------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "baseline-position"
                                               'box-layout) t)
 "The @code{baseline-position} property of type @symbol{gtk:baseline-position}
  (Read / Write) @br{}
  The position of the allocated baseline within the extra space allocated to
  each child of the widget using a box layout manager. This property is only
  relevant for horizontal layouts containing at least one child with a baseline
  alignment. @br{}
  Default value: @code{:center}")

#+liber-documentation
(setf (liber:alias-for-function 'box-layout-baseline-position)
      "Accessor"
      (documentation 'box-layout-baseline-position 'function)
 "@version{#2023-4-18}
  @syntax[]{(gtk:box-layout-baseline-position object) => position}
  @syntax[]{(setf (gtk:box-layout-baseline-position object) position)}
  @argument[object]{a @class{gtk:box-layout} object}
  @argument[position]{a @symbol{gtk:baseline-position} value}
  @begin{short}
    Accessor of the @slot[box-layout]{baseline-position} slot of the
    @class{gtk:box-layout} class.
  @end{short}
  The @sym{gtk:box-layout-baseline-position} function gets the baseline
  position. The @sym{(setf gtk:box-layout-baseline-position)} function sets the
  baseline position of a box layout.

  The baseline position affects only horizontal boxes with at least one
  baseline aligned child. If there is more vertical space available than
  requested, and the baseline is not allocated by the parent then the given
  position is used to allocate the baseline within the extra space available.
  @see-class{gtk:box-layout}
  @see-symbol{gtk:baseline-position}")

;;; --- box-layout-homogeneous -------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "homogeneous" 'box-layout) t)
 "The @code{homogeneous} property of type @code{:boolean} (Read / Write) @br{}
  Whether the box layout should distribute the available space homogeneously
  among the children of the widget using it as a layout manager. @br{}
  Default value: @em{false}")

#+liber-documentation
(setf (liber:alias-for-function 'box-layout-homogeneous)
      "Accessor"
      (documentation 'box-layout-homogeneous 'function)
 "@version{#2023-4-18}
  @syntax[]{(gtk:box-layout-homogeneous object) => homogeneous}
  @syntax[]{(setf (gtk:box-layout-homogeneous object) homogeneous)}
  @argument[object]{a @class{gtk:box-layout} object}
  @argument[homogeneous]{@em{true} if the box layout is homogeneous}
  @begin{short}
    Accessor of the @slot[box-layout]{homogeneous} slot of the
    @class{gtk:box-layout} class.
  @end{short}
  The @sym{gtk:box-layout-homogeneous} function returns whether the box layout
  will allocate the same size to all children. The
  @sym{(setf gtk:box-layout-homogeneous)} function sets the property.
  @see-class{gtk:box-layout}")

;;; --- box-layout-spacing -----------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "spacing" 'box-layout) t)
 "The @code{spacing} property of type @code{:int} (Read / Write) @br{}
  The space between each child of the widget using the box layout as its
  layout manager. @br{}
  Allowed values: >= 0 @br{}
  Default value: 0")

#+liber-documentation
(setf (liber:alias-for-function 'box-layout-spacing)
      "Accessor"
      (documentation 'box-layout-spacing 'function)
 "@version{#2023-4-18}
  @syntax[]{(gtk:box-layout-spacing object) => spacing}
  @syntax[]{(setf (gtk:box-layout-homogeneous object) spacing)}
  @argument[object]{a @class{gtk:box-layout} object}
  @argument[spacing]{an integer with the spacing of the box layout}
  @begin{short}
    Accessor of the @slot[box-layout]{spacing} slot of the
    @class{gtk:box-layout} class.
  @end{short}
  The @sym{gtk:box-layout-spacing} function returns the space that the box
  layout puts between children. The @sym{(setf gtk:box-layout-spacing)} function
  sets the spacing.
  @see-class{gtk:box-layout}")

;;; ----------------------------------------------------------------------------
;;; gtk_box_layout_new ()
;;; ----------------------------------------------------------------------------

(declaim (inline box-layout-new))

(defun box-layout-new (orientation)
 #+liber-documentation
 "@version{#2023-4-18}
  @argument[orientation]{a @symbol{gtk:orientable} value}
  @return{A new @class{gtk:box-layout} object.}
  @short{Creates a new box layout.}
  @see-class{gtk:box-layout}
  @see-symbol{gtk:orientable}"
  (make-instance 'box-layout
                 :orientation orientation))

(export 'box-layout-new)

;;; --- End of file gtk4.box-layout.lisp ---------------------------------------
