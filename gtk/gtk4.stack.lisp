;;; ----------------------------------------------------------------------------
;;; gtk4.stack.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.0 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk4/>.
;;;
;;; Copyright (C) 2019 - 2023 Dieter Kaiser
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU Lesser General Public License for Lisp
;;; as published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version and with a preamble to
;;; the GNU Lesser General Public License that clarifies the terms for use
;;; with Lisp programs and is referred as the LLGPL.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Lesser General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser General Public
;;; License along with this program and the preamble to the Gnu Lesser
;;; General Public License.  If not, see <http://www.gnu.org/licenses/>
;;; and <http://opensource.franz.com/preamble.html>.
;;; ----------------------------------------------------------------------------
;;;
;;; GtkStack
;;;
;;;     A stacking container
;;;
;;; Types and Values
;;;
;;;     GtkStackPage
;;;     GtkStack
;;;     GtkStackTransitionType
;;;
;;; Accessors
;;;
;;;     gtk_stack_page_get_child
;;;     gtk_stack_page_get_icon_name
;;;     gtk_stack_page_set_icon_name
;;;     gtk_stack_page_get_name
;;;     gtk_stack_page_set_name
;;;     gtk_stack_page_get_needs_attention
;;;     gtk_stack_page_set_needs_attention
;;;     gtk_stack_page_get_title
;;;     gtk_stack_page_set_title
;;;     gtk_stack_page_get_use_underline
;;;     gtk_stack_page_set_use_underline
;;;     gtk_stack_page_get_visible
;;;     gtk_stack_page_set_visible
;;;
;;;     gtk_stack_set_hhomogeneous
;;;     gtk_stack_get_hhomogeneous
;;;     gtk_stack_get_interpolate_size
;;;     gtk_stack_set_interpolate_size
;;;     gtk_stack_get_pages
;;;     gtk_stack_set_transition_duration
;;;     gtk_stack_get_transition_duration
;;;     gtk_stack_get_transition_running
;;;     gtk_stack_set_transition_type
;;;     gtk_stack_get_transition_type
;;;     gtk_stack_set_vhomogeneous
;;;     gtk_stack_get_vhomogeneous
;;;     gtk_stack_set_visible_child
;;;     gtk_stack_get_visible_child
;;;     gtk_stack_set_visible_child_name
;;;     gtk_stack_get_visible_child_name
;;;
;;; Functions
;;;
;;;     gtk_stack_new
;;;     gtk_stack_add_child
;;;     gtk_stack_add_named
;;;     gtk_stack_add_titled
;;;     gtk_stack_remove
;;;     gtk_stack_get_child_by_name
;;;     gtk_stack_get_page
;;;     gtk_stack_set_visible_child_full
;;;
;;; Properties
;;;
;;;     child
;;;     icon-name
;;;     name
;;;     needs-attention
;;;     title
;;;     use-underline
;;;     visible
;;;
;;;     hhomogeneous
;;;     interpolate-size
;;;     pages
;;;     transition-duration
;;;     transition-running
;;;     transition-type
;;;     vhomogeneous
;;;     visible-child
;;;     visible-child-name
;;;
;;; Hierarchy
;;;
;;;     GObject
;;;     ├── GInitiallyUnowned
;;;     │   ╰── GtkWidget
;;;     │       ╰── GtkStack
;;;     ╰── GtkStackPage
;;;
;;; Implemented interfaces (GtkStackPage)
;;;
;;;     GtkAccessible
;;;
;;; Implemented Interfaces (GtkStack)
;;;
;;;     GtkAccessible
;;;     GtkBuildable
;;;     GtkConstraintTarget
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; GtkStackTransitionType
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkStackTransitionType" stack-transition-type
  (:export t
   :type-initializer "gtk_stack_transition_type_get_type")
  (:none 0)
  (:crossfade 1)
  (:slide-right 2)
  (:slide-left 3)
  (:slide-up 4)
  (:slide-down 5)
  (:slide-left-right 6)
  (:slide-up-down 7)
  (:over-up 8)
  (:over-down 9)
  (:over-left 10)
  (:over-right 11)
  (:under-up 12)
  (:under-down 13)
  (:under-left 14)
  (:under-right 15)
  (:over-up-down 16)
  (:over-down-up 17)
  (:over-left-right 18)
  (:over-right-left 19)
  (:rotate-left 20)
  (:rotate-right 21)
  (:rotate-left-right 22))

#+liber-documentation
(setf (liber:alias-for-symbol 'stack-transition-type)
      "GEnum"
      (liber:symbol-documentation 'stack-transition-type)
 "@version{#2022-2-5}
  @begin{short}
    These enumeration values describe the possible transitions between pages in
    a @class{gtk:stack} widget.
  @end{short}
  New values may be added to this enumeration over time.
  @begin{pre}
(gobject:define-g-enum \"GtkStackTransitionType\" stack-transition-type
  (:export t
   :type-initializer \"gtk_stack_transition_type_get_type\")
  (:none 0)
  (:crossfade 1)
  (:slide-right 2)
  (:slide-left 3)
  (:slide-up 4)
  (:slide-down 5)
  (:slide-left-right 6)
  (:slide-up-down 7)
  (:over-up 8)
  (:over-down 9)
  (:over-left 10)
  (:over-right 11)
  (:under-up 12)
  (:under-down 13)
  (:under-left 14)
  (:under-right 15)
  (:over-up-down 16)
  (:over-down-up 17)
  (:over-left-right 18)
  (:over-right-left 19)
  (:rotate-left 20)
  (:rotate-right 21)
  (:rotate-left-right 22))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No transition}
    @entry[:crossfade]{A cross fade.}
    @entry[:slide-right]{Slide from left to right.}
    @entry[:slide-left]{Slide from right to left.}
    @entry[:slide-up]{Slide from bottom up.}
    @entry[:slide-down]{Slide from top down.}
    @entry[:slide-left-right]{Slide from left or right according to the children
      order.}
    @entry[:slide-up-down]{Slide from top down or bottom up according to the
      order.}
    @entry[:over-up]{Cover the old page by sliding up.}
    @entry[:over-down]{Cover the old page by sliding down.}
    @entry[:over-left]{Cover the old page by sliding to the left.}
    @entry[:over-right]{Cover the old page by sliding to the right.}
    @entry[:under-up]{Uncover the new page by sliding up.}
    @entry[:under-down]{Uncover the new page by sliding down.}
    @entry[:under-left]{Uncover the new page by sliding to the left.}
    @entry[:under-right]{Uncover the new page by sliding to the right.}
    @entry[:over-up-down]{Cover the old page sliding up or uncover the new page
      sliding down, according to order.}
    @entry[:over-down-up]{Cover the old page sliding down or uncover the new
      page sliding up, according to order.}
    @entry[:over-left-right]{Cover the old page sliding left or uncover the new
      page sliding right, according to order.}
    @entry[:over-right-left]{Cover the old page sliding right or uncover the
      new page sliding left, according to order.}
    @entry[:rotate-left]{Pretend the pages are sides of a cube and rotate that
      cube to the left.}
    @entry[:rotate-right]{Pretend the pages are sides of a cube and rotate that
      cube to the right.}
    @entry[:rotate-left-right]{Pretend the pages are sides of a cube and rotate
      that cube to the left or right according to the children order.}
  @end{table}
  @see-class{gtk:stack}")

;;; ----------------------------------------------------------------------------
;;; GtkStackPage
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkStackPage" stack-page
  (:superclass g:object
   :export t
   :interfaces ("GtkAccessible")
   :type-initializer "gtk_stack_page_get_type")
  ((child
    stack-page-child
    "child" "GtkWidget" t t)
   (icon-name
    stack-page-icon-name
    "icon-name" "gchararray" t t)
   (name
    stack-page-name
    "name" "gchararray" t t)
   (needs-attention
    stack-page-needs-attention
    "needs-attention" "gboolean" t t)
   (title
    stack-page-title
    "title" "gchararray" t t)
   (use-underline
    stack-page-use-underline
    "use-underline" "gboolean" t t)
   (visible
    stack-page-visible
    "visible" "gboolean" t t)))

#+liber-documentation
(setf (documentation 'stack-page 'type)
 "@version{#2022-2-5}
  @begin{short}
  @end{short}
  @see-slot{gtk:stack-page-child}
  @see-slot{gtk:stack-page-icon-name}
  @see-slot{gtk:stack-page-name}
  @see-slot{gtk:stack-page-needs-attention}
  @see-slot{gtk:stack-page-title}
  @see-slot{gtk:stack-page-use-underline}
  @see-slot{gtk:stack-page-visible}
  @see-class{gtk:stack}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- stack-page-child ---------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "child" 'stack-page) t)
 "The @code{child} property of type @class{gtk:widget}
  (Read / Write / Construct only) @br{}
  The child widget of the page.")

#+liber-documentation
(setf (liber:alias-for-function 'stack-page-child)
      "Accessor"
      (documentation 'stack-page-child 'function)
 "@version{#2022-2-5}
  @syntax[]{(gtk:stack-page-child object) => child}
  @syntax[]{(setf (gtk:stack-page-child object) child)}
  @argument[object]{a @class{gtk:stack-page} object}
  @argument[child]{a @class{gtk:widget} child widget}
  @begin{short}
    Accessor of the @slot[gtk:stack-page]{child} slot of the
    @class{gtk:stack-page} class.
  @end{short}
  @see-class{gtk:stack-page}
  @see-class{gtk:widget}")

;;; --- stack-page-icon-name -----------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "icon-name" 'stack-page) t)
 "The @code{icon-name} property of type @code{:string} (Read / Write) @br{}
  The icon name of the child page. @br{}
  Default value: @code{nil}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-page-icon-name)
      "Accessor"
      (documentation 'stack-page-icon-name 'function)
 "@version{#2022-2-5}
  @syntax[]{(gtk:stack-page-icon-name object) => name}
  @syntax[]{(setf (gtk:stack-page-icon-name object) name)}
  @argument[object]{a @class{gtk:stack-page} object}
  @argument[name]{a string with the icon name of the child page}
  @begin{short}
    Accessor of the @slot[gtk:stack-page]{icon-name} slot of the
    @class{gtk:stack-page} class.
  @end{short}
  @see-class{gtk:stack-page}")

;;; --- stack-page-name ----------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "name" 'stack-page) t)
 "The @code{name} property of type @code{:string}
  (Read / Write / Construct only) @br{}
  The name of the child page. @br{}
  Default value: @code{nil}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-page-name)
      "Accessor"
      (documentation 'stack-page-name 'function)
 "@version{#2022-2-5}
  @syntax[]{(gtk:stack-page-name object) => name}
  @syntax[]{(setf (gtk:stack-page-name object) name)}
  @argument[object]{a @class{gtk:stack-page} object}
  @argument[name]{a string with the name of the child page}
  @begin{short}
    Accessor of the @slot[gtk:stack-page]{name} slot of the
    @class{gtk:stack-page} class.
  @end{short}
  @see-class{gtk:stack-page}")

;;; --- stack-page-needs-attention -----------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "needs-attention" 'stack-page) t)
 "The @code{needs-attention} property of type @code{:boolean} (Read / Write)
  @br{}
  Sets a flag specifying whether the page requires the user attention. This is
  used by the @class{gtk:stack-switcher} widget  to change the appearance of the
  corresponding button when a page needs attention and it is not the current
  one. @br{}
  Default value: @em{false}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-page-needs-attention)
      "Accessor"
      (documentation 'stack-page-needs-attention 'function)
 "@version{#2022-2-5}
  @syntax[]{(gtk:stack-page-needs-attention object) => setting}
  @syntax[]{(setf (gtk:stack-page-needs-attention object) setting)}
  @argument[object]{a @class{gtk:stack-page} object}
  @argument[name]{whether the page requires the user attention}
  @begin{short}
    Accessor of the @slot[gtk:stack-page]{needs-attention} slot of the
    @class{gtk:stack-page} class.
  @end{short}

  Sets a flag specifying whether the page requires the user attention. This is
  used by the @class{gtk:stack-switcher} widget  to change the appearance of the
  corresponding button when a page needs attention and it is not the current
  one.
  @see-class{gtk:stack-page}
  @see-class{gtk:stack-switcher}")

;;; --- stack-page-title ---------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "title" 'stack-page) t)
 "The @code{title} property of type @code{:string} (Read / Write) @br{}
  The title of the child page. @br{}
  Default value: @code{nil}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-page-title)
      "Accessor"
      (documentation 'stack-page-title 'function)
 "@version{#2022-2-5}
  @syntax[]{(gtk:stack-page-title object) => title}
  @syntax[]{(setf (gtk:stack-page-title object) title)}
  @argument[object]{a @class{gtk:stack-page} object}
  @argument[title]{a string with the title of the child page}
  @begin{short}
    Accessor of the @slot[gtk:stack-page]{title} slot of the
    @class{gtk:stack-page} class.
  @end{short}
  @see-class{gtk:stack-page}")

;;; --- stack-page-use-underline -------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "use-underline" 'stack-page) t)
 "The @code{use-underline} property of type @code{:boolean} (Read / Write) @br{}
  If set, an underline in the title indicates the next character should be used
  for the mnemonic accelerator key. @br{}
  Default value: @em{false}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-page-use-underline)
      "Accessor"
      (documentation 'stack-page-use-underline 'function)
 "@version{#2022-2-6}
  @syntax[]{(gtk:stack-page-use-underline object) => setting}
  @syntax[]{(setf (gtk:stack-page-use-underline object) setting)}
  @argument[object]{a @class{gtk:stack-page} object}
  @argument[setting]{a boolean if set, an underline in the title indicates the
    next character should be used for the mnemonic accelerator key}
  @begin{short}
    Accessor of the @slot[gtk:stack-page]{use-underline} slot of the
    @class{gtk:stack-page} class.
  @end{short}
  @see-class{gtk:stack-page}")

;;; --- stack-page-visible -------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "visible" 'stack-page) t)
 "The @code{visible} property of type @code{:boolean} (Read / Write) @br{}
  Whether this page is visible. @br{}
  Default value: @em{true}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-page-visible)
      "Accessor"
      (documentation 'stack-page-visible 'function)
 "@version{#2022-2-6}
  @syntax[]{(gtk:stack-page-visible object) => setting}
  @syntax[]{(setf (gtk:stack-page-visible object) setting)}
  @argument[object]{a @class{gtk:stack-page} object}
  @argument[setting]{a boolean whether this page is visible}
  @begin{short}
    Accessor of the @slot[gtk:stack-page]{visible} slot of the
    @class{gtk:stack-page} class.
  @end{short}
  @see-class{gtk:stack-page}")

;;; ----------------------------------------------------------------------------
;;; GtkStack
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkStack" stack
  (:superclass widget
   :export t
   :interfaces ("GtkAccessible"
                "GtkBuildable"
                "GtkConstraintTarget")
   :type-initializer "gtk_stack_get_type")
  ((hhomogeneous
    stack-hhomogeneous
    "hhomogeneous" "gboolean" t t)
   (interpolate-size
    stack-interpolate-size
    "interpolate-size" "gboolean" t t)
   (pages
    stack-pages
    "pages" "GtkSelectionModel" t nil)
   (transition-duration
    stack-transition-duration
    "transition-duration" "guint" t t)
   (transition-running
    stack-transition-running
    "transition-running" "gboolean" t nil)
   (transition-type
    stack-transition-type
    "transition-type" "GtkStackTransitionType" t t )
   (vhomogeneous
    stack-vhomogeneous
    "vhomogeneous" "gboolean" t t)
   (visible-child
    stack-visible-child
    "visible-child" "GtkWidget" t t)
   (visible-child-name
    stack-visible-child-name
    "visible-child-name" "gchararray" t t)))

#+liber-documentation
(setf (documentation 'stack 'type)
 "@version{#2022-2-5}
  @begin{short}
    The @sym{gtk:stack} widget is a container which only shows one of its
    children at a time.
  @end{short}
  In contrast to the @class{gtk:notebook} widget, the @sym{gtk:stack} widget
  does not provide a means for users to change the visible child. Instead, the
  @class{gtk:stack-switcher} widget can be used with the @sym{gtk:stack} widget
  to provide this functionality.

  @image[stack]{Figure: GtkStack}

  Transitions between pages can be animated as slides or fades. This can be
  controlled with the @fun{gtk:stack-transition-type} function. These animations
  respect the @slot[gtk:settings]{gtk-enable-animations} setting.

  The @sym{gtk:stack} widget maintains a @class{gtk:stack-page} object for each
  added child widget, which holds additional per-child properties. You obtain
  the @class{gtk:stack-page} object for a child widget with the
  @fun{gtk:stack-page} function.
  @begin[GtkStack as GtkBuildable]{dictionary}
    To set child-specific properties in a @file{.ui} file, create
    @class{gtk:stack-page} objects explicitly, and set the child widget as a
    property on it:
    @begin{pre}
<object class=\"GtkStack\" id=\"stack\">
  <child>
    <object class=\"GtkStackPage\">
      <property name=\"name\">page1</property>
      <property name=\"title\">In the beginning…</property>
      <property name=\"child\">
        <object class=\"GtkLabel\">
          <property name=\"label\">It was dark</property>
        </object>
      </property>
    </object>
  </child>
    @end{pre}
  @end{dictionary}
  @begin[CSS nodes]{dictionary}
    The @sym{gtk:stack} implementation has a single CSS node named @code{stack}.
  @end{dictionary}
  @begin[Accessibility]{dictionary}
    The @sym{gtk:stack} implementation uses the @code{:tab-panel} role of the
    @symbol{gtk:accessible-role} enumeration for the stack pages, which are the
    accessible parent objects of the child widgets.
  @end{dictionary}
  @see-slot{gtk:stack-hhomogeneous}
  @see-slot{gtk:stack-interpolate-size}
  @see-slot{gtk:stack-pages}
  @see-slot{gtk:stack-transition-duration}
  @see-slot{gtk:stack-transition-running}
  @see-slot{gtk:stack-transition-type}
  @see-slot{gtk:stack-vhomogeneous}
  @see-slot{gtk:stack-visible-child}
  @see-slot{gtk:stack-visisble-child-name}
  @see-class{gtk:stack-switcher}
  @see-class{gtk:notebook}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- stack-hhomogeneous -------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "hhomogeneous" 'stack) t)
 "The @code{hhomogeneous} property of type @code{:boolean} (Read / Write) @br{}
  @em{True} if the stack allocates the same width for all children. @br{}
  Default value: @em{true}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-hhomogeneous)
      "Accessor"
      (documentation 'stack-hhomogeneous 'function)
 "@version{#2021-12-7}
  @syntax[]{(gtk:stack-hhomogeneous object) => homogeneous}
  @syntax[]{(setf (gtk:stack-hhomogeneous object) homogeneous)}
  @argument[object]{a @class{gtk:stack} widget}
  @argument[homogeneous]{@em{true} to make stack horizontally homogeneous}
  @begin{short}
    Accessor of the @slot[gtk:stack]{hhomogeneous} slot of the @class{gtk:stack}
    class.
  @end{short}

  The @sym{gtk:stack-hhomogeneous} function gets whether the stack is
  horizontally homogeneous. The @sym{(setf gtk:stack-hhomogeneous)} function
  sets the stack to be horizontally homogeneous or not.

  If the stack is homogeneous, the stack will request the same width for all its
  children. If it is not, the stack may change width when a different child
  becomes visible.
  @see-class{gtk:stack}
  @see-function{gtk:stack-vhomogeneous}")

;;; --- stack-interpolate-size ---------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "interpolate-size" 'stack) t)
 "The @code{interpolate-size} property of type @code{:boolean} (Read / Write)
  @br{}
  Whether or not the size should smoothly change when changing between
  differently sized children. @br{}
  Default value: @em{false}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-interpolate-size)
      "Accessor"
      (documentation 'stack-interpolate-size 'function)
 "@version{#2021-12-7}
  @syntax[]{(gtk:stack-interpolate-size object) => interpolate}
  @syntax[]{(setf (gtk:stack-interpolate-size object) interpolate)}
  @argument[object]{a @class{gtk:stack} widget}
  @argument[interpolate]{@em{true} if child sizes are interpolated}
  @begin{short}
    Accessor of the @slot[gtk:stack]{interpolate-size} slot of the
    @class{gtk:stack} class.
  @end{short}

  The @sym{gtk:stack-interpolate-size} function returns whether the stack is
  set up to interpolate between the sizes of children on page switch. The
  @sym{(setf gtk:stack-interpolate-size)} function sets whether or not stack
  will interpolate its size when changing the visible child.

  If the @slot[gtk:stack]{interpolate-size} property is set to @em{true}, the
  stack will interpolate its size between the current one and the one it will
  take after changing the visible child, according to the set transition
  duration.
  @see-class{gtk:stack}")

;;; --- stack-pages --------------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "pages" 'stack) t)
 "The @code{pages} property of type @class{gtk:selection-model} (Read) @br{}
  A selection model with the stacks pages. Returns a @class{g-list-model} object
  that contains the pages of the stack, and can be used to keep an up-to-date
  view. The model also implements the @class{gtk:selection-model} object and can
  be used to track and modify the visible page.")

#+liber-documentation
(setf (liber:alias-for-function 'stack-pages)
      "Accessor"
      (documentation 'stack-pages 'function)
 "@version{#2022-2-6}
  @syntax[]{(gtk:stack-pages object) => pages}
  @argument[object]{a @class{gtk:stack} widget}
  @argument[pages]{a @class{gtk:selection-model} object with the stacks pages}
  @begin{short}
    Accessor of the @slot[gtk:stack]{pages} slot of the @class{gtk:stack} class.
  @end{short}

  The @sym{gtk:stack-pages} function returns a @class{g-list-model} object
  that contains the pages of the stack, and can be used to keep an up-to-date
  view. The model also implements the @class{gtk:selection-model} object and
  can be used to track and modify the visible page.
  @see-class{gtk:stack}
  @see-class{g-list-model}")

;;; --- stack-transition-duration ------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "transition-duration" 'stack) t)
 "The @code{transition-duration} property of type @code{:uint} (Read / Write)
  @br{}
  The animation duration, in milliseconds. 10 @br{}
  Default value: 200")

#+liber-documentation
(setf (liber:alias-for-function 'stack-transition-duration)
      "Accessor"
      (documentation 'stack-transition-duration 'function)
 "@version{#2021-12-7}
  @syntax[]{(gtk:stack-transition-duration object) => duration}
  @syntax[]{(setf (gtk:stack-transition-duration object) duration)}
  @argument[object]{a @class{gtk:stack} widget}
  @argument[duration]{an unsigned integer with the duration, in milliseconds}
  @begin{short}
    Accessor of the @slot[gtk:stack]{transition-duration} slot of the
    @class{gtk:stack} class.
  @end{short}

  The @sym{gtk:stack-transition-duration} function returns the amount of time
  in milliseconds that transitions between pages in the stack will take. The
  @sym{(setf gtk:stack-transition-duration)} function sets the duration.
  @see-class{gtk:stack}")

;;; --- stack-transition-running -------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "transition-running" 'stack) t)
 "The @code{transition-running} property of type @code{:boolean} (Read) @br{}
  Whether or not the transition is currently running. @br{}
  Default value: @em{false}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-transition-running)
      "Accessor"
      (documentation 'stack-transition-running 'function)
 "@version{#2021-12-7}
  @syntax[]{(gtk:stack-transition-running object) => running}
  @argument[object]{a @class{gtk:stack} widget}
  @begin{short}
    Accessor of the @slot[gtk:stack]{transition-running} slot of the
    @class{gtk:stack} class.
  @end{short}

  The @sym{gtk:stack-transition-running} function returns whether the stack is
  currently in a transition from one page to another.
  @see-class{gtk:stack}")

;;; --- stack-transition-type ----------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "transition-type" 'stack) t)
 "The @code{transition-type} property of type @symbol{gtk:stack-transition-type}
  (Read / Write) @br{}
  The type of animation used to transition. @br{}
  Default value: @code{:none}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-transition-type)
      "Accessor"
      (documentation 'stack-transition-type 'function)
 "@version{#2021-12-7}
  @syntax[]{(gtk:stack-transition-type object) => setting}
  @syntax[]{(setf (gtk:stack-transition-type object) setting)}
  @argument[object]{a @class{gtk:stack} widget}
  @argument[setting]{a value of the @symbol{gtk:stack-transition-type}
    enumeration}
  @begin{short}
    Accessor of the @slot[gtk:stack]{transition-type} slot of the
    @class{gtk:stack} class.
  @end{short}

  The @sym{gtk:stack-transition-type} function gets the type of animation that
  will be used for transitions between pages in the stack. The
  @sym{(setf gtk:stack-transition-type)} function sets the type of animation
  that will be used for transitions between pages in the stack. Available types
  include various kinds of fades and slides.

  The transition type can be changed without problems at runtime, so it is
  possible to change the animation based on the page that is about to become
  current.
  @see-class{gtk:stack}
  @see-symbol{gtk:stack-transition-type}")

;;; --- stack-vhomogeneous -------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "vhomogeneous" 'stack) t)
 "The @code{vhomogeneous} property of type @code{:boolean} (Read / Write) @br{}
  @em{True} if the stack allocates the same height for all children. @br{}
  Default value: @em{true}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-vhomogeneous)
      "Accessor"
      (documentation 'stack-vhomogeneous 'function)
 "@version{#2021-12-7}
  @syntax[]{(gtk:stack-vhomogeneous object) => homogeneous}
  @syntax[]{(setf (gtk:stack-vhomogeneous object) homogeneous)}
  @argument[object]{a @class{gtk:stack} widget}
  @argument[homogeneous]{@em{true} to make the stack vertically homogeneous}
  @begin{short}
    Accessor of the @slot[gtk:stack]{vhomogeneous} slot of the
    @class{gtk:stack} class.
  @end{short}

  The @sym{gtk:stack-vhomogeneous} function gets whether the stack is vertically
  homogeneous. The @sym{(setf gtk:stack-vhomogeneous)} function sets the stack
  to be vertically homogeneous or not.

  If the stack is homogeneous, the stack will request the same height for all
  its children. If it is not, the stack may change height when a different
  child becomes visible.
  @see-class{gtk:stack}
  @see-function{gtk:stack-hhomogeneous}")

;;; --- stack-visible-child ------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "visible-child" 'stack) t)
 "The @code{visible-child} property of type @class{gtk:widget} (Read / Write)
  @br{}
  The widget currently visible in the stack.")

#+liber-documentation
(setf (liber:alias-for-function 'stack-visible-child)
      "Accessor"
      (documentation 'stack-visible-child 'function)
 "@version{#2021-12-7}
  @syntax[]{(gtk:stack-visible-child object) => child}
  @syntax[]{(setf (gtk:stack-visible-child object) child)}
  @argument[object]{a @class{gtk:stack} widget}
  @argument[child]{a @class{gtk:widget} child widget of the stack}
  @begin{short}
    Accessor of the @slot[gtk:stack]{visible-child} slot of the
    @class{gtk:stack} class.
  @end{short}

  The @sym{gtk:stack-visible-child} function gets the currently visible child
  widget of the stack, or @code{nil} if there are no visible children. The
  @sym{(setf gtk:stack-visible-child)} function makes the child widget the
  visible child widget of the stack.

  If the child widget is different from the currently visible child widget,
  the transition between the two will be animated with the current transition
  type of stack.

  Note that the child widget has to be visible itself, see the
  @fun{gtk:widget-show} function, in order to become the visible child of the
  stack.
  @see-class{gtk:stack}
  @see-class{gtk:widget}
  @see-function{gtk:widget-show}")

;;; --- stack-visible-child-name -------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "visible-child-name" 'stack) t)
 "The @code{visible-child-name} property of type @code{:string} (Read / Write)
  @br{}
  The name of the widget currently visible in the stack. @br{}
  Default value: @code{nil}")

#+liber-documentation
(setf (liber:alias-for-function 'stack-visible-child-name)
      "Accessor"
      (documentation 'stack-visible-child-name 'function)
 "@version{#2021-12-7}
  @syntax[]{(gtk:stack-visible-child-name object) => name}
  @syntax[]{(setf (gtk:stack-visible-child-name object) name)}
  @argument[object]{a @class{gtk:stack} widget}
  @argument[name]{a string with the name of the visible child of the stack}
  @begin{short}
    Accessor of the @slot[gtk:stack]{visible-child-name} slot of the
    @class{gtk:stack} class.
  @end{short}

  The @sym{gtk:stack-visible-child-name} function returns the name of the
  currently visible child of the stack, or @code{nil} if there is no visible
  child. The @sym{(setf gtk:stack-visible-child-name)} function makes the child
  widget with the given name visible.

  If the child widget is different from the currently visible child, the
  transition between the two will be animated with the current transition type
  of stack.

  Note that the child widget has to be visible itself, see the
  @fun{gtk:widget-show} function, in order to become the visible child of the
  stack.
  @see-class{gtk:stack}
  @see-function{gtk:widget-show}")

;;; ----------------------------------------------------------------------------
;;; gtk_stack_new
;;; ----------------------------------------------------------------------------

(declaim (inline stack-new))

(defun stack-new ()
 #+liber-documentation
 "@version{#2021-12-7}
  @return{The new @class{gtk:stack} widget.}
  @short{Creates a new stack.}
  @see-class{gtk:stack}"
  (make-instance 'stack))

(export 'stack-new)

;;; ----------------------------------------------------------------------------
;;; gtk_stack_add_named
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_stack_add_named" stack-add-named) :void
 #+liber-documentation
 "@version{#2021-12-16}
  @argument[stack]{a @class{gtk:stack} widget}
  @argument[child]{a @class{gtk:widget} child page to add}
  @argument[name]{a string with the name for the child page}
  @begin{short}
    Adds a child page to the stack.
  @end{short}
  The child page is identified by @arg{name}.
  @see-class{gtk:stack}
  @see-class{gtk:widget}"
  (stack (g:object stack))
  (child (g:object widget))
  (name :string))

(export 'stack-add-named)

;;; ----------------------------------------------------------------------------
;;; gtk_stack_add_titled
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_stack_add_titled" stack-add-titled) :void
 #+liber-documentation
 "@version{#2021-12-7}
  @argument[stack]{a @class{gtk:stack} widget}
  @argument[child]{a @class{gtk:widget} child widget to add}
  @argument[name]{a string with the name for the child page}
  @argument[title]{a string with a human readable title for the child page}
  @begin{short}
    Adds a child page to the stack.
  @end{short}
  The child page is identified by @arg{name}. The title will be used by the
  @class{gtk:stack-switcher} widget to represent the child page in a tab bar,
  so it should be short.
  @see-class{gtk:stack}
  @see-class{gtk:stack-switcher}
  @see-class{gtk:widget}"
  (stack (g:object stack))
  (child (g:object widget))
  (name :string)
  (title :string))

(export 'stack-add-titled)

;;; ----------------------------------------------------------------------------
;;;gtk_stack_remove
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_stack_remove" stack-remove) :void
 #+liber-documentation
 "@version{#2022-2-6}
  @argument[stack]{a @class{gtk:stack} widget}
  @argument[child]{a @class{gtk:widget} child widget to remove}
  @short{Removes a child widget from the stack.}
  @see-class{gtk:stack}
  @see-class{gtk:widget}"
  (stack (g:object stack))
  (child (g:object widget)))

(export 'stack-remove)

;;; ----------------------------------------------------------------------------
;;; gtk_stack_get_child_by_name
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_stack_get_child_by_name" stack-child-by-name)
    (g:object widget)
 #+liber-documentation
 "@version{#2021-12-7}
  @argument[stack]{a @class{gtk:stack} widget}
  @argument[name]{a string with the name for the child page to find}
  @return{The requested @class{gtk:widget} child page of the stack.}
  @begin{short}
    Finds the child page of the stack with the name given as the argument.
  @end{short}
  Returns @code{nil} if there is no child page with this name.
  @see-class{gtk:stack}
  @see-class{gtk:widget}"
  (stack (g:object stack))
  (name :string))

(export 'stack-child-by-name)

;;; ----------------------------------------------------------------------------
;;;gtk_stack_get_page
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_stack_get_page" stack-page) (g:object stack-page)
 #+liber-documentation
 "@version{#2022-2-6}
  @argument[stack]{a @class{gtk:stack} widget}
  @argument[child]{a @class{gtk:widget} child widget}
  @return{A @class{gtk:stack-page} object for the child widget}
  @short{Returns the @class{gtk:stack-page} object for the child widget.}
  @see-class{gtk:stack}
  @see-class{gtk:widget}
  @see-class{gtk:stack-page}"
  (stack (g:object stack))
  (child (g:object widget)))

(export 'stack-page)

;;; ----------------------------------------------------------------------------
;;; gtk_stack_set_visible_child_full
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_stack_set_visible_child_full" stack-set-visible-child-full)
    :void
 #+liber-documentation
 "@version{#2021-12-7}
  @argument[stack]{a @class{gtk:stack} widget}
  @argument[name]{a string with the name of the child page to make visible}
  @argument[transition]{a value of the @symbol{gtk:stack-transition-type}
    enumeration to use}
  @begin{short}
    Makes the child page with the given name visible.
  @end{short}

  Note that the child page has to be visible itself, see the
  @fun{gtk:widget-show} function, in order to become the visible child page of
  the stack.
  @see-class{gtk:stack}
  @see-symbol{gtk:stack-transition-type}
  @see-function{gtk:widget-show}"
  (stack (g:object stack))
  (name :string)
  (transition stack-transition-type))

(export 'stack-set-visible-child-full)

;;; --- End of file gtk4.stack.lisp --------------------------------------------
