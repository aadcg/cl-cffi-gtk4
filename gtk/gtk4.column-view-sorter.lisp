;;; ----------------------------------------------------------------------------
;;; gtk4.column-view-sorter.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.12 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk4/>.
;;;
;;; Copyright (C) 2023 Dieter Kaiser
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
;;; Types and Values
;;;
;;;     GtkColumnViewSorter
;;;
;;; Accessors
;;;
;;;     gtk_column_view_sorter_get_primary_sort_column
;;;     gtk_column_view_sorter_get_primary_sort_order
;;;
;;; Functions
;;;
;;;     gtk_column_view_sorter_get_n_sort_columns
;;;     gtk_column_view_sorter_get_nth_sort_column
;;;
;;; Properties
;;;
;;;     primary-sort-column
;;;     primary-sort-order
;;;
;;; Hierarchy
;;;
;;;     GObject
;;;     ╰── GtkSorter
;;;         ╰── GtkColumnViewSorter
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; Class GtkColumnViewSorter
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkColumnViewSorter" column-view-sorter
  (:superclass sorter
   :export t
   :interfaces ()
   :type-initializer "gtk_column_view_sorter_get_type")
  ((primary-sort-column
    column-view-sorter-primary-sort-column
    "primary-sort-column" "GtkColumnViewColumn" t nil)
   (primary-sort-order
    column-view-sorter-primary-sort-order
    "primary-sort-order" "GtkSortType" t nil)))

#+liber-documentation
(setf (documentation 'column-view-sorter 'type)
 "@version{2023-10-13}
  @begin{short}
    The @class{gtk:column-view-sorter} class is a sorter implementation that is
    geared towards the needs of the @class{gtk:column-view} widget.
  @end{short}
  The sorter returned by the @fun{gtk:column-view-sorter} function is a
  @class{gtk:column-view-sorter} object.

  In column views, sorting can be configured by associating sorters with
  columns, and users can invert sort order by clicking on column headers. The
  @class{gtk:column-view-sorter} API is designed to allow saving and restoring
  this configuration.

  If you are only interested in the primary sort column, i.e. the column where
  a sort indicator is shown in the header, then you can just look at the
  @slot[gtk:column-view-sorter]{primary-sort-column} and
  @slot[gtk:column-view-sorter]{primary-sort-order} properties.

  If you want to store the full sort configuration, including secondary sort
  columns that are used for tie breaking, then you can use the
  @fun{gtk:column-view-sorter-nth-sort-column} function. To get notified about
  changes, use the @code{\"changed\"} signal.

  To restore a saved sort configuration on a @class{gtk:column-view} widget,
  use code like:
  @begin{pre}
sorter = gtk_column_view_get_sorter (view);
for (i = gtk_column_view_sorter_get_n_sort_columns (sorter) - 1; i >= 0; i--)
  {
    column = gtk_column_view_sorter_get_nth_sort_column (sorter, i, &order);
    gtk_column_view_sort_by_column (view, column, order);
  @}
  @end{pre}
  Since 4.10
  @see-slot{gtk:column-view-sorter-primary-sort-column}
  @see-slot{gtk:column-view-sorter-primary-sort-order}
  @see-class{gtk:column-view}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- column-view-sorter-primary-sort-column ---------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "primary-sort-column"
                                               'column-view-sorter) t)
 "The @code{primary-sort-column} property of type @class{gtk:column-view-column}
  (Read) @br{}
  The primary sort column is the one that displays the triangle in a column
  view header.")

#+liber-documentation
(setf (liber:alias-for-function 'column-view-sorter-primary-sort-column)
      "Accessor"
      (documentation 'column-view-sorter-primary-sort-column 'function)
 "@version{2023-10-13}
  @syntax[]{(gtk:column-view-sorter-primary-sort-column object) => column}
  @argument[object]{a @class{gtk:column-view-sorter} object}
  @argument[column]{a @class{gtk:column-view-column} widget with the primary
    sort column}
  @begin{short}
    Accessor of the @slot[gtk:column-view-sorter]{primary-sort-column} slot of
    the @class{gtk:column-view-sorter} class.
  @end{short}
  Returns the primary sort column. The primary sort column is the one that
  displays the triangle in a column view header.

  Since 4.10
  @see-class{gtk:column-view-sorter}
  @see-class{gtk:column-view-column}")

;;; --- column-view-sorter-primary-sort-order ----------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "primary-sort-order"
                                               'column-view-sorter) t)
 "The @code{primary-sort-order} property of type @symbol{gtk:sort-type} (Read)
  @br{}
  The primary sort order determines whether the triangle displayed in the column
  view header of the primary sort column points upwards or downwards.")

#+liber-documentation
(setf (liber:alias-for-function 'column-view-sorter-primary-sort-order)
      "Accessor"
      (documentation 'column-view-sorter-primary-sort-order 'function)
 "@version{2023-10-13}
  @syntax[]{(gtk:column-view-sorter-primary-sort-order object) => order}
  @argument[object]{a @class{gtk:column-view-sorter} object}
  @argument[column]{a @symbol{gtk:sort-type} value with the primary sort order}
  @begin{short}
    Accessor of the @slot[gtk:column-view-sorter]{primary-sort-order} slot of
    the @class{gtk:column-view-sorter} class.
  @end{short}
  Returns the primary sort order. The primary sort order determines whether the
  triangle displayed in the column view header of the primary sort column points
  upwards or downwards. If there is no primary sort column, then this function
  returns the @code{:ascending} value.

  Since 4.10
  @see-class{gtk:column-view-sorter}
  @see-symbol{gtk:sort-type}")

;;; ----------------------------------------------------------------------------
;;; gtk_column_view_sorter_get_n_sort_columns
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_column_view_sorter_get_n_sort_columns"
               column-view-sorter-n-sort-columns) :uint
 #+liber-documentation
 "@version{#2023-10-13}
  @argument[sorter]{a @class{gtk:column-view-sorter} object}
  @return{An unsigned integer with the number of sort columns.}
  @begin{short}
    Returns the number of columns by which the sorter sorts.
  @end{short}
  If the sorter of the primary sort column does not determine a total order,
  then the secondary sorters are consulted to break the ties. Use the
  @code{\"changed\"} signal to get notified when the number of sort columns
  changes.

  Since 4.10
  @see-class{gtk:column-view-sorter}"
  (sorter (g:object column-view-sorter)))

(export 'column-view-sorter-n-sort-columns)

;;; ----------------------------------------------------------------------------
;;; gtk_column_view_sorter_get_nth_sort_column
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_column_view_sorter_nth_sort_column"
               %column-view-sorter-nth-sort-column)
    (g:object column-view-column)
  (sorter (g:object column-view-sorter))
  (position :uint)
  (order sort-type))

(defun column-view-sorter-nth-sort-column (sorter position)
 #+liber-documentation
 "@version{#2023-10-13}
  @argument[sorter]{a @class{gtk:column-view-sorter} object}
  @argument[position]{an unsigned integer with the position of the sort column
    to retrieve, 0 for the primary sort column}
  @begin{return}
    @arg{column} -- a @class{gtk:column-view-column} widget @br{}
    @arg{order} -- a @symbol{gtk:sort-type} value with the sort order
  @end{return}
  @begin{short}
    Gets the position‘th sort column and its associated sort order.
  @end{short}
  Use the @code{\"changed\"} signal to get notified when sort columns change.

  Since 4.10
  @see-class{gtk:column-view-sorter}
  @see-class{gtk:column-view-column}
  @see-symbol{gtk:sort-type}"
  (cffi:with-foreign-object (order 'sort-type)
    (let ((column (%column-view-sorter-nth-sort-column sorter position order)))
      (values column
              (cffi:mem-ref order 'sort-type)))))

(export 'column-view-sorter-nth-sort-column)

;;; --- End of file gtk4.column-view-sorter.lisp -------------------------------
