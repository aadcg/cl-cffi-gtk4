;;; ----------------------------------------------------------------------------
;;; gtk4.shortcut-action.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.6 and modified to document the Lisp binding to the GTK library.
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
;;; GtkShortcutAction
;;;
;;;     Tracking if shortcuts should be activated
;;;
;;; Types and Values
;;;
;;;     GtkShortcutActionFlags
;;;     GtkShortcutAction
;;;     GtkNothingAction
;;;     GtkCallbackAction
;;;     GtkMnemonicAction
;;;     GtkActivateAction
;;;     GtkSignalAction
;;;     GtkNamedAction
;;;
;;; Functions
;;;
;;;     GtkShortcutFunc
;;;
;;;     gtk_shortcut_action_to_string
;;;     gtk_shortcut_action_print
;;;     gtk_shortcut_action_parse_string
;;;     gtk_shortcut_action_activate
;;;
;;;     gtk_nothing_action_get
;;;
;;;     gtk_callback_action_new
;;;
;;;     gtk_mnemonic_action_get
;;;
;;;     gtk_activate_action_get
;;;
;;;     gtk_signal_action_new
;;;     gtk_signal_action_get_signal_name                  Accessor
;;;
;;;     gtk_named_action_new
;;;     gtk_named_action_get_action_name                   Accessor
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GtkShortcutAction
;;;         ├── GtkSignalAction
;;;         ├── GtkNothingAction
;;;         ├── GtkNamedAction
;;;         ╰── GtkCallbackAction
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; enum GtkShortcutActionFlags
;;; ----------------------------------------------------------------------------

(gobject:define-g-flags "GtkShortcutActionFlags" shortcut-action-flags
  (:export t
   :type-initializer "gtk_shortcut_action_flags_get_type")
  (:exclusive #.(ash 1 0)))

#+liber-documentation
(setf (liber:alias-for-symbol 'shortcut-action-flags)
      "GFlags"
      (liber:symbol-documentation 'shortcut-action-flags)
 "@version{#2022-8-25}
  @begin{short}
    List of flags that can be passed to action activation.
  @end{short}
  More flags may be added in the future.
  @begin{pre}
(gobject:define-g-enum \"GtkShortcutActionFlags\" shortcut-action-flags
  (:export t
   :type-initializer \"gtk_shortcut_action_flags_get_type\")
  (:exclusive #.(ash 1 0)))
  @end{pre}
  @begin[code]{table}
    @entry[:exclusive]{The action is the only action that can be activated. If
      this flag is not set, a future activation may select a different action.}
  @end{table}
  @see-class{gtk:shortcut-action}")

;;; ----------------------------------------------------------------------------
;;; GtkShortcutAction
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkShortcutAction" shortcut-action
  (:superclass g:object
   :export t
   :interfaces nil
   :type-initializer "gtk_shortcut_action_get_type")
  nil)

#+liber-documentation
(setf (documentation 'shortcut-action 'type)
 "@version{#2022-8-25}
  @begin{short}
    The @sym{gtk:shortcut-action} object is the object used to describe what a
    @class{gtk:shortcut} object should do when triggered.
  @end{short}
  To activate a @sym{gtk:shortcut-action} object manually, the
  @fun{gtk:shortcut-action-activate} function can be called.

  The @sym{gtk:shortcut-action} implementation contain functions that allow
  easy presentation to end users as well as being printed for debugging.

  All @sym{gtk:shortcut-action} objects are immutable, you can only specify
  their properties during construction. If you want to change an action, you
  have to replace it with a new one. If you need to pass arguments to an action,
  these are specified by the higher-level @class{gtk:shortcut} object.

  GTK provides various actions:
  @begin[code]{table}
    @entry[GtkMnemonicAction]{A shortcut action that calls the
      @fun{gtk:widget-mnemonic-activate} function.}
    @entry[GtkCallbackAction]{A shortcut action that invokes a given callback.}
    @entry[GtkSignalAction]{A shortcut action that emits a given signal.}
    @entry[GtkActivateAction]{A shortcut action that calls the
      @fun{gtk:widget-activate} function.}
    @entry[GtkNamedAction]{A shortcut action that calls the
      @fun{gtk:widget-activate-action} function.}
    @entry[GtkNothingAction]{A shortcut action that does nothing.}
  @end{table}
  @see-class{gtk:shortcut}")

;;; ----------------------------------------------------------------------------
;;; GtkNothingAction
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkNothingAction" nothing-action
  (:superclass shortcut-action
   :export t
   :interfaces nil
   :type-initializer "gtk_nothing_action_get_type")
  nil)

#+liber-documentation
(setf (documentation 'nothing-action 'type)
 "@version{#2022-8-25}
  @begin{short}
    A @class{gtk:shortcut-action} object that does nothing.
  @end{short}
  @see-class{gtk:shortcut-action}")

;;; ----------------------------------------------------------------------------
;;; GtkCallbackAction
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkCallbackAction" callback-action
  (:superclass shortcut-action
   :export t
   :interfaces nil
   :type-initializer "gtk_callback_action_get_type")
  nil)

#+liber-documentation
(setf (documentation 'callback-action 'type)
 "@version{#2022-8-25}
  @begin{short}
    A @class{gtk:shortcut-action} object that invokes a callback.
  @end{short}
  @see-constructor{gtk:callback-action-new}
  @see-class{gtk:shortcut-action}")

;;; ----------------------------------------------------------------------------
;;; GtkMnemonicAction
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkMnemonicAction" mnemonic-action
  (:superclass shortcut-action
   :export t
   :interfaces nil
   :type-initializer "gtk_mnemonic_action_get_type")
  nil)

#+liber-documentation
(setf (documentation 'mnemonic-action 'type)
 "@version{#2022-8-25}
  @begin{short}
    A @class{gtk:shortcut-action} that calls the
    @fun{gtk:widget-mnemonic-activate} function.
  @end{short}
  @see-class{gtk:shortcut-action}
  @see-function{gtk:widget-mnemonic-activate}")

;;; ----------------------------------------------------------------------------
;;; GtkActivateAction
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkActivateAction" activate-action
  (:superclass shortcut-action
   :export t
   :interfaces nil
   :type-initializer "gtk_activate_action_get_type")
  nil)

#+liber-documentation
(setf (documentation 'activate-action 'type)
 "@version{#2022-8-25}
  @begin{short}
    A @class{gtk:shortcut-action} that calls the @fun{gtk:widget-activate}
    function.
  @end{short}
  @see-class{gtk:shortcut-action}
  @see-function{gtk:widget-activate}")

;;; ----------------------------------------------------------------------------
;;; GtkSignalAction
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkSignalAction" signal-action
  (:superclass shortcut-action
   :export t
   :interfaces nil
   :type-initializer "gtk_signal_action_get_type")
  ((signal-name
    signal-action-signal-name
    "signal-name" "gchararray" t nil)))

#+liber-documentation
(setf (documentation 'signal-action 'type)
 "@version{#2022-8-25}
  @begin{short}
    A @class{gtk:shortcut-action} that emits a signal.
  @end{short}
  Signals that are used in this way are referred to as keybinding signals,
  and they are expected to be defined with the @code{G_SIGNAL_ACTION} flag.
  @see-slot{gtk:signal-action-signal-name}
  @see-constructor{gtk:signal-action-new}
  @see-class{gtk:shortcut-action}")

;;; --- signal-action-signal-name ------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "signal-name"
                                               'signal-action) t)
 "The @code{signal-name} property of type @code{:string}
  (Read / Write / Construct only) @br{}
  The name of the signal to emit.")

#+liber-documentation
(setf (liber:alias-for-function 'signal-action-signal-name)
      "Accessor"
      (documentation 'signal-action-signal-name 'function)
 "@version{#2022-8-25}
  @syntax[]{(gtk:signal-action-signal-name object) => name)}
  @syntax[]{(setf (gtk:signal-action-signal-name object) name)}
  @argument[object]{a @class{gtk:signal-action} object}
  @argument[name]{a string with the name of the signal to emit}
  @begin{short}
    Accessor of the @slot[gtk:signal-action]{signal-name} slot of the
    @class{gtk:signal-action} class.
  @end{short}
  The @sym{gtk:signal-action-signal-name} function returns the name of the
  signal that will be emitted.
  @see-class{gtk:signal-action}")

;;; ----------------------------------------------------------------------------
;;; GtkNamedAction
;;; ----------------------------------------------------------------------------

(gobject:define-g-object-class "GtkNamedAction" named-action
  (:superclass shortcut-action
   :export t
   :interfaces nil
   :type-initializer "gtk_named_action_get_type")
  ((action-name
    named-action-action-name
    "action-name" "gchararray" t nil)))

#+liber-documentation
(setf (documentation 'named-action 'type)
 "@version{#2022-8-25}
  @begin{short}
    A @class{gtk:shortcut-action} that activates an action by name.
  @end{short}
  @see-slot{gtk:named-action-action-name}
  @see-constructor{gtk:named-action-new}
  @see-class{gtk:shortcut-action}")

;;; --- named-action-action-name -------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "action-name"
                                               'named-action) t)
 "The @code{action-name} property of type @code{:string}
  (Read / Write / Construct only) @br{}
  The name of the action to activate.")

#+liber-documentation
(setf (liber:alias-for-function 'named-action-action-name)
      "Accessor"
      (documentation 'named-action-action-name 'function)
 "@version{#2022-8-25}
  @syntax[]{(gtk:named-action-action-name object) => name)}
  @syntax[]{(setf (gtk:named-action-action-name object) name)}
  @argument[object]{a @class{gtk:named-action} object}
  @argument[name]{a string with the name of the actopm that will be activated}
  @begin{short}
    Accessor of the @slot[gtk:named-action]{action-name} slot of the
    @class{gtk:named-action} class.
  @end{short}
  The @sym{gtk:named-action-action-name} function returns the name of the
  action that will be activated.
  @see-class{gtk:named-action}")

;;; ----------------------------------------------------------------------------
;;; gtk_shortcut_action_to_string ()
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_shortcut_action_to_string" shortcut-action-to-string) 
    :string
 #+liber-documentation
 "@version{#2022-8-26}
  @argument[shortcut]{a @class{gtk:shortcut-action} object}
  @return{A human-readable string.}
  @begin{short}
    Prints the given action into a human-readable string.
  @end{short}
  @see-class{gtk:shortcut-action}"
  (action (g:object shortcut-action)))

(export 'shortcut-action-to-string)

;;; ----------------------------------------------------------------------------
;;; gtk_shortcut_action_print ()
;;;
;;; void
;;; gtk_shortcut_action_print (GtkShortcutAction *self,
;;;                            GString *string);
;;;
;;; Prints the given action into a string for the developer. This is meant for
;;; debugging and logging.
;;;
;;; The form of the representation may change at any time and is not guaranteed
;;; to stay identical.
;;;
;;; self :
;;;     a GtkShortcutAction
;;;
;;; string :
;;;     a GString to print into
;;; ----------------------------------------------------------------------------

;; not needed, see the SHORTCUT-TO-STRING function

;;; ----------------------------------------------------------------------------
;;; gtk_shortcut_action_parse_string ()
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_shortcut_action_parse_string" shortcut-action-parse-string)
    (g:object shortcut-action)
 #+liber-documentation
 "@version{#2022-8-26}
  @argument[str]{a string to parse}
  @return{A new @class{gtk:shortcut-action} object, or @code{nil} on error}
  @begin{short}
    Tries to parse the given string into an action.
  @end{short}
  On success, the parsed action is returned. When parsing failed, @code{nil}
  is returned. The accepted strings are:
  @begin[code]{table}
    @entry[nothing]{for GtkNothingAction}
    @entry[activate]{for GtkActivateAction}
    @entry[mnemonic-activate]{for GtkMnemonicAction}
    @entry[action(name)]{for a GtkNamedAction for the action named @code{name}}
    @entry[signal(name)]{for a GtkSignalAction for the signal @code{name}}
  @end{table}
  @see-class{gtk:shortcut-action}"
  (str :string))

(export 'shortcut-action-parse-string)

;;; ----------------------------------------------------------------------------
;;; gtk_shortcut_action_activate ()
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_shortcut_action_activated" shortcut-action-activate)
    :boolean
 #+liber-documentation
 "@version{#2022-8-26}
  @argument[shortcut]{a @class{gtk:shortcut-action} object}
  @argument[flags]{a @symbol{gtk:shortcut-action-flags} value}
  @argument[widget]{a @class{gtk:widget} object}
  @argument[args]{the @type{glib:variant} arguments to pass}
  @return{@em{True} if the action was activaed sucessfully.}
  @begin{short}
    Activates the action on the widget with the given @arg{args}.
  @end{short}
  Note that some actions ignore the passed in @arg{flags}, @arg{widget} or
  @arg{args}.

  Activation of an action can fail for various reasons. If the action is not
  supported by the widget, if the @arg{args} do not match the action or if the
  activation otherwise had no effect, @em{false} will be returned.
  @see-class{gtk:shortcut-action}
  @see-class{gtk:widget}
  @see-type{glib:variant}
  @see-symbol{gtk:shortcut-flags}"
  (action (g:object shortcut-action))
  (flags shortcut-action-flags)
  (widget (g:object widget))
  (args (:pointer (:struct glib:variant))))

(export 'shortcut-action-activate)

;;; ----------------------------------------------------------------------------
;;; gtk_nothing_action_get ()
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_nothing_action_get" nothing-action-get)
    (g:object shortcut-action)
 #+liber-documentation
 "@version{#2022-8-26}
  @return{A @class{gtk:nothing-action} object.}
  @begin{short}
    Gets the nothing action.
  @end{short}
  This is an action that does nothing and where activating it always fails.
  @see-class{gtk:nothing-action}")

(export 'nothing-action-get)

;;; ----------------------------------------------------------------------------
;;; GtkShortcutFunc ()
;;; ----------------------------------------------------------------------------

(cffi:defcallback shortcut-func :boolean
    ((widget (g:object widget))
     (args (:pointer (:struct glib:variant)))
     (data :pointer))
  (let ((fn (glib:get-stable-pointer-value data)))
    (funcall fn widget args)))

#+liber-documentation
(setf (liber:alias-for-symbol 'shortcut-func)
      "Callback"
      (liber:symbol-documentation 'shortcut-func)
 "@version{#2022-8-26}
  @begin{short}
    Prototype for shortcuts based on user callbacks.
  @end{short}
  @begin{pre}
lambda (widget args)
  @end{pre}
  @begin[code]{table}
    @entry[widget]{a @class{gtk:widget} object passed to the activation}
    @entry[args]{the @type{glib:variant} arguments passed to the activation}
  @end{table}
  @see-class{gtk:flow-box}
  @see-class{gtk:flow-box-child}")

(export 'shortcut-func)

;;; ----------------------------------------------------------------------------
;;; gtk_callback_action_new ()
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_callback_action_new" %callback-action-new)
    (g:object shortcut-action)
  (callback :pointer)
  (data :pointer)
  (destroy :pointer))

(defun callback-action-new (func)
 #+liber-documentation
 "@version{#2022-8-26}
  @argument[func]{a @symbol{gtk:shortcut-func} callback function to call}
  @return{A new @class{gtk:callback-action} object.}
  @short{Create a custom action that calls the given callback when activated.}
  @see-class{gtk:callback-action}"
  (glib:with-stable-pointer (ptr func)
    (%callback-action-new (cffi:callback shortcut-func)
                           ptr
                           (cffi:callback glib:stable-pointer-destroy-notify))))

(export 'callback-action-new)

;;; ----------------------------------------------------------------------------
;;; gtk_mnemonic_action_get ()
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_mnemonic_action_get" mnemonic-action-get)
    (g:object shortcut-action)
 #+liber-documentation
 "@version{#2022-8-26}
  @return{The @class{gtk:shortcut-action} mnemonic action.}
  @begin{short}
    Gets the mnemonic action.
  @end{short}
  This is an action that calls the @fun{gtk:widget-mnemonic-activate} function
  on the given widget upon activation.
  @see-class{gtk:shortcut-action}
  @see-function{gtk:widget-mnemonic-activate}")

(export 'mnemonic-action-get)

;;; ----------------------------------------------------------------------------
;;; gtk_activate_action_get ()
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_activate_action_get" activate-action-get)
    (g:object shortcut-action)
 #+liber-documentation
 "@version{#2022-8-26}
  @return{A @class{gtk:shortcut-action} activate action.}
  @begin{short}
    Gets the activate action.
  @end{short}
  This is an action that calls the @fun{gtk:widget-activate} function on the
  given widget upon activation.
  @see-class{gtk:shortcut-action}
  @see-function{gtk:widget-activate}")

(export 'activate-action-get)

;;; ----------------------------------------------------------------------------
;;; gtk_signal_action_new ()
;;; ----------------------------------------------------------------------------

(declaim (inline signal-action-new))

(defun signal-action-new (name)
 #+liber-documentation
 "@version{#2022-8-26}
  @argument[name]{a string with the name of the signal to emit}
  @return{A @class{gtk:signal-action} object.}
  @begin{short}
    Creates an action that when activated, emits the given action signal on the
    provided widget unpacking the given args into arguments passed to the
    signal.
  @end{short}
  @see-class{gtk:signal-action}"
  (make-instance 'signal-action
                 :signal-name name))

(export 'signal-action-new)

;;; ----------------------------------------------------------------------------
;;; gtk_named_action_new ()
;;; ----------------------------------------------------------------------------

(declaim (inline named-action-new))

(defun named-action-new (name)
 #+liber-documentation
 "@version{#2022-8-26}
  @argument[name]{a string with the detailed name of the action}
  @return{A new @class{gtk:named-action} object.}
  @begin{short}
    Creates an action that when activated, activates the action given by the
    detailed name on the widget passing the given arguments to it.
  @end{short}
  See the @fun{gtk:widget-insert-action-group} function for how to add actions
  to widgets.
  @see-class{gtk:named-action}
  @see-function{gtk:widget-insert-action-group}"
  (make-instance 'named-action
                 :action-name name))

(export 'named-action-new)

;;; --- End of file gtk4.shortcut-action.lisp ----------------------------------
