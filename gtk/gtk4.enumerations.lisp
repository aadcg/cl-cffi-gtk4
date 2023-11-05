;;; ----------------------------------------------------------------------------
;;; gtk4.enumerations.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.12 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk4/>.
;;;
;;; Copyright (C) 2011 - 2023 Dieter Kaiser
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
;;; Standard Enumerations
;;;
;;;     Public enumerated types used throughout GTK
;;;
;;; Types and Values
;;;
;;;     GTK_ACCESSIBLE_VALUE_UNDEFINED
;;;
;;;     GtkAlign
;;;     GtkArrowType
;;;     GtkBaselinePosition

;;;     GtkContentFit                                      --> gtk4.picture.lisp

;;;     GtkDeleteType
;;;     GtkDirectionType
;;;     GtkIconSize

;;;     GtkResponseType                                    <-- gtk4.dialog.lisp

;;;     GtkSensitivityType
;;;     GtkTextDirection
;;;     GtkJustification

;;;     GtkListTabBehavior                                 Since 4.12
;;;     GtkListScrollFlags                                 Since 4.12

;;;     GtkMessageType
;;;     GtkMovementStep
;;;     GtkNaturalWrapMode
;;;     GtkScrollStep
;;;     GtkOrientation
;;;     GtkOverflow
;;;     GtkPackType
;;;     GtkPositionType
;;;     GtkScrollType
;;;     GtkSelectionMode
;;;     GtkWrapMode
;;;     GtkSortType
;;;     GtkPrintPages
;;;     GtkPageSet
;;;     GtkNumberUpLayout
;;;     GtkOrdering
;;;     GtkPageOrientation
;;;     GtkPrintQuality
;;;     GtkPrintDuplex
;;;     GtkUnit
;;;     GtkTreeViewGridLines
;;;     GtkSizeGroupMode
;;;     GtkSizeRequestMode
;;;     GtkScrollablePolicy
;;;     GtkStateFlags
;;;     GtkBorderStyle
;;;     GtkLevelBarMode
;;;     GtkInputPurpose
;;;     GtkInputHints
;;;     GtkPropagationPhase
;;;     GtkPropagationLimit
;;;     GtkEventSequenceState
;;;     GtkPanDirection
;;;     GtkShortcutScope
;;;     GtkPickFlags
;;;     GtkConstraintRelation
;;;     GtkConstraintStrength
;;;     GtkConstraintAttribute
;;;     GtkConstraintVflParserError
;;;     GtkSystemSetting
;;;     GtkSymbolicColor
;;;     GtkAccessibleRole
;;;     GtkAccessibleState
;;;     GtkAccessibleProperty
;;;     GtkAccessibleRelation
;;;     GtkAccessibleTristate
;;;     GtkAccessibleInvalidState
;;;     GtkAccessibleAutocomplete
;;;     GtkAccessibleSort
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; GTK_ACCESSIBLE_VALUE_UNDEFINED
;;;
;;; An undefined value. The accessible attribute is either unset, or its
;;; value is undefined.
;;;
;;; #define GTK_ACCESSIBLE_VALUE_UNDEFINED  (-1)
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; GtkAlign
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkAlign" align
  (:export t
   :type-initializer "gtk_align_get_type")
  (:fill 0)
  (:start 1)
  (:end 2)
  (:center 3)
  #+gtk-4-12
  (:baseline-fill 4)
  #-gtk-4-12
  (:baseline 4)
  #+gtk-4-12
  (:baseline-center 5))

#+liber-documentation
(setf (liber:alias-for-symbol 'align)
      "GEnum"
      (liber:symbol-documentation 'align)
 "@version{2023-8-26}
  @begin{short}
    Controls how a widget deals with extra space in a single dimension.
  @end{short}
  Alignment only matters if the widget receives a \"too large\" allocation, for
  example if you packed the widget with the @slot[gtk:widget]{hexpand} property
  inside a @class{gtk:box} widget, then the widget might get extra space. If
  you have for example a 16 x 16 icon inside a 32 x 32 space, the icon could be
  scaled and stretched, it could be centered, or it could be positioned to one
  side of the space.

  Note that in horizontal context the @code{:start} and @code{:end} values are
  interpreted relative to text direction.

  The @code{:baseline} support is optional for containers and widgets, and it
  is only supported for vertical alignment. The @code{:baseline-center} and
  @code{:baseline-fill} values are treated similar to the @code{:center} and
  @code{:fill} values, except that it positions the widget to line up the
  baselines, where that is supported.
  @begin{pre}
(gobject:define-g-enum \"GtkAlign\" align
  (:export t
   :type-initializer \"gtk_align_get_type\")
  (:fill 0)
  (:start 1)
  (:end 2)
  (:center 3)
  #+gtk-4-12
  (:baseline-fill 4)
  #-gtk-4-12
  (:baseline 4)
  #+gtk-4-12
  (:baseline-center 5))
  @end{pre}
  @begin[code]{table}
    @entry[:fill]{Stretch to fill all space if possible, center if no meaningful
      way to stretch.}
    @entry[:start]{Snap to left or top side, leaving space on right or bottom.}
    @entry[:end]{Snap to right or bottom side, leaving space on left or top.}
    @entry[:center]{Center natural width of widget inside the allocation.}
    @entry[:baseline-fill]{A different name for @code{baseline}. Since 4.12}
    @entry[:baseline]{Align the widget according to the baseline. Deprecated
      4.12: Use @code{:baseline-fill} instead.}
    @entry[:baseline-center]{Stretch to fill all space, but align the baseline.
      Since 4.12}
  @end{table}
  @see-class{gtk:widget}
  @see-function{gtk:widget-halign}
  @see-function{gtk:widget-valign}")

;;; ----------------------------------------------------------------------------
;;; GtkArrowType
;;; ----------------------------------------------------------------------------

;; Defined in gtk.menu-button.lisp

#|
(gobject:define-g-enum "GtkArrowType" arrow-type
  (:export t
   :type-initializer "gtk_arrow_type_get_type")
  (:up 0)
  (:down 1)
  (:left 2)
  (:right 3)
  (:none 4))

#+liber-documentation
(setf (liber:alias-for-symbol 'arrow-type)
      "GEnum"
      (liber:symbol-documentation 'arrow-type)
 "@version{#2021-12-28}
  @begin{short}
    Used to indicate the direction in which an arrow should point.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkArrowType\" arrow-type
  (:export t
   :type-initializer \"gtk_arrow_type_get_type\")
  (:up 0)
  (:down 1)
  (:left 2)
  (:right 3)
  (:none 4))
  @end{pre}
  @begin[code]{table}
    @entry[:up]{Represents an upward pointing arrow.}
    @entry[:down]{Represents a downward pointing arrow.}
    @entry[:left]{Represents a left pointing arrow.}
    @entry[:right]{Represents a right pointing arrow.}
    @entry[:none]{No arrow.}
  @end{table}")
|#

;;; ----------------------------------------------------------------------------
;;; GtkBaselinePosition
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkBaselinePosition" baseline-position
  (:export t
   :type-initializer "gtk_baseline_position_get_type")
  (:top 0)
  (:center 1)
  (:bottom 2))

#+liber-documentation
(setf (liber:alias-for-symbol 'baseline-position)
      "GEnum"
      (liber:symbol-documentation 'baseline-position)
 "@version{2023-9-19}
  @begin{short}
    Baseline position in a row of widgets.
  @end{short}
  Whenever a container has some form of natural row it may align children in
  that row along a common typographical baseline. If the amount of vertical
  space in the row is taller than the total requested height of the
  baseline aligned children then it can use a @symbol{gtk:baseline-position}
  value to select where to put the baseline inside the extra available space.
  @begin{pre}
(gobject:define-g-enum \"GtkBaselinePosition\" baseline-position
  (:export t
   :type-initializer \"gtk_baseline_position_get_type\")
  (:top 0)
  (:center 1)
  (:bottom 2))
  @end{pre}
  @begin[code]{table}
    @entry[:top]{Align the baseline at the top.}
    @entry[:center]{Center the baseline.}
    @entry[:bottom]{Align the baseline at the bottom.}
  @end{table}
  @see-class{gtk:box}
  @see-class{gtk:grid}")

;;; ----------------------------------------------------------------------------
;;; GtkDeleteType
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkDeleteType" delete-type
  (:export t
   :type-initializer "gtk_delete_type_get_type")
  (:chars 0)
  (:word-ends 1)
  (:words 2)
  (:display-lines 3)
  (:display-line-ends 4)
  (:paragraph-ends 5)
  (:paragraphs 6)
  (:whitespace 7))

#+liber-documentation
(setf (liber:alias-for-symbol 'delete-type)
      "GEnum"
      (liber:symbol-documentation 'delete-type)
 "@version{#2021-12-28}
  @begin{short}
    The values of this enumeration are passed as an argument to various
    keybinding signals for deleting text.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkDeleteType\" delete-type
  (:export t
   :type-initializer \"gtk_delete_type_get_type\")
  (:chars 0)
  (:word-ends 1)
  (:words 2)
  (:display-lines 3)
  (:display-line-ends 4)
  (:paragraph-ends 5)
  (:paragraphs 6)
  (:whitespace 7))
  @end{pre}
  @begin[code]{table}
    @entry[:chars]{Delete characters.}
    @entry[:word-ends]{Delete only the portion of the word to the left/right
      of cursor if we are in the middle of a word.}
    @entry[:words]{Delete words.}
    @entry[:display-lines]{Delete display-lines. Display-lines refers to the
      visible lines, with respect to to the current line breaks. As opposed to
      paragraphs, which are defined by line breaks in the input.}
    @entry[:display-line-ends]{Delete only the portion of the display-line to
      the left/right of cursor.}
    @entry[:paragraph-ends]{Delete to the end of the paragraph. Like @kbd{C-k}
      in Emacs (or its reverse).}
    @entry[:paragraphs]{Delete entire line. Like @kbd{C-k} in pico.}
    @entry[:whitespace]{Delete only whitespace. Like @code{M-\\} in Emacs.}
  @end{table}
  @see-class{gtk:entry}
  @see-class{gtk:text-view}")

;;; ----------------------------------------------------------------------------
;;; GtkDirectionType
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkDirectionType" direction-type
  (:export t
   :type-initializer "gtk_direction_type_get_type")
  (:tab-forward 0)
  (:tab-backward 1)
  (:up 2)
  (:down 3)
  (:left 4)
  (:right 5))

#+liber-documentation
(setf (liber:alias-for-symbol 'direction-type)
      "GEnum"
      (liber:symbol-documentation 'direction-type)
 "@version{#2021-12-28}
  @short{Focus movement types.}
  @begin{pre}
(gobject:define-g-enum \"GtkDirectionType\" direction-type
  (:export t
   :type-initializer \"gtk_direction_type_get_type\")
  (:tab-forward 0)
  (:tab-backward 1)
  (:up 2)
  (:down 3)
  (:left 4)
  (:right 5))
  @end{pre}
  @begin[code]{table}
    @entry[:tab-forward]{Move forward.}
    @entry[:tab-backward]{Move backward.}
    @entry[:up]{Move up.}
    @entry[:down]{Move down.}
    @entry[:left]{Move left.}
    @entry[:right]{Move right.}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; GtkIconSize
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkIconSize" icon-size
  (:export t
   :type-initializer "gtk_icon_size_get_type")
  (:inherit 0)
  (:normal 1)
  (:large 2))

#+liber-documentation
(setf (liber:alias-for-symbol 'icon-size)
      "GEnum"
      (liber:symbol-documentation 'icon-size)
 "@version{2023-9-20}
  @begin{short}
    Built-in icon sizes.
  @end{short}
  Icon sizes default to being inherited. Where they cannot be inherited, text
  size is the default.

  All widgets which use the @symbol{gtk:icon-size} enumeration set the
  @code{.normal-icons} or @code{.large-icons} style classes correspondingly,
  and let themes determine the actual size to be used with the
  @code{-gtk:icon-size} CSS property.
  @begin{pre}
(gobject:define-g-enum \"GtkIconSize\" icon-size
  (:export t
   :type-initializer \"gtk_icon_size_get_type\")
  (:inherit 0)
  (:normal 1)
  (:large 2))
  @end{pre}
  @begin[code]{table}
    @entry[:inherit]{Keep the size of the parent element.}
    @entry[:normal]{Size similar to text size.}
    @entry[:large]{Large size, for example in an icon view.}
  @end{table}
  @see-class{gtk:icon-theme}")

;;; ----------------------------------------------------------------------------
;;; GtkResponseType
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkResponseType" response-type
  (:export t
   :allow-undeclared-values t
   :type-initializer "gtk_response_type_get_type")
  (:none -1)
  (:reject -2)
  (:accept -3)
  (:delete-event -4)
  (:ok -5)
  (:cancel -6)
  (:close -7)
  (:yes -8)
  (:no -9)
  (:apply -10)
  (:help -11))

#+liber-documentation
(setf (liber:alias-for-symbol 'response-type)
      "GEnum"
      (liber:symbol-documentation 'response-type)
 "@version{2023-8-21}
  @begin{short}
    Predefined values for use as response IDs in the @fun{gtk:dialog-add-button}
    function.
  @end{short}
  All predefined values are negative, GTK leaves positive values for application
  defined response IDs.
  @begin{pre}
(gobject:define-g-enum \"GtkResponseType\" response-type
  (:export t
   :type-initializer \"gtk_response_type_get_type\")
  (:none -1)
  (:reject -2)
  (:accept -3)
  (:delete-event -4)
  (:ok -5)
  (:cancel -6)
  (:close -7)
  (:yes -8)
  (:no -9)
  (:apply -10)
  (:help -11))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{Returned if an action widget has no response ID, or if the
      dialog gets programmatically hidden or destroyed.}
    @entry[:reject]{Generic response ID, not used by GTK dialog.}
    @entry[:accept]{Generic response ID, not used by GTK dialog.}
    @entry[:delete-event]{Returned if the dialog is deleted.}
    @entry[:ok]{Returned by OK buttons in GTK dialog.}
    @entry[:cancel]{Returned by Cancel buttons in GTK dialog.}
    @entry[:close]{Returned by Close buttons in GTK dialog.}
    @entry[:yes]{Returned by Yes buttons in GTK dialog.}
    @entry[:no]{Returned by No buttons in GTK dialog.}
    @entry[:apply]{Returned by Apply buttons in GTK dialog.}
    @entry[:help]{Returned by Help buttons in GTK dialog.}
  @end{table}
  @see-class{gtk:dialog}
  @see-function{gtk:dialog-add-button}")

;;; ----------------------------------------------------------------------------
;;; GtkSensitivityType
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkSensitivityType" sensitivity-type
  (:export t
   :type-initializer "gtk_sensitivity_type_get_type")
  (:auto 0)
  (:on 1)
  (:off 2))

#+liber-documentation
(setf (liber:alias-for-symbol 'sensitivity-type)
      "GEnum"
      (liber:symbol-documentation 'sensitivity-type)
 "@version{2023-9-1}
  @begin{short}
    Determines how GTK handles the sensitivity of various controls, such as
    combo box buttons.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkSensitivityType\" sensitivity-type
  (:export t
   :type-initializer \"gtk_sensitivity_type_get_type\")
  (:auto 0)
  (:on 1)
  (:off 2))
  @end{pre}
  @begin[code]{table}
    @entry[:auto]{The control is made insensitive if no action can be
      triggered.}
    @entry[:on]{The control is always sensitive.}
    @entry[:off]{The control is always insensitive.}
  @end{table}
  @see-class{gtk:combo-box}")

;;; ----------------------------------------------------------------------------
;;; GtkTextDirection
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkTextDirection" text-direction
  (:export t
   :type-initializer "gtk_text_direction_get_type")
  (:dummy -1) ; Workaround to ensure the base-type is :int for the enumeration
  (:none 0)
  (:ltr 1)
  (:rtl 2))

#+liber-documentation
(setf (liber:alias-for-symbol 'text-direction)
      "GEnum"
      (liber:symbol-documentation 'text-direction)
 "@version{#2021-9-8}
  @begin{short}
    Reading directions for text.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkTextDirection\" text-direction
  (:export t
   :type-initializer \"gtk_text_direction_get_type\")
  (:none 0)
  (:ltr 1)
  (:rtl 2))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No direction.}
    @entry[:ltr]{Left to right text direction.}
    @entry[:rtl]{Right to left text direction.}
  @end{table}
  @see-function{gtk:widget-direction}
  @see-function{gtk:widget-default-direction}")

;;; ----------------------------------------------------------------------------
;;; GtkJustification
;;; ----------------------------------------------------------------------------

;; TODO: Implement a base-type for defining an enumeration

(gobject:define-g-enum "GtkJustification" justification
  (:export t
   :type-initializer "gtk_justification_get_type")
  (:dummy1 -1)  ; Workaround to ensure the base-type is :int for the enumeration
  (:left 0)
  (:right 1)
  (:center 2)
  (:fill 3))

#+liber-documentation
(setf (liber:alias-for-symbol 'justification)
      "GEnum"
      (liber:symbol-documentation 'justification)
 "@version{#2021-12-22}
  @begin{short}
    Used for justifying the text inside a @class{gtk:label} widget.
  @end{short}
  See also the @class{gtk:alignment} widget.
  @begin{pre}
(gobject:define-g-enum \"GtkJustification\" justification
  (:export t
   :type-initializer \"gtk_justification_get_type\")
  (:left 0)
  (:right 1)
  (:center 2)
  (:fill 3))
  @end{pre}
  @begin[code]{table}
    @entry[:left]{The text is placed at the left edge of the label.}
    @entry[:right]{The text is placed at the right edge of the label.}
    @entry[:center]{The text is placed in the center of the label.}
    @entry[:fill]{The text is placed is distributed across the label.}
  @end{table}
  @see-class{gtk:alignment}
  @see-class{gtk:label}")

;;; ----------------------------------------------------------------------------
;;; enum GtkListTabBehavior                                Since 4.12
;;;
;;; Used to configure the focus behavior in the GTK_DIR_TAB_FORWARD and
;;; GTK_DIR_TAB_BACKWARD direction, like the Tab key in a GtkListView.
;;;
;;; Since 4.12
;;;
;;; GTK_LIST_TAB_ALL
;;;     Cycle through all focusable items of the list.
;;;
;;; GTK_LIST_TAB_ITEM	
;;;     Cycle through a single list element, then move focus out of the list.
;;;     Moving focus between items needs to be done with the arrow keys.
;;;
;;; GTK_LIST_TAB_CELL	
;;;     Cycle only through a single cell, then move focus out of the list.
;;;     Moving focus between cells needs to be done with the arrow keys. This
;;;     is only relevant for cell-based widgets like GtkColumnView, otherwise
;;;     it behaves like GTK_LIST_TAB_ITEM.
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; enum GtkListScrollFlags                                Since 4.12
;;;
;;; List of actions to perform when scrolling to items in a list widget.
;;;
;;; Since 4.12
;;;
;;; GTK_LIST_SCROLL_NONE	
;;;     Don’t do anything extra.
;;;
;;; GTK_LIST_SCROLL_FOCUS	
;;;     Focus the target item.
;;;
;;; GTK_LIST_SCROLL_SELECT	
;;;     Select the target item and unselect all other items.
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; GtkMessageType
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkMessageType" message-type
  (:export t
   :type-initializer "gtk_message_type_get_type")
  (:info 0)
  (:warning 1)
  (:question 2)
  (:error 3)
  (:other 4))

#+liber-documentation
(setf (liber:alias-for-symbol 'message-type)
      "GEnum"
      (liber:symbol-documentation 'message-type)
 "@version{2023-3-19}
  @begin{short}
    The type of message being displayed in the message dialog.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkMessageType\" message-type
  (:export t
   :type-initializer \"gtk_message_type_get_type\")
  (:info 0)
  (:warning 1)
  (:question 2)
  (:error 3)
  (:other 4))
  @end{pre}
  @begin[code]{table}
    @entry[:info]{Informational message.}
    @entry[:warning]{Non-fatal warning message.}
    @entry[:question]{Question requiring a choice.}
    @entry[:error]{Fatal error message.}
    @entry[:other]{None of the above.}
  @end{table}
  @see-class{gtk:message-dialog}")

;;; ----------------------------------------------------------------------------
;;; GtkMovementStep
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkMovementStep" movement-step
  (:export t
   :type-initializer "gtk_movement_step_get_type")
  (:logical-positions 0)
  (:visual-positions 1)
  (:words 2)
  (:display-lines 3)
  (:display-line-ends 4)
  (:paragraphs 5)
  (:paragraph-ends 6)
  (:pages 7)
  (:buffer-ends 8)
  (:horizontal-pages 9))

#+liber-documentation
(setf (liber:alias-for-symbol 'movement-step)
      "GEnum"
      (liber:symbol-documentation 'movement-step)
 "@version{#2021-12-28}
  @begin{short}
    The values of this enumeration are passed to various keybinding signals for
    moving the cursor position.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkMovementStep\" movement-step
  (:export t
   :type-initializer \"gtk_movement_step_get_type\")
  (:logical-positions 0)
  (:visual-positions 1)
  (:words 2)
  (:display-lines 3)
  (:display-line-ends 4)
  (:paragraphs 5)
  (:paragraph-ends 6)
  (:pages 7)
  (:buffer-ends 8)
  (:horizontal-pages 9))
  @end{pre}
  @begin[code]{table}
    @entry[:logical-positions]{Move forward or back by graphemes.}
    @entry[:visual-positions]{Move left or right by graphemes.}
    @entry[:words]{Move forward or back by words.}
    @entry[:display-lines]{Move up or down lines (wrapped lines).}
    @entry[:display-line-ends]{Move to either end of a line.}
    @entry[:paragraphs]{Move up or down paragraphs (newline-ended lines).}
    @entry[:paragraph-ends]{Move to either end of a paragraph.}
    @entry[:pages]{Move by pages.}
    @entry[:buffer-ends]{Move to ends of the buffer.}
    @entry[:horizontal-pages]{Move horizontally by pages.}
  @end{table}
  @see-class{gtk:entry}
  @see-class{gtk:tree-view}
  @see-class{gtk:list-box}
  @see-class{gtk:flow-box}")

;;; ----------------------------------------------------------------------------
;;; GtkNaturalWrapMode
;;; ----------------------------------------------------------------------------

#+gtk-4-6
(gobject:define-g-enum "GtkNaturalWrapMode" natural-wrap-mode
  (:export t
   :type-initializer "gtk_natural_wrap_mode_get_type")
  (:inherit 0)
  (:none 1)
  (:word 2))

#+(and gtk-4-6 liber-documentation)
(setf (liber:alias-for-symbol 'natural-wrap-mode)
      "GEnum"
      (liber:symbol-documentation 'natural-wrap-mode)
 "@version{2023-7-24}
  @begin{short}
    Options for selecting a different wrap mode for natural size requests.
  @end{short}
  See for example the @slot[gtk:label]{natural-wrap-mode} property.
  @begin{pre}
(gobject:define-g-enum \"GtkNaturalWrapMode\" natural-wrap-mode
  (:export t
   :type-initializer \"gtk_natural_wrap_mode_get_type\")
  (:inherit 0)
  (:none 1)
  (:word 2))
  @end{pre}
  @begin[code]{table}
    @entry[:inherit]{Inherit the minimum size request. In particular, this
      should be used with the @code{:char} value of the
      @symbol{pango:wrap-mode} enumeration.}
    @entry[:none]{Try not to wrap the text. This mode is the closest to the
    behavior of GTK 3 but can lead to a wide label leaving lots of empty space
    below the text.}
    @entry[:word]{Attempt to wrap at word boundaries. This is useful in
      particular when using the @code{:word-char} value of the
      @symbol{pango:wrap-mode} enumeration as the wrap mode.}
  @end{table}
  Since 4.6
  @see-function{gtk:label-natural-wrap-mode}")

;;; ----------------------------------------------------------------------------
;;; GtkScrollStep
;;; ----------------------------------------------------------------------------

;; TODO: This enumeration is not in use in the cl-cffi-gtk implementation.

(gobject:define-g-enum "GtkScrollStep" scroll-step
  (:export t
   :type-initializer "gtk_scroll_step_get_type")
  (:steps 0)
  (:pages 1)
  (:ends 2)
  (:horizontal-steps 3)
  (:horizontal-pages 4)
  (:horizontal-ends 5))

#+liber-documentation
(setf (liber:alias-for-symbol 'scroll-step)
      "GEnum"
      (liber:symbol-documentation 'scroll-step)
 "@version{#2021-12-28}
  @short{Passed as argument to various keybinding signals.}
  @begin{pre}
(gobject:define-g-enum \"GtkScrollStep\" scroll-step
  (:export t
   :type-initializer \"gtk_scroll_step_get_type\")
  (:steps 0)
  (:pages 1)
  (:ends 2)
  (:horizontal-steps 3)
  (:horizontal-pages 4)
  (:horizontal-ends 5))
  @end{pre}")

;;; ----------------------------------------------------------------------------
;;; GtkOrientation
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkOrientation" orientation
  (:export t
   :type-initializer "gtk_orientation_get_type")
  (:horizontal 0)
  (:vertical 1))

#+liber-documentation
(setf (liber:alias-for-symbol 'orientation)
      "GEnum"
      (liber:symbol-documentation 'orientation)
 "@version{2023-3-19}
  @begin{short}
    Represents the orientation of widgets and other objects which can be
    switched between horizontal and vertical orientation on the fly.
  @end{short}
  Typical examples are the @class{gtk:box} widget or the @class{gtk:gesture-pan}
  object.
  @begin{pre}
(gobject:define-g-enum \"GtkOrientation\" orientation
  (:export t
   :type-initializer \"gtk_orientation_get_type\")
  (:horizontal 0)
  (:vertical 1))
  @end{pre}
  @begin[code]{table}
    @entry[:horizontal]{The object is in horizontal orientation.}
    @entry[:vertical]{The object is in vertical orientation.}
  @end{table}
  @see-class{gtk:orientable}
  @see-class{gtk:box}
  @see-class{gtk:gesture-pan}")

;;; ----------------------------------------------------------------------------
;;; GtkOverflow
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkOverflow" overflow
  (:export t
   :type-initializer "gtk_overflow_get_type")
  (:visible 0)
  (:hidden 1))

#+liber-documentation
(setf (liber:alias-for-symbol 'overflow)
      "GEnum"
      (liber:symbol-documentation 'overflow)
 "@version{#2021-12-28}
  @begin{short}
    Defines how content overflowing a given area should be handled.
  @end{short}

  This is used in the @fun{gtk:widget-overflow} function. The
  @slot[gtk:widget]{overflow} property is modeled after the CSS overflow
  property, but implements it only partially.
  @begin{pre}
(gobject:define-g-enum \"GtkOverflow\" overflow
  (:export t
   :type-initializer \"gtk_overflow_get_type\")
  (:visible 0)
  (:hidden 1))
  @end{pre}
  @begin[code]{table}
    @entry[:visible]{No change is applied. Content is drawn at the specified
      position.}
    @entry[:hidden]{Content is clipped to the bounds of the area. Content
      outside the area is not drawn and cannot be interacted with.}
  @end{table}
  @see-function{gtk:widget-overflow}")

;;; ----------------------------------------------------------------------------
;;; GtkPackType
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkPackType" pack-type
  (:export t
   :type-initializer "gtk_pack_type_get_type")
  (:start 0)
  (:end 1))

#+liber-documentation
(setf (liber:alias-for-symbol 'pack-type)
      "GEnum"
      (liber:symbol-documentation 'pack-type)
 "@version{#2021-12-28}
  @begin{short}
    Represents the packing location of the child widget in its parent.
  @end{short}
  See the @class{gtk:window-controls} widget.
  @begin{pre}
(gobject:define-g-enum \"GtkPackType\" pack-type
  (:export t
   :type-initializer \"gtk_pack_type_get_type\")
  (:start 0)
  (:end 1))
  @end{pre}
  @begin[code]{table}
    @entry[:start]{The child is packed into the start of the widget.}
    @entry[:end]{The child is packed into the end of the widget.}
  @end{table}
  @see-class{gtk:window-controls}")

;;; ----------------------------------------------------------------------------
;;; GtkPositionType
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkPositionType" position-type
  (:export t
   :type-initializer "gtk_position_type_get_type")
  (:left 0)
  (:right 1)
  (:top 2)
  (:bottom 3))

#+liber-documentation
(setf (liber:alias-for-symbol 'position-type)
      "GEnum"
      (liber:symbol-documentation 'position-type)
 "@version{#2021-12-28}
  @begin{short}
    Describes which edge of a widget a certain feature is positioned at.
  @end{short}
  For example, see the tabs of a @class{gtk:notebook} widget, or the label of
  a @class{gtk:scale} widget.
  @begin{pre}
(gobject:define-g-enum \"GtkPositionType\" position-type
  (:export t
   :type-initializer \"gtk_position_type_get_type\")
  (:left 0)
  (:right 1)
  (:top 2)
  (:bottom 3))
  @end{pre}
  @begin[code]{table}
    @entry[:left]{The feature is at the left edge.}
    @entry[:right]{The feature is at the right edge.}
    @entry[:top]{The feature is at the top edge.}
    @entry[:bottom]{The feature is at the bottom edge.}
  @end{table}
  @see-class{gtk:notebook}
  @see-class{gtk:scale}")

;;; ----------------------------------------------------------------------------
;;; GtkScrollType
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkScrollType" scroll-type
  (:export t
   :type-initializer "gtk_scroll_type_get_type")
  (:none 0)
  (:jump 1)
  (:step-backward 2)
  (:step-forward 3)
  (:page-backward 4)
  (:page-forward 5)
  (:step-up 6)
  (:step-down 7)
  (:page-up 8)
  (:page-down 9)
  (:step-left 10)
  (:step-right 11)
  (:page-left 12)
  (:page-right 13)
  (:start 14)
  (:end 15))

#+liber-documentation
(setf (liber:alias-for-symbol 'scroll-type)
      "GEnum"
      (liber:symbol-documentation 'scroll-type)
 "@version{#2021-12-28}
  @begin{short}
    The scrolling types of this enumeration are a parameter for signal
    handlers in various widgets such as @class{gtk:spin-button},
    @class{gtk:scrolled-window}, or @class{gtk:combo-box}.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkScrollType\" scroll-type
  (:export t
   :type-initializer \"gtk_scroll_type_get_type\")
  (:none 0)
  (:jump 1)
  (:step-backward 2)
  (:step-forward 3)
  (:page-backward 4)
  (:page-forward 5)
  (:step-up 6)
  (:step-down 7)
  (:page-up 8)
  (:page-down 9)
  (:step-left 10)
  (:step-right 11)
  (:page-left 12)
  (:page-right 13)
  (:start 14)
  (:end 15))
  @end{pre}
  @see-class{gtk:spin-button}
  @see-class{gtk:scrolled-window}
  @see-class{gtk:combo-box}")

;;; ----------------------------------------------------------------------------
;;; GtkSelectionMode
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkSelectionMode" selection-mode
  (:export t
   :type-initializer "gtk_selection_mode_get_type")
  (:none 0)
  (:single 1)
  (:browse 2)
  (:multiple 3))

#+liber-documentation
(setf (liber:alias-for-symbol 'selection-mode)
      "GEnum"
      (liber:symbol-documentation 'selection-mode)
 "@version{#2021-12-28}
  @short{Used to control what selections users are allowed to make.}
  @begin{pre}
(gobject:define-g-enum \"GtkSelectionMode\" gtk:selection-mode
  (:export t
   :type-initializer \"gtk_selection_mode_get_type\")
  (:none 0)
  (:single 1)
  (:browse 2)
  (:multiple 3))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No selection is possible.}
    @entry[:single]{Zero or one element may be selected.}
    @entry[:browse]{Exactly one element is selected. In some circumstances, such
      as initially or during a search operation, it is possible for no element
      to be selected with the @code{:browse} value. What is really enforced is
      that the user cannot deselect a currently selected element except by
      selecting another element.}
    @entry[:multiple]{Any number of elements may be selected. The @kbd{Ctrl} key
      may be used to enlarge the selection, and the @kbd{Shift} key to select
      between the focus and the child pointed to. Some widgets may also allow
      Click-drag to select a range of elements.}
  @end{table}
  @see-class{gtk:flow-box}
  @see-class{gtk:list-box}
  @see-class{gtk:icon-view}
  @see-class{gtk:tree-selection}")

;;; ----------------------------------------------------------------------------
;;; GtkWrapMode
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkWrapMode" wrap-mode
  (:export t
   :type-initializer "gtk_wrap_mode_get_type")
  (:none 0)
  (:char 1)
  (:word 2)
  (:word-char 3))

#+liber-documentation
(setf (liber:alias-for-symbol 'wrap-mode)
      "GEnum"
      (liber:symbol-documentation 'wrap-mode)
 "@version{2023-10-4}
  @short{Describes a type of line wrapping.}
  @begin{pre}
(gobject:define-g-enum \"GtkWrapMode\" wrap-mode
  (:export t
   :type-initializer \"gtk_wrap_mode_get_type\")
  (:none 0)
  (:char 1)
  (:word 2)
  (:word-char 3))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{Do not wrap lines, just make the text area wider.}
    @entry[:char]{Wrap text, breaking lines anywhere the cursor can appear
      between characters, usually. If you want to be technical, between
      graphemes, see the @fun{pango:log-attrs} function.}
    @entry[:word]{Wrap text, breaking lines in between words.}
    @entry[:word-char]{Wrap text, breaking lines in between words, or if that
      is not enough, also between graphemes.}
  @end{table}
  @see-class{gtk:text-tag}
  @see-class{gtk:text-view}
  @see-function{pango:log-attrs}")

;;; ----------------------------------------------------------------------------
;;; GtkSortType
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkSortType" sort-type
  (:export t
   :type-initializer "gtk_sort_type_get_type")
  (:ascending 0)
  (:descending 1))

#+liber-documentation
(setf (liber:alias-for-symbol 'sort-type)
      "GEnum"
      (liber:symbol-documentation 'sort-type)
 "@version{2023-9-5}
  @short{Determines the direction of a sort.}
  @begin{pre}
(gobject:define-g-enum \"GtkSortType\" sort-type
  (:export t
   :type-initializer \"gtk_sort_type_get_type\")
  (:ascending 0)
  (:descending 1))
  @end{pre}
  @begin[code]{table}
    @entry[:ascending]{Sorting is in ascending order.}
    @entry[:descending]{Sorting is in descending order.}
  @end{table}
  @see-class{gtk:numeric-sorter}")

;;; ----------------------------------------------------------------------------
;;; GtkPrintPages
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkPrintPages" print-pages
  (:export t
   :type-initializer "gtk_print_pages_get_type")
  (:all 0)
  (:current 1)
  (:ranges 2)
  (:selection 3))

#+liber-documentation
(setf (liber:alias-for-symbol 'print-pages)
      "GEnum"
      (liber:symbol-documentation 'print-pages)
 "@version{#2021-12-28}
  @begin{short}
    See the @fun{gtk:print-job-pages} and @fun{gtk:print-settings-print-pages}
    functions.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkPrintPages\" print-pages
  (:export t
   :type-initializer \"gtk_print_pages_get_type\")
  (:all 0)
  (:current 1)
  (:ranges 2)
  (:selection 3))
  @end{pre}
  @begin[code]{table}
    @entry[:all]{All pages.}
    @entry[:current]{Current page.}
    @entry[:ranges]{Range of pages.}
    @entry[:selection]{Selected pages.}
  @end{table}
  @see-class{gtk:print-settings}
  @see-function{gtk:print-settings-print-pages}
  @see-function{gtk:print-job-pages}")

;;; ----------------------------------------------------------------------------
;;; GtkPageSet
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkPageSet" page-set
  (:export t
   :type-initializer "gtk_page_set_get_type")
  (:all 0)
  (:even 1)
  (:odd 2))

#+liber-documentation
(setf (liber:alias-for-symbol 'page-set)
      "GEnum"
      (liber:symbol-documentation 'page-set)
 "@version{#2021-12-28}
  @short{See the @fun{gtk:print-job-page-set} function.}
  @begin{pre}
(gobject:define-g-enum \"GtkPageSet\" page-set
  (:export t
   :type-initializer \"gtk_page_set_get_type\")
  (:all 0)
  (:even 1)
  (:odd 2))
  @end{pre}
  @begin[code]{table}
    @entry[:all]{All pages.}
    @entry[:even]{Even pages.}
    @entry[:odd]{Odd pages.}
  @end{table}
  @see-class{gtk:print-settings}
  @see-function{gtk:print-job-page-set}")

;;; ----------------------------------------------------------------------------
;;; GtkNumberUpLayout
;;; ----------------------------------------------------------------------------

;; TODO: Change the nick names to the short form

(gobject:define-g-enum "GtkNumberUpLayout" number-up-layout
  (:export t
   :type-initializer "gtk_number_up_layout_get_type")
  (:left-to-right-top-to-bottom 0)
  (:left-to-right-bottom-to-top 1)
  (:right-to-left-bottom-to-top 2)
  (:right-to-left-top-to-bottom 3)
  (:top-to-bottom-left-to-right 4)
  (:top-to-bottom-right-to-left 5)
  (:bottom-to-top-left-to-right 6)
  (:bottom-to-top-right-to-left 7))

#+liber-documentation
(setf (liber:alias-for-symbol 'number-up-layout)
      "GEnum"
      (liber:symbol-documentation 'number-up-layout)
 "@version{#2021-12-28}
  @begin{short}
    Used to determine the layout of pages on a sheet when printing multiple
    pages per sheet.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkNubmerUpLayout\" number-up-layout
  (:export t
   :type-initializer \"gtk_number_up_layout_get_type\")
  (:left-to-right-top-to-bottom 0)
  (:left-to-right-bottom-to-top 1)
  (:right-to-left-bottom-to-top 2)
  (:right-to-left-top-to-bottom 3)
  (:top-to-bottom-left-to-right 4)
  (:top-to-bottom-right-to-left 5)
  (:bottom-to-top-left-to-right 6)
  (:bottom-to-top-right-to-left 7))
  @end{pre}
  @begin[code]{table}
    @entry[:left-to-right-top-to-bottom]{@image[layout-lrtb]{}}
    @entry[:left-to-right-bottom-to-top]{@image[layout-lrbt]{}}
    @entry[:right-to-left-bottom-to-top]{@image[layout-rlbt]{}}
    @entry[:right-to-left-top-to-bottom]{@image[layout-rltb]{}}
    @entry[:top-to-bottom-left-to-right]{@image[layout-tblr]{}}
    @entry[:top-to-bottom-right-to-left]{@image[layout-tbrl]{}}
    @entry[:bottom-to-top-left-to-right]{@image[layout-btlr]{}}
    @entry[:bottom-to-top-right-to-left]{@image[layout-btrl]{}}
  @end{table}
  @see-class{gtk:print-settings}
  @see-function{gtk:print-settings-number-up-layout}")

;;; ----------------------------------------------------------------------------
;;; GtkOrdering
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkOrdering" ordering
  (:export t
   :type-initializer "gtk_ordering_get_type")
  (:smaller -1)
  (:equal 0)
  (:larger 1))

#+liber-documentation
(setf (liber:alias-for-symbol 'ordering)
      "GEnum"
      (liber:symbol-documentation 'ordering)
 "@version{2023-9-12}
  @begin{short}
    Describes the way two values can be compared.
  @end{short}
  These values can be used with the @symbol{g:compare-data-func} callback
  function. However, the @symbol{g:compare-data-func} function is allowed to
  return any integer values. For converting such a value to a
  @symbol{gtk:ordering} value, use the @fun{gtk:ordering-from-cmpfunc} function.
  @begin{pre}
(gobject:define-g-enum \"GtkOrdering\" ordering
  (:export t
   :type-initializer \"gtk_ordering_get_type\")
  (:smaller -1)
  (:equal 0)
  (:larger 1))
  @end{pre}
  @begin[code]{table}
    @entry[:smaller]{The first value is smaller than the second.}
    @entry[:equal]{The two values are equal.}
    @entry[:larger]{The first value is larger than the second.}
  @end{table}
  @see-function{g:compare-data-func}
  @see-function{gtk:ordering-from-cmpfunc}")

;;; ----------------------------------------------------------------------------
;;; GtkPageOrientation
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkPageOrientation" page-orientation
  (:export t
   :type-initializer "gtk_page_orientation_get_type")
  :portrait
  :landscape
  :reverse-portrait
  :reverse-landscape)

#+liber-documentation
(setf (liber:alias-for-symbol 'page-orientation)
      "GEnum"
      (liber:symbol-documentation 'page-orientation)
 "@version{#2021-12-28}
  @short{See the @fun{gtk:print-settings-orientation} function.}
  @begin{pre}
(gobject:define-g-enum \"GtkPageOrienation\" page-orientation
  (:export t
   :type-initializer \"gtk_page_orientation_get_type\")
  :portrait
  :landscape
  :reverse-portrait
  :reverse-landscape)
  @end{pre}
  @begin[code]{table}
    @entry[:portrait]{Portrait mode.}
    @entry[:landscape]{Landscape mode.}
    @entry[:reverse-portrait]{Reverse portrait mode.}
    @entry[:reverse-landscape]{Reverse landscape mode.}
  @end{table}
  @see-class{gtk:print-settings}
  @see-function{gtk:print-settings-orientation}")

;;; ----------------------------------------------------------------------------
;;; GtkPrintQuality
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkPrintQuality" print-quality
  (:export t
   :type-initializer "gtk_print_quality_get_type")
  :low
  :normal
  :high
  :draft)

#+liber-documentation
(setf (liber:alias-for-symbol 'print-quality)
      "GEnum"
      (liber:symbol-documentation 'print-quality)
 "@version{#2021-12-28}
  @short{See the @fun{gtk:print-settings-quality} function.}
  @begin{pre}
(gobject:define-g-enum \"GtkPrintQuality\" print-quality
  (:export t
   :type-initializer \"gtk_print_quality_get_type\")
  :low
  :normal
  :high
  :draft)
  @end{pre}
  @begin[code]{table}
    @entry[:low]{Low quality.}
    @entry[:normal]{Normal quality.}
    @entry[:high]{High quality.}
    @entry[:draft]{Draft quality.}
  @end{table}
  @see-class{gtk:print-settings}
  @see-function{gtk:print-settings-quality}")

;;; ----------------------------------------------------------------------------
;;; GtkPrintDuplex
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkPrintDuplex" print-duplex
  (:export t
   :type-initializer "gtk_print_duplex_get_type")
  :simplex
  :horizontal
  :vertical)

#+liber-documentation
(setf (liber:alias-for-symbol 'print-duplex)
      "GEnum"
      (liber:symbol-documentation 'print-duplex)
 "@version{#2021-12-28}
  @short{See the @fun{gtk:print-settings-duplex} function.}
  @begin{pre}
(gobject:define-g-enum \"GtkPrintDuplex\" print-duplex
  (:export t
   :type-initializer \"gtk_print_duplex_get_type\")
  :simplex
  :horizontal
  :vertical)
  @end{pre}
  @begin[code]{table}
    @entry[:simplex]{No duplex.}
    @entry[:horizontal]{Horizontal duplex.}
    @entry[:vertical]{Vertical duplex.}
  @end{table}
  @see-class{gtk:print-settings}
  @see-function{gtk:print-settings-duplex}")

;;; ----------------------------------------------------------------------------
;;; GtkUnit
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkUnit" unit
  (:export t
   :type-initializer "gtk_unit_get_type")
  (:none 0)
  (:pixel 0) ; alias for :none
  (:points 1)
  (:inch 2)
  (:mm 3))

#+liber-documentation
(setf (liber:alias-for-symbol 'unit)
      "GEnum"
      (liber:symbol-documentation 'unit)
 "@version{#2021-12-28}
  @short{Enumeration for dimensions of paper sizes.}
  @begin{pre}
(gobject:define-g-enum \"GtkUnit\" unit
  (:export t
   :type-initializer \"gtk_unit_get_type\")
  (:none 0)
  (:points 1)
  (:inch 2)
  (:mm 3))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No units.}
    @entry[:points]{Dimensions in points.}
    @entry[:inch]{Dimensions in inches.}
    @entry[:mm]{Dimensions in millimeters.}
  @end{table}
  @see-class{gtk:paper-size}")

;;; ----------------------------------------------------------------------------
;;; GtkTreeViewGridLines
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkTreeViewGridLines" tree-view-grid-lines
  (:export t
   :type-initializer "gtk_tree_view_grid_lines_get_type")
  (:none 0)
  (:horizontal 1)
  (:vertical 2)
  (:both 3))

#+liber-documentation
(setf (liber:alias-for-symbol 'tree-view-grid-lines)
      "GEnum"
      (liber:symbol-documentation 'tree-view-grid-lines)
 "@version{#2021-12-28}
  @begin{short}
    Used to indicate which grid lines to draw in a tree view.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkTreeViewGridLines\" tree-view-grid-lines
  (:export t
   :type-initializer \"gtk_tree_view_grid_lines_get_type\")
  (:none 0)
  (:horizontal 1)
  (:vertical 2)
  (:both 3))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No grid lines.}
    @entry[:horizontal]{Horizontal grid lines.}
    @entry[:vertical]{Vertical grid lines.}
    @entry[:both]{Horizontal and vertical grid lines.}
  @end{table}
  @see-class{gtk:tree-view}")

;;; ----------------------------------------------------------------------------
;;; GtkSizeGroupMode
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkSizeGroupMode" size-group-mode
  (:export t
   :type-initializer "gtk_size_group_mode_get_type")
  (:none 0)
  (:horizontal 1)
  (:vertical 2)
  (:both 3))

#+liber-documentation
(setf (liber:alias-for-symbol 'size-group-mode)
      "GEnum"
      (liber:symbol-documentation 'size-group-mode)
 "@version{2023-3-18}
  @begin{short}
    The mode of the size group determines the directions in which the
    @class{gtk:size-group} widget affects the requested sizes of its component
    widgets.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkSizeGroupMode\" size-group-mode
  (:export t
   :type-initializer \"gtk_size_group_mode_get_type\")
  (:none 0)
  (:horizontal 1)
  (:vertical 2)
  (:both 3))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{Group has no effect.}
    @entry[:horizontal]{Group affects horizontal requisition.}
    @entry[:vertical]{Group affects vertical requisition.}
    @entry[:both]{Group affects both horizontal and vertical requisition.}
  @end{table}
  @see-class{gtk:size-group}")

;;; ----------------------------------------------------------------------------
;;; GtkSizeRequestMode
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkSizeRequestMode" size-request-mode
  (:export t
   :type-initializer "gtk_size_request_mode_get_type")
  (:height-for-width 0)
  (:width-for-height 1)
  (:constant-size 2))

#+liber-documentation
(setf (liber:alias-for-symbol 'size-request-mode)
      "GEnum"
      (liber:symbol-documentation 'size-request-mode)
 "@version{#2021-12-28}
  @begin{short}
    Specifies a preference for height-for-width or width-for-height geometry
    management.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkSizeRequestMode\" size-request-mode
  (:export t
   :type-initializer \"gtk_size_request_mode_get_type\")
  (:height-for-width 0)
  (:width-for-height 1)
  (:constant-size 2))
  @end{pre}
  @begin[code]{table}
    @entry[:height-for-width]{Prefer height-for-width geometry management.}
    @entry[:width-for-height]{Prefer width-for-height geometry management.}
    @entry[:constant-size]{Do not trade height-for-width or width-for-height
      geometry management.}
  @end{table}
  @see-class{gtk:widget}
  @see-function{gtk:widget-request-mode}")

;;; ----------------------------------------------------------------------------
;;; GtkScrollablePolicy
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkScrollablePolicy" scrollable-policy
  (:export t
   :type-initializer "gtk_scrollable_policy_get_type")
  (:minimum 0)
  (:natural 1))

#+liber-documentation
(setf (liber:alias-for-symbol 'scrollable-policy)
      "GEnum"
      (liber:symbol-documentation 'scrollable-policy)
 "@version{#2021-12-28}
  @begin{short}
    Defines the policy to be used in a scrollable widget when updating the
    scrolled window adjustments in a given orientation.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkScrollablePolicy\" scrollable-policy
  (:export t
   :type-initializer \"gtk_scrollable_policy_get_type\")
  (:minimum 0)
  (:natural 1))
  @end{pre}
  @begin[code]{table}
    @entry[:minimum]{Scrollable adjustments are based on the minimum size.}
    @entry[:natural]{Scrollable adjustments are based on the natural size.}
  @end{table}
  @see-class{gtk:scrollable}")

;;; ----------------------------------------------------------------------------
;;; GtkStateFlags
;;; ----------------------------------------------------------------------------

(gobject:define-g-flags "GtkStateFlags" state-flags
  (:export t
   :type-initializer "gtk_state_flags_get_type")
  (:normal 0)
  (:active        #.(ash 1 0))
  (:prelight      #.(ash 1 1))
  (:selected      #.(ash 1 2))
  (:insensitive   #.(ash 1 3))
  (:inconsistent  #.(ash 1 4))
  (:focused       #.(ash 1 5))
  (:backdrop      #.(ash 1 6))
  (:dir-ltr       #.(ash 1 7))
  (:dir-rtl       #.(ash 1 8))
  (:link          #.(ash 1 9))
  (:visited       #.(ash 1 10))
  (:checked       #.(ash 1 11))
  (:drop-active   #.(ash 1 12))
  (:focus-visible #.(ash 1 13))
  (:focus-within  #.(ash 1 14)))

#+liber-documentation
(setf (liber:alias-for-symbol 'state-flags)
      "GFlags"
      (liber:symbol-documentation 'state-flags)
 "@version{#2021-12-28}
  @begin{short}
    Describes a widget state.
  @end{short}
  Widget states are used to match the widget against CSS pseudo-classes. Note
  that GTK extends the regular CSS classes and sometimes uses different names.
  @begin{pre}
(gobject:define-g-flags \"GtkStateFlags\" state-flags
  (:export t
   :type-initializer \"gtk_state_flags_get_type\")
  (:normal 0)
  (:active        #.(ash 1 0))
  (:prelight      #.(ash 1 1))
  (:selected      #.(ash 1 2))
  (:insensitive   #.(ash 1 3))
  (:inconsistent  #.(ash 1 4))
  (:focused       #.(ash 1 5))
  (:backdrop      #.(ash 1 6))
  (:dir-ltr       #.(ash 1 7))
  (:dir-rtl       #.(ash 1 8))
  (:link          #.(ash 1 9))
  (:visited       #.(ash 1 10))
  (:checked       #.(ash 1 11))
  (:drop-active   #.(ash 1 12))
  (:focus-visible #.(ash 1 13))
  (:focus-within  #.(ash 1 14)))
  @end{pre}
  @begin[code]{table}
    @entry[:normal]{State during normal operation.}
    @entry[:active]{Widget is active.}
    @entry[:prelight]{Widget has a mouse pointer over it.}
    @entry[:selected]{Widget is selected.}
    @entry[:insensitive]{Widget is insensitive.}
    @entry[:inconsistent]{Widget is inconsistent.}
    @entry[:focused]{Widget has the keyboard focus.}
    @entry[:backdrop]{Widget is in a background toplevel window.}
    @entry[:dir-ltr]{Widget is in left-to-right text direction.}
    @entry[:dir-rtl]{Widget is in right-to-left text direction.}
    @entry[:link]{Widget is a link.}
    @entry[:visited]{The location the widget points to has already been
      visited.}
    @entry[:checked]{Widget is checked.}
    @entry[:drop-active]{Widget is highlighted as a drop target for DND.}
    @entry[:focus-visible]{Widget has the visible focus.}
    @entry[:focus-within]{Widget contains the keyboard focus.}
  @end{table}
  @see-class{gtk:widget}
  @see-class{gtk:style-context}")

;;; ----------------------------------------------------------------------------
;;; GtkBorderStyle
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkBorderStyle" border-style
  (:export t
   :type-initializer "gtk_border_style_get_type")
  :none
  :hidden
  :solid
  :inset
  :outset
  :dotted
  :dashed
  :double
  :groove
  :ridge)

#+liber-documentation
(setf (liber:alias-for-symbol 'border-style)
      "GEnum"
      (liber:symbol-documentation 'border-style)
 "@version{#2021-12-28}
  @begin{short}
    Describes how the border of a UI element should be rendered.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkBorderStyle\" border-style
  (:export t
   :type-initializer \"gtk_border_style_get_type\")
  :none
  :hidden
  :solid
  :inset
  :outset
  :dotted
  :dashed
  :double
  :groove
  :ridge)
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No visible border.}
    @entry[:hidden]{Same as the @code{:none} value.}
    @entry[:solid]{A single line segment.}
    @entry[:inset]{Looks as if the content is sunken into the canvas.}
    @entry[:outset]{Looks as if the content is coming out of the canvas.}
    @entry[:dotted]{A series of round dots.}
    @entry[:dashed]{A series of square-ended dashes.}
    @entry[:double]{Two parrallel lines with some space between them.}
    @entry[:groove]{Looks as if it were carved in the canvas.}
    @entry[:ridge]{Looks as if it were coming out of the canvas.}
  @end{table}
  @see-class{gtk:style-context}")

;;; ----------------------------------------------------------------------------
;;; GtkLevelBarMode
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkLevelBarMode" level-bar-mode
  (:export t
   :type-initializer "gtk_level_bar_mode_get_type")
  (:continuous 0)
  (:discrete 1))

#+liber-documentation
(setf (liber:alias-for-symbol 'level-bar-mode)
      "GEnum"
      (liber:symbol-documentation 'level-bar-mode)
 "@version{#2021-12-28}
  @begin{short}
    Describes how the @class{gtk:level-bar} widget contents should be rendered.
  @end{short}
  Note that this enumeration could be extended with additional modes in the
  future.
  @begin{pre}
(gobject:define-g-enum \"GtkLevelBarMode\" level-bar-mode
  (:export t
   :type-initializer \"gtk_level_bar_mode_get_type\")
  (:continuous 0)
  (:discrete 1))
  @end{pre}
  @begin[code]{table}
    @entry[:continuous]{The level bar has a continuous mode.}
    @entry[:discrete]{The level bar has a discrete mode.}
  @end{table}
  @see-class{gtk:level-bar}")

;;; ----------------------------------------------------------------------------
;;; GtkInputPurpose
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkInputPurpose" input-purpose
  (:export t
   :type-initializer "gtk_input_purpose_get_type")
  (:free-form 0)
  (:alpha 1)
  (:digits 2)
  (:number 3)
  (:phone 4)
  (:url 5)
  (:email 6)
  (:name 7)
  (:password 8)
  (:pin 9)
  (:terminal 10))

#+liber-documentation
(setf (liber:alias-for-symbol 'input-purpose)
      "GEnum"
      (liber:symbol-documentation 'input-purpose)
 "@version{2023-8-29}
  @begin{short}
    Describes primary purpose of the input widget.
  @end{short}
  This information is useful for on-screen keyboards and similar input methods
  to decide which keys should be presented to the user.

  Note that the purpose is not meant to impose a totally strict rule about
  allowed characters, and does not replace input validation. It is fine for an
  on-screen keyboard to let the user override the character set restriction
  that is expressed by the purpose. The application is expected to validate
  the entry contents, even if it specified a purpose.

  The difference between the @code{:digits} and @code{:number} values is that
  the former accepts only digits while the latter also some punctuation, like
  commas or points, plus, minus, and 'e' or 'E' as in 3.14E+000.

  This enumeration may be extended in the future. Input methods should
  interpret unknown values as 'free form'.
  @begin{pre}
(gobject:define-g-enum \"GtkInputPurpose\" input-purpose
  (:export t
   :type-initializer \"gtk_input_purpose_get_type\")
  (:free-form 0)
  (:alpha 1)
  (:digits 2)
  (:number 3)
  (:phone 4)
  (:url 5)
  (:email 6)
  (:name 7)
  (:password 8)
  (:pin 9)
  (:terminal 10))
  @end{pre}
  @begin[code]{table}
    @entry[:free-form]{Allow any character.}
    @entry[:alpha]{Allow only alphabetic characters.}
    @entry[:digits]{Allow only digits.}
    @entry[:number]{Edited field expects numbers.}
    @entry[:phone]{Edited field expects phone number.}
    @entry[:url]{Edited field expects URL.}
    @entry[:email]{Edited field expects email address.}
    @entry[:name]{Edited field expects the name of a person.}
    @entry[:password]{Like @code{:free-form}, but characters are hidden.}
    @entry[:pin]{Like @code{:digits}, but characters are hidden.}
    @entry[:terminal]{Allow any character, in addition to control codes.}
  @end{table}
  @see-class{gtk:entry}
  @see-symbol{gtk:input-hints}")

;;; ----------------------------------------------------------------------------
;;; GtkInputHints
;;; ----------------------------------------------------------------------------

(gobject:define-g-flags "GtkInputHints" input-hints
  (:export t
   :type-initializer "gtk_input_hints_get_type")
  (:none 0)
  (:spellcheck          #.(ash 1 0))
  (:no-spellcheck       #.(ash 1 1))
  (:word-completion     #.(ash 1 2))
  (:lowercase           #.(ash 1 3))
  (:uppercase-chars     #.(ash 1 4))
  (:uppercase-words     #.(ash 1 5))
  (:uppercase-sentences #.(ash 1 6))
  (:inhibit-osk         #.(ash 1 7))
  (:vertical-writing    #.(ash 1 8))
  (:emoji               #.(ash 1 9))
  (:no-emoji            #.(ash 1 10))
  (:private             #.(ash 1 11)))

#+liber-documentation
(setf (liber:alias-for-symbol 'input-hints)
      "GFlags"
      (liber:symbol-documentation 'input-hints)
 "@version{2023-8-29}
  @begin{short}
    Describes hints that might be taken into account by input methods or
    applications.
  @end{short}
  Note that input methods may already tailor their behaviour according to the
  @symbol{gtk:input-purpose} value of the entry.

  Some common sense is expected when using these flags - mixing
  @code{:lowercase} with any of the uppercase hints makes no sense.

  This flags may be extended in the future. Input methods should ignore
  unknown values.
  @begin{pre}
(gobject:define-g-flags \"GtkInputHints\" input-hints
  (:export t
   :type-initializer \"gtk_input_hints_get_type\")
  (:none 0)
  (:spellcheck          #.(ash 1 0))
  (:no-spellcheck       #.(ash 1 1))
  (:word-completion     #.(ash 1 2))
  (:lowercase           #.(ash 1 3))
  (:uppercase-chars     #.(ash 1 4))
  (:uppercase-words     #.(ash 1 5))
  (:uppercase-sentences #.(ash 1 6))
  (:inhibit-osk         #.(ash 1 7))
  (:vertical-writing    #.(ash 1 8))
  (:emoji               #.(ash 1 9))
  (:no-emoji            #.(ash 1 10))
  (:private             #.(ash 1 11)))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No special behaviour suggested.}
    @entry[:spellcheck]{Suggest checking for typos.}
    @entry[:no-spellcheck]{Suggest not checking for typos.}
    @entry[:word-completion]{Suggest word completion.}
    @entry[:lowercase]{Suggest to convert all text to lowercase.}
    @entry[:uppercase-chars]{Suggest to capitalize all text.}
    @entry[:uppercase-words]{Suggest to capitalize the first character of each
      word.}
    @entry[:uppercase-sentences]{Suggest to capitalize the first word of each
      sentence.}
    @entry[:inhibit-osk]{Suggest to not show an onscreen keyboard, e.g. for a
      calculator that already has all the keys.}
    @entry[:vertical-writing]{The text is vertical.}
    @entry[:emoji]{Suggest offering Emoji support.}
    @entry[:no-emoji]{Suggest not offering Emoji support.}
    @entry[:private]{Request that the input method should not update
      personalized data (like typing history).}
  @end{table}
  @see-class{gtk:entry}
  @see-symbol{gtk:input-purpose}")

;;; ----------------------------------------------------------------------------
;;; GtkPropagationPhase
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkPropagationPhase" propagation-phase
  (:export t
   :type-initializer "gtk_propagation_phase_get_type")
  (:phase-none 0)
  (:phase-capture 1)
  (:phase-bubble 2)
  (:phase-target 3))

#+liber-documentation
(setf (liber:alias-for-symbol 'propagation-phase)
      "GEnum"
      (liber:symbol-documentation 'propagation-phase)
 "@version{#2021-12-28}
  @begin{short}
    Describes the stage at which events are fed into a
    @class{gtk:event-controller} object.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkPropagationPhase\" propagation-phase
  (:export t
   :type-initializer \"gtk_propagation_phase_get_type\")
  (:phase-none 0)
  (:phase-capture 1)
  (:phase-bubble 2)
  (:phase-target 3))
  @end{pre}
  @begin[code]{table}
    @entry[:phase-none]{Events are not delivered automatically. Those can be
      manually fed through the function @fun{gtk:event-controller-handle-event}.
      This should only be used when full control about when, or whether the
      controller handles the event is needed.}
    @entry[:phase-capture]{Events are delivered in the capture phase. The
      capture phase happens before the bubble phase, runs from the toplevel down
      to the event widget. This option should only be used on containers that
      might possibly handle events before their children do.}
    @entry[:phase-bubble]{Events are delivered in the bubble phase. The bubble
      phase happens after the capture phase, and before the default handlers are
      run. This phase runs from the event widget, up to the toplevel.}
    @entry[:phase-target]{Events are delivered in the default widget event
      handlers, note that widget implementations must chain up on button,
      motion, touch and grab broken handlers for controllers in this phase to
      be run.}
  @end{table}
  @see-class{gtk:event-controller}
  @see-function{gtk:event-controller-handle-event}")

;;; ----------------------------------------------------------------------------
;;; GtkPropagationLimit
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkPropagationLimit" propagation-limit
  (:export t
   :type-initializer "gtk_propagation_limit_get_type")
  :none
  :native)

#+liber-documentation
(setf (liber:alias-for-symbol 'propagation-limit)
      "GEnum"
      (liber:symbol-documentation 'propagation-limit)
 "@version{#2021-12-28}
  @begin{short}
    Describes limits of a @class{gtk:event-controller} object for handling
    events targeting other widgets.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkPropagationLimit\" propagation-limit
  (:export t
   :type-initializer \"gtk_propagation_limit_get_type\")
  :none
  :native)
  @end{pre}
  @begin[code]{table}
    @entry[:none]{Events are handled regardless of what their target is.}
    @entry[:native]{Events are only handled if their target is in the same
      @class{gtk:native} widget as the event controllers widget. Note that some
      event types have two targets (origin and destination).}
  @end{table}
  @see-class{gtk:native}")

;;; ----------------------------------------------------------------------------
;;; GtkEventSequenceState
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkEventSequenceState" event-sequence-state
  (:export t
   :type-initializer "gtk_event_sequence_state_get_type")
  (:none 0)
  (:claimed 1)
  (:denied 2))

#+liber-documentation
(setf (liber:alias-for-symbol 'event-sequence-state)
      "GEnum"
      (liber:symbol-documentation 'event-sequence-state)
 "@version{#2021-12-28}
  @begin{short}
    Describes the state of a @class{gdk:event-sequence} event in a
    @class{gtk:gesture} object.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkEventSequenceState\" event-sequence-state
  (:export t
   :type-initializer \"gtk_event_sequence_state_get_type\")
  (:none 0)
  (:claimed 1)
  (:denied 2))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{The sequence is handled, but not grabbed.}
    @entry[:claimed]{The sequence is handled and grabbed.}
    @entry[:denied]{The sequence is denied.}
  @end{table}
  @see-class{gtk:gesture}
  @see-class{gdk:event-sequence}")

;;; ----------------------------------------------------------------------------
;;; GtkPanDirection
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkPanDirection" pan-direction
  (:export t
   :type-initializer "gtk_pan_direction_get_type")
  :left
  :right
  :up
  :down)

#+liber-documentation
(setf (liber:alias-for-symbol 'pan-direction)
      "GEnum"
      (liber:symbol-documentation 'pan-direction)
 "@version{#2021-12-28}
  @begin{short}
    Describes the panning direction of a @class{gtk:gesture-pan} object.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkPanDirection\" pan-direction
  (:export t
   :type-initializer \"gtk_pan_direction_get_type\")
  :left
  :right
  :up
  :down)
  @end{pre}
  @begin[code]{table}
    @entry[:left]{Panned towards the left.}
    @entry[:right]{Panned towards the right.}
    @entry[:up]{Panned upwards.}
    @entry[:down]{Panned downwards.}
  @end{table}
  @see-class{gtk:gesture-pan}")

;;; ----------------------------------------------------------------------------
;;; GtkShortcutScope
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkShortcutScope" shortcut-scope
  (:export t
   :type-initializer "gtk_shortcut_scope_get_type")
  :local
  :managed
  :global)

#+liber-documentation
(setf (liber:alias-for-symbol 'shortcut-scope)
      "GEnum"
      (liber:symbol-documentation 'shortcut-scope)
 "@version{2023-7-23}
  @begin{short}
    Describes where @class{gtk:shortcut} objects added to the
    @class{gtk:shortcut-controller} object get handled.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkShortcutScope\" shortcut-scope
  (:export t
   :type-initializer \"gtk_shortcut_scope_get_type\")
  :local
  :managed
  :global)
  @end{pre}
  @begin[code]{table}
    @entry[:local]{Shortcuts are handled inside the widget the controller
      belongs to.}
    @entry[:managed]{Shortcuts are handled by the first ancestor that is a
      @class{gtk:shortcut-manager} object.}
    @entry[:global]{Shortcuts are handled by the root widget.}
  @end{table}
  @see-class{gtk:shortcut}
  @see-class{gtk:shortcut-manager}")

;;; ----------------------------------------------------------------------------
;;; GtkPickFlags
;;; ----------------------------------------------------------------------------

(gobject:define-g-flags "GtkPickFlags" pick-flags
  (:export t
   :type-initializer "gtk_pick_flags_get_type")
  (:default 0)
  (:insensitive #.(ash 1 0))
  (:non-targetable #.(ash 1 1)))

#+liber-documentation
(setf (liber:alias-for-symbol 'pick-flags)
      "GFlags"
      (liber:symbol-documentation 'pick-flags)
 "@version{#2021-12-28}
  @begin{short}
    Flags that influence the behavior of the @fun{gtk:widget-pick} function.
  @end{short}
  @begin{pre}
(gobject:define-g-flags \"GtkPickFlags\" pick-flags
  (:export t
   :type-initializer \"gtk_pick_flags_get_type\")
  (:default 0)
  (:insensitive #.(ash 1 0))
  (:non-targetable #.(ash 1 1)))
  @end{pre}
  @begin[code]{table}
    @entry[:default]{The default behavior, include widgets that are
      receiving events.}
    @entry[:insensitive]{Include widgets that are insensitive.}
    @entry[:non-targetable]{Include widgets that are marked as non-targetable.
      See the @slot[gtk:widget]{can-target} property.}
  @end{table}
  @see-function{gtk:widget-pick}
  @see-function{gtk:wiget-can-target}")

;;; ----------------------------------------------------------------------------
;;; GtkConstraintRelation
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkConstraintRelation" constraint-relation
  (:export t
   :type-initializer "gtk_constraint_relation_get_type")
  (:le -1)
  (:eq 0)
  (:ge 1))

#+liber-documentation
(setf (liber:alias-for-symbol 'constraint-relation)
      "GEnum"
      (liber:symbol-documentation 'constraint-relation)
 "@version{#2021-12-28}
  @begin{short}
    The relation between two terms of a constraint.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkConstraintRelation\" constraint-relation
  (:export t
   :type-initializer \"gtk_constraint_relation_get_type\")
  (:le -1)
  (:eq 0)
  (:ge 1))
  @end{pre}
  @begin[code]{table}
    @entry[:le]{Less than, or equal}
    @entry[:eq]{Equal}
    @entry[:ge]{Greater than, or equal}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; GtkConstraintStrength
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkConstraintStrength" constraint-strength
  (:export t
   :type-initializer "gtk_constraint_strength_get_type")
  (:required 1001001000)
  (:strong   1000000000)
  (:medium   1000)
  (:weak     1))

#+liber-documentation
(setf (liber:alias-for-symbol 'constraint-strength)
      "GEnum"
      (liber:symbol-documentation 'constraint-strength)
 "@version{#2021-12-30}
  @begin{short}
    The strength of a constraint, expressed as a symbolic constant.
  @end{short}
  The strength of a @class{gtk:constraint} widget can be expressed with any
  positive integer. The values of this enumeration can be used for readability.
  @begin{pre}
(gobject:define-g-enum \"GtkConstraintStrength\" constraint-strength
  (:export t
   :type-initializer \"gtk_constraint_strength_get_type\")
  (:required 1001001000)
  (:strong   1000000000)
  (:medium   1000)
  (:weak     1))
  @end{pre}
  @begin[code]{table}
    @entry[:required]{The constraint is required towards solving the layout.}
    @entry[:strong]{A strong constraint.}
    @entry[:medium]{A medium constraint.}
    @entry[:weak]{A weak constraint.}
  @end{table}
  @see-class{gtk:constraint}")

;;; ----------------------------------------------------------------------------
;;; GtkConstraintAttribute
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkConstraintAttribute" constraint-attribute
  (:export t
   :type-initializer "gtk_constraint_attribute_get_type")
  :none
  :left
  :right
  :top
  :bottom
  :start
  :end
  :width
  :height
  :center-x
  :center-y
  :baseline)

#+liber-documentation
(setf (liber:alias-for-symbol 'constraint-attribute)
      "GEnum"
      (liber:symbol-documentation 'constraint-attribute)
 "@version{#2021-12-30}
  @begin{short}
    The widget attributes that can be used when creating a
    @class{gtk:constraint} widget.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkConstraintAttribute\" constraint-attribute
  (:export t
   :type-initializer \"gtk_constraint_attribute_get_type\")
  :none
  :left
  :right
  :top
  :bottom
  :start
  :end
  :width
  :height
  :center-x
  :center-y
  :baseline)
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No attribute, used for constant relations.}
    @entry[:left]{The left edge of a widget, regardless of text direction.}
    @entry[:right]{The right edge of a widget, regardless of text direction.}
    @entry[:top]{The top edge of a widget.}
    @entry[:bottom]{The bottom edge of a widget.}
    @entry[:start]{The leading edge of a widget, depending on text direction.
      Equivalent to the @code{:left} value for LTR languages, and the
      @code{:right} value for RTL ones.}
    @entry[:end]{The trailing edge of a widget, depending on text direction.
      Equivalent to the @code{:right} value for LTR languages, and the
      @code{:left} value for RTL ones.}
    @entry[:width]{The width of a widget.}
    @entry[:height]{The height of a widget.}
    @entry[:center-x]{The center of a widget, on the horizontal axis.}
    @entry[:center-y]{The center of a widget, on the vertical axis.}
    @entry[:baseline]{The baseline of a widget.}
  @end{table}
  @see-class{gtk:constraint}")

;;; ----------------------------------------------------------------------------
;;; GtkConstraintVflParserError
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkConstraintVflParserError" constraint-vfl-parser-error
  (:export t
   :type-initializer "gtk_constraint_vfl_parser_error_get_type")
  :invalid-symbol
  :invalid-attribute
  :invalid-view
  :invalid-metric
  :invalid-priority
  :invalid-relation)

#+liber-documentation
(setf (liber:alias-for-symbol 'constraint-vfl-parser-error)
      "GEnum"
      (liber:symbol-documentation 'constraint-vfl-parser-error)
 "@version{#2021-12-30}
  @begin{short}
    Domain for VFL parsing errors.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkConstraintVflParserError\" constraint-vfl-parser-error
  (:export t
   :type-initializer \"gtk_constraint_vfl_parser_error\")
  :invalid-symbol
  :invalid-attribute
  :invalid-view
  :invalid-metric
  :invalid-priority
  :invalid-relation)
  @end{pre}
  @begin[code]{table}
    @entry[:invalid-symbol]{Invalid or unknown symbol.}
    @entry[:invalid-attribute]{Invalid or unknown attribute.}
    @entry[:invalid-view]{Invalid or unknown view.}
    @entry[:invalid-metric]{Invalid or unknown metric.}
    @entry[:invalid-priority]{Invalid or unknown priority.}
    @entry[:invalid-relation]{Invalid or unknown relation.}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; GtkSystemSetting
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkSystemSetting" system-setting
  (:export t
   :type-initializer "gtk_system_setting_get_type")
  :dpi
  :font-name
  :font-config
  :display
  :icon-theme)

#+liber-documentation
(setf (liber:alias-for-symbol 'system-setting)
      "GEnum"
      (liber:symbol-documentation 'system-setting)
 "@version{#2021-12-30}
  @begin{short}
    Values that can be passed to the @code{GtkWidget::system_setting_changed}
    virtual function.
  @end{short}

  The values indicate which system setting has changed. Widgets may need to drop
  caches, or react otherwise.

  Most of the values correspond to @class{gtk:settings} properties.

  More values may be added over time.
  @begin{pre}
(gobject:define-g-enum \"GtkSystemSetting\" system-setting
  (:export t
   :type-initializer \"gtk_system_setting_get_type\")
  :dpi
  :font-name
  :font-config
  :display
  :icon-theme)
  @end{pre}
  @begin[code]{table}
    @entry[:dpi]{The @slot[gtk:settings]{gtk-xft-dpi} setting has changed.}
    @entry[:font-name]{The @slot[gtk:settings]{gtk-font-name} setting has
      changed.}
    @entry[:font-config]{The font configuration has changed in a way that
      requires text to be redrawn. This can be any of the
      @slot[gtk:settings]{gtk-xft-antialias},
      @slot[gtk:settings]{gtk-xft-hinting},
      @slot[gtk:settings]{gtk-xft-hintstyle}
      @slot[gtk:settings]{gtk-xft-rgba} or
      @slot[gtk:settings]{gtk-fontconfig-timestamp} settings.}
    @entry[:display]{The display has changed.}
    @entry[:icon-theme]{The icon theme has changed in a way that requires icons
      to be looked up again.}
  @end{table}
  @see-class{gtk:settings}
  @see-function{gtk:settings-gtk-xft-dpi}
  @see-function{gtk:settings-gtk-font-name}
  @see-function{gtk:settings-gtk-xft-antialias}
  @see-function{gtk:settings-gtk-xft-hinting}
  @see-function{gtk:settings-gtk-xft-hintstyle}
  @see-function{gtk:settings-gtk-xft-rgba}
  @see-function{gtk:settings-gtk-fontconfig-timestamp}")

;;; ----------------------------------------------------------------------------
;;; GtkSymbolicColor
;;; ----------------------------------------------------------------------------

#+gtk-4-6
(gobject:define-g-enum "GtkSymbolicColor" symbolic-color
  (:export t
   :type-initializer "gtk_symbolic_color_get_type")
  (:foreground 0)
  (:error 1)
  (:warning 2)
  (:success 3))

#+(and gtk-4-6 liber-documentation)
(setf (liber:alias-for-symbol 'symbolic-color)
      "GEnum"
      (liber:symbol-documentation 'symbolic-color)
 "@version{#2021-12-30}
  @begin{short}
    The indexes of colors passed to symbolic color rendering, such as the
    @code{GtkSymbolicPaintable::snapshot_symbolic} virtual function.
  @end{short}
  More values may be added over time.
  @begin{pre}
(gobject:define-g-enum \"GtkSymbolicColor\" symbolic-color
  (:export t
   :type-initializer \"gtk_symbolic_color_get_type\")
  (:foreground 0)
  (:error 1)
  (:warning 2)
  (:success 3))
  @end{pre}
  @begin[code]{table}
    @entry[:foreground]{The default foreground color.}
    @entry[:error]{Indication color for errors.}
    @entry[:warning]{Indication color for warnings.}
    @entry[:success]{Indication color for success.}
  @end{table}
  Since: 4.6")

;;; ----------------------------------------------------------------------------
;;; GtkAccessibleRole
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkAccessibleRole" accessible-role
  (:export t
   :type-initializer "gtk_accessible_role_get_type")
  :alert
  :alert-dialog
  :banner
  :button
  :caption
  :cell
  :checkbox
  :column-header
  :combo-box
  :command
  :composite
  :dialog
  :document
  :feed
  :form
  :generic
  :grid
  :grid-cell
  :group
  :heading
  :img
  :input
  :label
  :landmark
  :legend
  :link
  :list
  :list-box
  :list-item
  :log
  :main
  :marquee
  :math
  :meter
  :menu
  :menu-bar
  :menu-item
  :menu-item-checkbox
  :menu-item-radio
  :navigation
  :none
  :note
  :option
  :presentation
  :progress-bar
  :radio
  :radio-group
  :range
  :region
  :row
  :row-group
  :row-header
  :scrollbar
  :search
  :search-box
  :section
  :section-head
  :select
  :separator
  :slider
  :spin-button
  :status
  :structure
  :switch
  :tab
  :table
  :tab-list
  :tab-panel
  :text-box
  :time
  :timer
  :toolbar
  :tooltip
  :tree
  :tree-grid
  :tree-item
  :widget
  :window
  #+gtk-4-10
  :toggle-button
  #+gtk-4-12
  :application)

#+liber-documentation
(setf (liber:alias-for-symbol 'accessible-role)
      "GEnum"
      (liber:symbol-documentation 'accessible-role)
 "@version{#2021-12-30}
  @begin{short}
    The accessible role for a @class{gtk:accessible} implementation.
  @end{short}
  Abstract roles are only used as part of the ontology. Application developers
  must not use abstract roles in their code.
  @begin{pre}
(gobject:define-g-enum \"GtkAccessibleRole\" accessible-role
  (:export t
   :type-initializer \"gtk_accessible_role_get_type\")
  :alert
  :alert-dialog
  :banner
  :button
  :caption
  :cell
  :checkbox
  :column-header
  :combo-box
  :command
  :composite
  :dialog
  :document
  :feed
  :form
  :generic
  :grid
  :grid-cell
  :group
  :heading
  :img
  :input
  :label
  :landmark
  :legend
  :link
  :list
  :list-box
  :list-item
  :log
  :main
  :marquee
  :math
  :meter
  :menu
  :menu-bar
  :menu-item
  :menu-item-checkbox
  :menu-item-radio
  :navigation
  :none
  :note
  :option
  :presentation
  :progress-bar
  :radio
  :radio-group
  :range
  :region
  :row
  :row-group
  :row-header
  :scrollbar
  :search
  :search-box
  :section
  :section-head
  :select
  :separator
  :slider
  :spin-button
  :status
  :structure
  :switch
  :tab
  :table
  :tab-list
  :tab-panel
  :text-box
  :time
  :timer
  :toolbar
  :tooltip
  :tree
  :tree-grid
  :tree-item
  :widget
  :window
  #+gtk-4-10
  :toggle-button
  #+gtk-4-12
  :application)
  @end{pre}
  @begin[code]{table}
    @entry[:alert]{An element with important, and usually time-sensitive,
      information.}
    @entry[:alert-dialog]{ A type of dialog that contains an alert message.}
    @entry[:banner]{Unused}
    @entry[:button]{An input element that allows for user-triggered actions
      when clicked or pressed.}
    @entry[:caption]{Unused}
    @entry[:cell]{Unused}
    @entry[:checkbox]{A checkable input element that has three possible values:
      \"true\", \"false\", or \"mixed\".}
    @entry[:column-header]{A header in a columned list.}
    @entry[:combo-box]{An input that controls another element, such as a list
      or a grid, that can dynamically pop up to help the user set the value of
      the input.}
    @entry[:command]{Abstract role.}
    @entry[:composite]{Abstract role.}
    @entry[:dialog]{A dialog is a window that is designed to interrupt the
      current processing of an application in order to prompt the user to enter
      information or require a response.}
    @entry[:document]{Unused}
    @entry[:feed]{Unused}
    @entry[:form]{Unused}
    @entry[:generic]{Unused}
    @entry[:grid]{A grid of items.}
    @entry[:grid-cell]{An item in a grid or tree grid.}
    @entry[:group]{An element that groups multiple widgets. GTK uses this role
      for various containers, like the @class{gtk:box}, @class{gtk:viewport},
      and @class{gtk:header-bar} widgets.}
    @entry[:heading]{Unused}
    @entry[:img]{An image.}
    @entry[:input]{Abstract role.}
    @entry[:label]{A visible name or caption for a user interface component.}
    @entry[:landmark]{Abstract role.}
    @entry[:legend]{Unused}
    @entry[:link]{A clickable link.}
    @entry[:list]{A list of items.}
    @entry[:list-box]{Unused}
    @entry[:list-item]{An item in a list.}
    @entry[:log]{Unused}
    @entry[:main]{Unused}
    @entry[:marquee]{Unused}
    @entry[:math]{Unused}
    @entry[:meter]{An element that represents a value within a known range.}
    @entry[:menu]{A menu.}
    @entry[:menu-bar]{A menubar.}
    @entry[:menu-item]{An item in a menu.}
    @entry[:menu-item-checkbox]{A check item in a menu.}
    @entry[:menu-item-radio]{A radio item in a menu.}
    @entry[:navigation]{Unused}
    @entry[:none]{An element that is not represented to accessibility
      technologies.}
    @entry[:note]{Unused}
    @entry[:option]{Unused}
    @entry[:presentation]{An element that is not represented to accessibility
      technologies.}
    @entry[:progress-bar]{An element that displays the progress status for tasks
      that take a long time.}
    @entry[:radio]{A checkable input in a group of radio roles, only one of
      which can be checked at a time.}
    @entry[:radio-group]{Unused}
    @entry[:range]{Abstract role.}
    @entry[:region]{Unused}
    @entry[:row]{A row in a columned list.}
    @entry[:row-group]{Unused}
    @entry[:row-header]{Unused}
    @entry[:scrollbar]{A graphical object that controls the scrolling of content
      within a viewing area, regardless of whether the content is fully
      displayed within the viewing area.}
    @entry[:search]{Unused}
    @entry[:search-box]{A type of textbox intended for specifying search
      criteria.}
    @entry[:section]{Abstract role.}
    @entry[:section-head]{Abstract role.}
    @entry[:select]{Abstract role.}
    @entry[:separator]{A divider that separates and distinguishes sections of
      content or groups of menuitems.}
    @entry[:slider]{A user input where the user selects a value from within a
      given range.}
    @entry[:spin-button]{A form of range that expects the user to select from
      among discrete choices.}
    @entry[:status]{Unused}
    @entry[:structure]{Abstract role.}
    @entry[:switch]{A type of checkbox that represents on/off values, as opposed
      to checked/unchecked values.}
    @entry[:tab]{An item in a list of tab used for switching pages.}
    @entry[:table]{Unused}
    @entry[:tab-list]{A list of tabs for switching pages.}
    @entry[:tab-panel]{A page in a notebook or stack.}
    @entry[:text-box]{A type of input that allows free-form text as its value.}
    @entry[:time]{Unused}
    @entry[:timer]{Unused}
    @entry[:toolbar]{Unused}
    @entry[:tooltip]{Unused}
    @entry[:tree]{Unused}
    @entry[:tree-grid]{A treeview-like, columned list.}
    @entry[:tree-item]{Unused}
    @entry[:widget]{An interactive component of a graphical user interface. This
      is the role that GTK uses by default for widgets.}
    @entry[:window]{An application window.}
    @entry[:toggle-button]{A type of push button which stays pressed until
      depressed by a second activation. Since: 4.10}
    @entry[:application]{A toplevel element of a graphical user interface. This
      is the role that GTK uses by default for windows. Since 4.12}
  @end{table}
  @see-class{gtk:accessible}")

;;; ----------------------------------------------------------------------------
;;; GtkAccessibleState
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkAccessibleState" accessible-state
  (:export t
   :type-initializer "gtk_accessible_state_get_type")
   :busy
   :checked
   :disabled
   :expanded
   :hidden
   :invalid
   :pressed
   :selected
   #+gtk-4-12
   :visited)

#+liber-documentation
(setf (liber:alias-for-symbol 'accessible-state)
      "GEnum"
      (liber:symbol-documentation 'accessible-state)
 "@version{2023-11-4}
  @begin{short}
    The possible accessible states of a @class{gtk:accessible} widget.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkAccessibleState\" gtk:accessible-state
  (:export t
   :type-initializer \"gtk_accessible_state_get_type\")
   :busy
   :checked
   :disabled
   :expanded
   :hidden
   :invalid
   :pressed
   :selected
   #+gtk-4-12
   :visited)
  @end{pre}
  @begin[code]{table}
    @entry[:busy]{A \"busy\" state. This state has boolean values.}
    @entry[:checked]{A \"checked\" state. Indicates the current state of a
      @class{gtk:check-button} widget.
      Value type: @symbol{gtk:accessible-tristate} enumeration}
    @entry[:disabled]{A \"disabled\" state. Corresponds to the
      @slot[gtk:widget]{sensitive} property on the @class{gtk:widget} widget. It
      indicates a UI element that is perceivable, but not editable or operable.
      Value type: boolean}
    @entry[:expanded]{An \"expanded\" state. Corresponds to the
      @slot[gtk:expander]{expanded} property on the @class{gtk:expander} widget.
      Value type: boolean or undefined}
    @entry[:hidden]{A \"hidden\" state. Corresponds to the
      @slot[gtk:widget]{visible} property on the @class{gtk:widget} widget. You
      can use this state explicitly on UI elements that should not be exposed to
      an assistive technology. See also the @code{:disabled} value.
      Value type: boolean}
    @entry[:invalid]{An \"invalid\" state. Set when a widget is showing an
      error. Value type: @symbol{gtk:accessible-invalid-state} enumeration}
    @entry[:pressed]{A \"pressed\" state. Indicates the current state of a
      @class{gtk:toggle-button} widget.
      Value type: @symbol{gtk:accessible-tristate} enumeration}
    @entry[:selected]{A \"selected\" state. Set when a widget is selected.
      Value type: boolean or undefined}
    @entry[:visited]{Indicates that a widget with the @code{:link} role has 
      been visited. Value type: boolean. Since 4.12}
  @end{table}
  @see-class{gtk:accessible}")

;;; ----------------------------------------------------------------------------
;;; GtkAccessibleProperty
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkAccessibleProperty" accessible-property
  (:export t
   :type-initializer "gtk_accessible_property_get_type")
  :autocomplete
  :description
  :has-popup
  :key-shortcuts
  :label
  :level
  :modal
  :multi-line
  :multi-selectable
  :orientation
  :placeholder
  :read-only
  :required
  :role-description
  :sort
  :value-max
  :value-min
  :value-now
  :value-text)

#+liber-documentation
(setf (liber:alias-for-symbol 'accessible-property)
      "GEnum"
      (liber:symbol-documentation 'accessible-property)
 "@version{#2022-1-3}
  @begin{short}
    The possible accessible properties of a @class{gtk:accessible} widget.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkAccessibleProperty\" accessible-property
  (:export t
   :type-initializer \"gtk_accessible_property_get_type\")
  :autocomplete
  :description
  :has-popup
  :key-shortcuts
  :label
  :level
  :modal
  :multi-line
  :multi-selectable
  :orientation
  :placeholder
  :read-only
  :required
  :role-description
  :sort
  :value-max
  :value-min
  :value-now
  :value-text)
  @end{pre}
  @begin[code]{table}
    @entry[:auto-complete]{Indicates whether inputting text could trigger
      display of one or more predictions of the user's intended value for a
      combobox, searchbox, or textbox and specifies how predictions would be
      presented if they were made.
      Value type: @symbol{gtk:accessible-autocomplete} enumeration}
    @entry[:description]{Defines a string value that describes or annotates the
      current element. Value type: string}
    @entry[:has-popup]{Indicates the availability and type of interactive popup
      element, such as menu or dialog, that can be triggered by an element.}
    @entry[:key-shortcuts]{Indicates keyboard shortcuts that an author has
      implemented to activate or give focus to an element. Value type: string}
    @entry[:label]{Defines a string value that labels the current element.
      Value type: string}
    @entry[:level]{Defines the hierarchical level of an element within a
      structure. Value type: integer}
    @entry[:modal]{Indicates whether an element is modal when displayed. Value
      type: boolean}
    @entry[:multi-line]{Indicates whether a text box accepts multiple lines of
      input or only a single line. Value type: boolean}
    @entry[:multi-selectable]{Indicates that the user may select more than one
      item from the current selectable descendants. Value type: boolean}
    @entry[:orientation]{Indicates whether the orientation of the element is
      horizontal, vertical, or unknown/ambiguous. Value type:
      @class{gtk:orientation} enumeration}
    @entry[:placeholder]{Defines a short hint (a word or short phrase) intended
      to aid the user with data entry when the control has no value. A hint
      could be a sample value or a brief description of the expected format.
      Value type: string}
    @entry[:read-only]{Indicates that the element is not editable, but is
      otherwise operable. Value type: boolean}
    @entry[:required]{Indicates that user input is required on the element
      before a form may be submitted. Value type: boolean}
    @entry[:role-description]{Defines a human-readable, author-localized
      description for the role of an element. Value type: string}
    @entry[:sort]{Indicates if items in a table or grid are sorted in ascending
      or descending order. Possible property values are in the
      @symbol{gtk:accessible-sort} enumeration. Value type:
      @symbol{gtk:accessible-sort} enumeration}
    @entry[:value-max]{Defines the maximum allowed value for a range widget.
      Value type: double}
    @entry[:value-min]{Defines the minimum allowed value for a range widget.
      Value type: double}
    @entry[:value-now]{Defines the current value for a range widget.
      Value type: double}
    @entry[:value-text]{Defines the human readable text alternative of
      aria-valuenow for a range widget. Value type: string}
  @end{table}
  @see-class{gtk:accessible}")

;;; ----------------------------------------------------------------------------
;;; GtkAccessibleRelation
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkAccessibleRelation" accessible-relation
  (:export t
   :type-initializer "gtk_accessible_relation_get_type")
  :active-descendant
  :col-count
  :col-index
  :col-index-text
  :col-span
  :controls
  :described-by
  :details
  :error-message
  :flow-to
  :labelled-by
  :owns
  :pos-in-set
  :row-count
  :row-index
  :row-index-text
  :row-span
  :set-size)

#+liber-documentation
(setf (liber:alias-for-symbol 'accessible-relation)
      "GEnum"
      (liber:symbol-documentation 'accessible-relation)
 "@version{#2022-1-3}
  @begin{short}
    The possible accessible relations of a @class{gtk:accessible} widget.
  @end{short}
  Accessible relations can be references to other widgets, integers or strings.
  @begin{pre}
(gobject:define-g-enum \"GtkAccessibleRelation\" accessible-relation
  (:export t
   :type-initializer \"gtk_accessible_relation_get_type\")
  :active-descendant
  :col-count
  :col-index
  :col-index-text
  :col-span
  :controls
  :described-by
  :details
  :error-message
  :flow-to
  :labelled-by
  :owns
  :pos-in-set
  :row-count
  :row-index
  :row-index-text
  :row-span
  :set-size)
  @end{pre}
  @begin[code]{table}
    @entry[:active-descendant]{Identifies the currently active element when
      focus is on a composite widget, combobox, textbox, group, or application.
      Value type: reference}
    @entry[:col-count]{Defines the total number of columns in a table, grid, or
      treegrid. Value type: integer}
    @entry[:col-index]{Defines a column index of the element or position with
      respect to the total number of columns within a table, grid, or treegrid.
      Value type: integer}
    @entry[:col-index-text]{Defines a human readable text alternative of the
      @code{:col-index} value. Value type: string}
    @entry[:col-span]{Defines the number of columns spanned by a cell or
      gridcell within a table, grid, or treegrid. Value type: integer}
    @entry[:controls]{Identifies the element (or elements) whose contents or
      presence are controlled by the current element. Value type: reference}
    @entry[:described-by]{Identifies the element (or elements) that describes
      the object. Value type: reference}
    @entry[:details]{Identifies the element (or elements) that provide
      additional information related to the object. Value type: reference}
    @entry[:error-message]{Identifies the element that provides an error message
      for an object. Value type: reference}
    @entry[:flow-to]{Identifies the next element (or elements) in an alternate
      reading order of content which, at the user's discretion, allows assistive
      technology to override the general default of reading in document source
      order. Value type: reference}
    @entry[:labelled-by]{Identifies the element (or elements) that labels the
      current element. Value type: reference}
    @entry[:owns]{Identifies an element (or elements) in order to define a
      visual, functional, or contextual parent/child relationship between
      elements where the widget hierarchy cannot be used to represent the
      relationship. Value type: reference}
    @entry[:pos-in-set]{Defines a number or position of the element in the
      current set of listitems or treeitems. Value type: integer}
    @entry[:row-count]{Defines the total number of rows in a table, grid, or
      treegrid. Value type: integer}
    @entry[:row-index]{Defines a row index or position of the element with
      respect to the total number of rows within a table, grid, or treegrid.
      Value type: integer}
    @entry[:row-index-text]{Defines a human readable text alternative of
      aria-rowindex. Value type: string}
    @entry[:row-span]{Defines the number of rows spanned by a cell or gridcell
      within a table, grid, or treegrid. Value type: integer}
    @entry[:set-size]{Defines the number of items in the current set of
      listitems or treeitems. Value type: integer}
  @end{table}
  @see-class{gtk:accessible}")

;;; ----------------------------------------------------------------------------
;;; GtkAccessibleTristate
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkAccessibleTristate" accessible-tristate
  (:export t
   :type-initializer "gtk_accessible_tristate_get_type")
  :false
  :true
  :mixed)

#+liber-documentation
(setf (liber:alias-for-symbol 'accessible-tristate)
      "GEnum"
      (liber:symbol-documentation 'accessible-tristate)
 "@version{#2022-1-3}
  @begin{short}
    The possible values for the @code{:pressed} accessible state.
  @end{short}
  Note that the @code{:false} and @code{:true} values have the same values as
  @em{false} and @em{true}.
  @begin{pre}
(gobject:define-g-enum \"GtkAccessibleTristate\" accessible-tristate
  (:export t
   :type-initializer \"gtk_accessible_tristate_get_type\")
  :false
  :true
  :mixed)
  @end{pre}
  @begin[code]{table}
    @entry[:false]{The state is \"false\".}
    @entry[:true]{The state is \"true\".}
    @entry[:mixed]{The state is \"mixed\".}
  @end{table}
  @see-symbol{gtk:accessible-state}")

;;; ----------------------------------------------------------------------------
;;; GtkAccessibleInvalidState
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkAccessibleInvalidState" accessible-invalid-state
  (:export t
   :type-initializer "gtk_accessible_invalid_state_get_type")
  :false
  :true
  :grammar
  :spelling)

#+liber-documentation
(setf (liber:alias-for-symbol 'accessible-invalid-state)
      "GEnum"
      (liber:symbol-documentation 'accessible-invalid-state)
 "@version{#2022-1-3}
  @begin{short}
    The possible values for the @code{:invalid} accessible state.
  @end{short}
  Note that the @code{:false} and @code{:true} values have the same values
  as @em{false} and @em{true}.
  @begin{pre}
(gobject:define-g-enum \"GtkAccessibleInvalidState\" accessible-invalid-state
  (:export t
   :type-initializer \"gtk_accessible_invalid_state_get_type\")
  :false
  :true
  :grammar
  :spelling)
  @end{pre}
  @begin[code]{table}
    @entry[:false]{There are no detected errors in the value.}
    @entry[:true]{The value entered by the user has failed validation.}
    @entry[:grammar]{A grammatical error was detected.}
    @entry[:spelling]{A spelling error was detected.}
  @end{table}
  @see-symbol{gtk:accessible-state}")

;;; ----------------------------------------------------------------------------
;;; GtkAccessibleAutocomplete
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkAccessibleAutocomplete" accessible-autocomplete
  (:export t
   :type-initializer "gtk_accessible_autocomplete_get_type")
  :none
  :inline
  :list
  :both)

#+liber-documentation
(setf (liber:alias-for-symbol 'accessible-autocomplete)
      "GEnum"
      (liber:symbol-documentation 'accessible-autocomplete)
 "@version{#2022-1-3}
  @begin{short}
    The possible values for the @code{:autocomplete} accessible property.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkAccessibleAutocomplete\" accessible-autocomplete
  (:export t
   :type-initializer \"gtk_accessible_autocomplete_get_type\")
  :none
  :inline
  :list
  :both)
  @end{pre}
  @begin[code]{table}
    @entry[:none]{Automatic suggestions are not displayed.}
    @entry[:inline]{When a user is providing input, text suggesting one way to
      complete the provided input may be dynamically inserted after the caret.}
    @entry[:list]{When a user is providing input, an element containing a
      collection of values that could complete the provided input may be
      displayed.}
    @entry[:both]{When a user is providing input, an element containing a
      collection of values that could complete the provided input may be
      displayed. If displayed, one value in the collection is automatically
      selected, and the text needed to complete the automatically selected value
      appears after the caret in the input.}
  @end{table}
  @see-symbol{gtk:accessible-property}")

;;; ----------------------------------------------------------------------------
;;; GtkAccessibleSort
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkAccessibleSort" accessible-sort
  (:export t
   :type-initializer "gtk_accessible_sort_get_type")
  :none
  :ascending
  :descending
  :other)

#+liber-documentation
(setf (liber:alias-for-symbol 'accessible-sort)
      "GEnum"
      (liber:symbol-documentation 'accessible-sort)
 "@version{#2022-1-3}
  @begin{short}
    The possible values for the @code{:sort} accessible property.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkAccessibleSort\" accessible-sort
  (:export t
   :type-initializer \"gtk_accessible_sort_get_type\")
  :none
  :ascending
  :descending
  :other)
  @end{pre}
  @begin[code]{table}
    @entry[:none]{There is no defined sort applied to the column.}
    @entry[:ascending]{Items are sorted in ascending order by this column.}
    @entry[:descending]{Items are sorted in descending order by this column.}
    @entry[:other]{A sort algorithm other than ascending or descending has been
      applied.}
  @end{table}
  @see-symbol{gtk:accessible-property}")

;;; --- End of file gtk4.enumerations.lisp -------------------------------------
