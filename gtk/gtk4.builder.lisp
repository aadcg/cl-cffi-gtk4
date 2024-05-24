;;; ----------------------------------------------------------------------------
;;; gtk4.builder.lisp
;;;
;;; The documentation of this file is taken from the GTK 4 Reference Manual
;;; Version 4.12 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk4/>.
;;;
;;; Copyright (C) 2011 - 2024 Dieter Kaiser
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
;;; GtkBuilder
;;;
;;;     Build an interface from an XML UI definition
;;;
;;; Types and Values
;;;
;;;     GtkBuilder
;;;     GtkBuilderClosureFlags                             not implemented
;;;     GtkBuilderError                                    not exported
;;;
;;; Accessors
;;;
;;;     gtk_builder_get_current_object
;;;     gtk_builder_set_current_object
;;;     gtk_builder_get_scope
;;;     gtk_builder_set_scope
;;;     gtk_builder_get_translation_domain
;;;     gtk_builder_set_translation_domain
;;;
;;; Functions
;;;
;;;     GTK_BUILDER_WARN_INVALID_CHILD_TYPE
;;;
;;;     gtk_builder_new
;;;     gtk_builder_new_from_file
;;;     gtk_builder_new_from_resource
;;;     gtk_builder_new_from_string
;;;
;;;     gtk_builder_create_closure                         not implemented
;;;
;;;     gtk_builder_add_from_file
;;;     gtk_builder_add_from_resource
;;;     gtk_builder_add_from_string
;;;
;;;     gtk_builder_add_objects_from_file
;;;     gtk_builder_add_objects_from_resource
;;;     gtk_builder_add_objects_from_string
;;;
;;;     gtk_builder_extend_with_template                   not implemented
;;;
;;;     gtk_builder_get_object
;;;     gtk_builder_get_objects
;;;     gtk_builder_expose_object
;;;
;;;     gtk_builder_get_type_from_name                     not exported
;;;     gtk_builder_value_from_string                      not implemented
;;;     gtk_builder_value_from_string_type                 not implemented
;;;
;;; Properties
;;;
;;;     current-object
;;;     scope
;;;     translation-domain
;;;
;;; Hierarchy
;;;
;;;     GObject
;;;     ╰── GtkBuilder
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; enum GtkBuilderClosureFlags
;;;
;;; The list of flags that can be passed to gtk_builder_create_closure().
;;; New values may be added in the future for new features, so external
;;; implementations of GtkBuilderScopeInterface should test the flags for
;;; unknown values and raise a GTK_BUILDER_ERROR_INVALID_ATTRIBUTE error when
;;; they encounter one.
;;;
;;; GTK_BUILDER_CLOSURE_SWAPPED :
;;;     The closure should be created swapped. See g_cclosure_new_swap() for
;;;     details.
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; GtkBuilderError                                         not exported
;;; ----------------------------------------------------------------------------

(gobject:define-g-enum "GtkBuilderError" builder-error
  (:export nil
   :type-initializer "gtk_builder_error_get_type")
  (:invalid-type-function 0)
  (:unhandled-tag 1)
  (:missing-attribute 2)
  (:invalid-attribute 3)
  (:invalid-tag 4)
  (:missing-property-value 5)
  (:invalid-value 6)
  (:version-mismatch 7)
  (:duplicate-id 8)
  (:type-refused 9)
  (:template-mismatch 10)
  (:invalid-property 11)
  (:invalid-signal 12)
  (:invalid-id 13)
  (:invalid-function 14))

#+liber-documentation
(setf (liber:alias-for-symbol 'builder-error)
      "GEnum"
      (liber:symbol-documentation 'builder-error)
 "@version{#2022-1-10}
  @begin{short}
    Error codes that identify various errors that can occur while parsing the
    @class{gtk:builder} UI definition.
  @end{short}
  @begin{pre}
(gobject:define-g-enum \"GtkBuilderError\" builder-error
  (:export t
   :type-initializer \"gtk_builder_error_get_type\")
  (:invalid-type-function 0)
  (:unhandled-tag 1)
  (:missing-attribute 2)
  (:invalid-attribute 3)
  (:invalid-tag 4)
  (:missing-property-value 5)
  (:invalid-value 6)
  (:version-mismatch 7)
  (:duplicate-id 8)
  (:type-refused 9)
  (:template-mismatch 10)
  (:invalid-property 11)
  (:invalid-signal 12)
  (:invalid-id 13)
  (:invalid-function 14))
  @end{pre}
  @begin[code]{table}
    @entry[:invalid-type-function]{A @code{type-func} attribute did not name a
      function that returns a @class{g:type-t} type ID.}
    @entry[:unhandled-tag]{The input contained a tag that a @class{gtk:builder}
      object cannot handle.}
    @entry[:missing-attribute]{An attribute that is required by a
      @class{gtk:builder} object was missing.}
    @entry[:invalid-attribute]{A @class{gtk:builder} object found an attribute
      that it does not understand.}
    @entry[:invalid-tag]{A @class{gtk:builder} object found a tag that it does
      not understand.}
    @entry[:missing-property-value]{A required property value was missing.}
    @entry[:invalid-value]{A @class{gtk:builder} object could not parse some
      attribute value.}
    @entry[:version-mismatch]{The input file requires a newer version of GTK.}
    @entry[:duplicate-id]{An object ID occurred twice.}
    @entry[:type-refused]{A specified object type is of the same type or derived
      from the type of the composite class being extended with builder XML.}
    @entry[:template-mismatch]{The wrong type was specified in a composite
      class’s template XML.}
    @entry[:invalid-property]{The specified property is unknown for the object
      class.}
    @entry[:invalid-signal]{The specified signal is unknown for the object
      class.}
    @entry[:invalid-id]{An object ID is unknown.}
    @entry[:invalid-function]{A function could not be found. This often happens
      when symbols are set to be kept private. Compiling code with
      @code{-rdynamic} or using the @code{gmodule-export-2.0 pkgconfig} module
      can fix this problem.}
  @end{table}
  @see-class{gtk:builder}")

;;; ----------------------------------------------------------------------------
;;; GTK_BUILDER_WARN_INVALID_CHILD_TYPE()
;;;
;;; #define GTK_BUILDER_WARN_INVALID_CHILD_TYPE(object, type)
;;;
;;; This macro should be used to emit a warning about and unexpected type value
;;; in a GtkBuildable add_child implementation.
;;;
;;; object :
;;;     the GtkBuildable on which the warning ocurred
;;;
;;; type :
;;;     the unexpected type value
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; GtkBuilder
;;; ----------------------------------------------------------------------------

;; TODO: The documentation of GtkBuilder needs work.

(gobject:define-g-object-class "GtkBuilder" builder
  (:superclass g:object
   :export t
   :interfaces nil
   :type-initializer "gtk_builder_get_type")
  ((current-object
    builder-current-object
    "current-object" "GObject" t t)
   (scope
    builder-scope
    "scope" "GtkBuilderScope" t t)
   (translation-domain
    builder-translation-domain
    "translation-domain" "gchararray" t t)))

;;; This Lisp extension is not documented
(defmethod initialize-instance :after ((builder builder)
                                       &key from-file from-string)
  (when from-file
    (builder-add-from-file builder (namestring from-file)))
  (when from-string
    (builder-add-from-string builder from-string)))

#+liber-documentation
(setf (documentation 'builder 'type)
 "@version{2023-9-18}
  @begin{short}
    The @class{gtk:builder} object reads XML descriptions of a user interface
    and instantiates the described objects.
  @end{short}
  To create a @class{gtk:builder} object from a user interface description, call
  the @fun{gtk:builder-new-from-file}, @fun{gtk:builder-new-from-resource} or
  @fun{gtk:builder-new-from-string} function.

  In the (unusual) case that you want to add user interface descriptions from
  multiple sources to the same @class{gtk:builder} object you can call the
  @fun{gtk:builder-new} function to get an empty builder and populate it by
  (multiple) calls to the @fun{gtk:builder-add-from-file},
  @fun{gtk:builder-add-from-resource} or @fun{gtk:builder-add-from-string}
  functions.

  A @class{gtk:builder} object holds a reference to all objects that it has
  constructed and drops these references when it is finalized. This finalization
  can cause the destruction of non-widget objects or widgets which are not
  contained in a toplevel window. For toplevel windows constructed by a builder,
  it is the responsibility of the user to call the @fun{gtk:window-destroy}
  function to get rid of them and all the widgets they contain.

  The @fun{gtk:builder-object} and @fun{gtk:builder-objects} functions can be
  used to access the widgets in the interface by the names assigned to them
  inside the UI description. Toplevel windows returned by these functions will
  stay around until the user explicitly destroys them with the
  @fun{gtk:window-destroy} function. Other widgets will either be part of a
  larger hierarchy constructed by the builder, in which case you should not
  have to worry about their lifecycle, or without a parent, in which case they
  have to be added to some container to make use of them. Non-widget objects
  need to be reffed with the @fun{g:object-ref} function to keep them beyond
  the lifespan of the builder.

  @subheading{GtkBuilder UI Definitions}
  The @class{gtk:builder} object parses textual descriptions of user interfaces
  which are specified in XML format. We refer to these descriptions as
  \"GtkBuilder UI definitions\" or just \"UI definitions\" if the context is
  clear.

  @subheading{Structure of UI definitions}
  UI definition files are always encoded in UTF-8.

  The toplevel element is @code{<interface>}. It optionally takes a \"domain\"
  attribute, which will make the builder look for translated strings using
  the @code{dgettext()} function in the domain specified. This can also be done
  by calling the @fun{gtk:builder-translation-domain} function on the builder.
  For example:
  @begin{pre}
<?xml version=\"1.0\" encoding=\"UTF-8\">
<interface domain=\"your-app\">
  ...
</interface>
  @end{pre}
  @subheading{Requirements}
  The target toolkit version(s) are described by @code{<requires>} elements, the
  \"lib\" attribute specifies the widget library in question, currently the only
  supported value is \"gtk\", and the \"version\" attribute specifies the target
  version in the form \"<major>.<minor>\". GtkBuilder will error out if the
  version requirements are not met. For example:
  @begin{pre}
<?xml version=\"1.0\" encoding=\"UTF-8\">
<interface domain=\"your-app\">
  <requires lib=\"gtk\" version=\"4.0\" />
</interface>
  @end{pre}
  @subheading{Objects}
  Objects are defined as children of the @code{<interface>} element.

  Objects are described by @code{<object>} elements, which can contain
  @code{<property>} elements to set properties, <signal> elements which connect
  signals to handlers, and @code{<child>} elements, which describe child
  objects, most often widgets inside a container, but also e.g. actions in an
  action group, or columns in a tree model. A @code{<child>} element contains
  an @code{<object>} element which describes the child object.

  Typically, the specific kind of object represented by an @code{<object>}
  element is specified by the \"class\" attribute. If the type has not been
  loaded yet, GTK tries to find the @code{get_type()} function from the class
  name by applying heuristics. This works in most cases, but if necessary, it is
  possible to specify the name of the @code{get_type()} function explicitly with
  the \"type-func\" attribute. If your UI definition is referencing internal
  types, you should make sure to call @code{g_type_ensure()} function for each
  object type before parsing the UI definition.

  Objects may be given a name with the \"id\" attribute, which allows the
  application to retrieve them from the builder with the
  @fun{gtk:builder-object} function. An ID is also necessary to use the object
  as property value in other parts of the UI definition. GTK reserves ids
  starting and ending with \"___\" (three consecutive underscores) for its own
  purposes.

  @subheading{Properties}
  Setting properties of objects is pretty straightforward with the
  @code{<property>} element: the \"name\" attribute specifies the name of the
  property, and the content of the element specifies the value:
  @begin{pre}
<object class=\"GtkButton\">
  <property name=\"label\">Hello, world</property>
</object>
  @end{pre}
  If the \"translatable\" attribute is set to a true value, GTK uses the
  @code{gettext()} function, or the @code{dgettext()} function if the builder
  has a translation domain set, to find a translation for the value. This
  happens before the value is parsed, so it can be used for properties of any
  type, but it is probably most useful for string properties. It is also
  possible to specify a context to disambiguate short strings, and comments
  which may help the translators:
  @begin{pre}
<object class=\"GtkButton\">
  <property name=\"label\" translatable=\"yes\" context=\"button\">Hello, world</property>
</object>
  @end{pre}
  The @class{gtk:builder} object can parse textual representations for the most
  common property types:
  @begin{itemize}
    @item{characters}
    @item{strings}
    @item{integers}
    @item{floating-point numbers}
    @item{booleans, strings like \"TRUE\", \"t\", \"yes\", \"y\", \"1\" are
      interpreted as true values, strings like \"FALSE\", \"f\", \"no\", \"n\",
      \"0\" are interpreted as false values}
    @item{enumeration types, can be specified by their full C identifier their
      short name used when registering the enumeration type, or their integer
      value}
    @item{flag types, can be specified by their C identifier, short name,
      integer value, and optionally combined with “|” for bitwise OR, e.g.
      \"GTK_INPUT_HINT_EMOJI|GTK_INPUT_HINT_LOWERCASE\", or \"emoji|lowercase\"}
    @item{colors, in a format understood by the @fun{gdk:rgba-parse} function}
    @item{GVariant, can be specified in the format understood by the
      @fun{g:variant-parse} function}
    @item{pixbufs, can be specified as a filename of an image file to load}
  @end{itemize}
  Objects can be referred to by their name and by default refer to objects
  declared in the local XML fragment and objects exposed via the
  @fun{gtk:builder-expose-object} function. In general, the @class{gtk:builder}
  object allows forward references to objects declared in the local XML; an
  object does not have to be constructed before it can be referred to. The
  exception to this rule is that an object has to be constructed before it can
  be used as the value of a construct-only property.

  @subheading{Property bindings}
  It is also possible to bind a property value to another object’s property
  value using the attributes \"bind-source\" to specify the source object of the
  binding, and optionally, \"bind-property\" and \"bind-flags\" to specify the
  source property and source binding flags respectively. Internally, the
  @class{gtk:builder} class implements this using @class{g:binding} objects.

  For instance, in the example below the \"label\" property of the
  @code{bottom_label} widget is bound to the \"label\" property of the
  @code{top_button} widget:
  @begin{pre}
<object class=\"GtkBox\">
  <property name=\"orientation\">vertical</property>
  <child>
    <object class=\"GtkButton\" id=\"top_button\">
      <property name=\"label\">Hello, world</property>
    </object>
  </child>
  <child>
    <object class=\"GtkLabel\" id=\"bottom_label\">
      <property name=\"label\"
                bind-source=\"top_button\"
                bind-property=\"label\"
                bind-flags=\"sync-create\" />
    </object>
  </child>
</object>
  @end{pre}
  For more information, see the documentation of the
  @fun{g:object-bind-property} method.

  @subheading{Internal children}
  Sometimes it is necessary to refer to widgets which have implicitly been
  constructed by GTK as part of a composite widget, to set properties on them or
  to add further children, e.g. the content area of a the @class{gtk:dialog}
  widget. This can be achieved by setting the \"internal-child\" property of the
  @code{<child>} element to a true value. Note that the @class{gtk:builder}
  object still requires an @code{<object>} element for the internal child, even
  if it has already been constructed.

  @subheading{Specialized children}
  A number of widgets have different places where a child can be added, e.g.
  tabs vs. page content in notebooks. This can be reflected in a UI definition
  by specifying the \"type\" attribute on a @code{<child>}. The possible values
  for the \"type\" attribute are described in the sections describing the
  widget-specific portions of UI definitions.

  @subheading{Signal handlers and function pointers}
  Signal handlers are set up with the @code{<signal>} element. The \"name\"
  attribute specifies the name of the signal, and the \"handler\" attribute
  specifies the function to connect to the signal.
  @begin{pre}
<object class=\"GtkButton\" id=\"hello_button\">
  <signal name=\"clicked\" handler=\"hello_button__clicked\" />
</object>
  @end{pre}
  The remaining attributes, \"after\", \"swapped\" and \"object\", have the same
  meaning as the corresponding parameters of the @fun{g:signal-connect-object}
  or @fun{g:signal-connect-data} functions:
  @begin{itemize}
    @item{\"after\" matches the @code{:after} flag, and will ensure that the
      handler is called after the default class closure for the signal}
    @item{\"swapped\" matches the @code{:swapped} flag, and will swap the
      instance and closure arguments when invoking the signal handler}
    @item{\"object\" will bind the signal handler to the lifetime of the object
      referenced by the attribute}
  @end{itemize}
  By default \"swapped\" will be set to \"yes\" if not specified otherwise, in
  the case where \"object\" is set, for convenience. A
  \"last_modification_time\" attribute is also allowed, but it does not have a
  meaning to the builder.

  When compiling applications for Windows, you must declare signal callbacks
  with the @code{G_MODULE_EXPORT} decorator, or they will not be put in the
  symbol table:
  @begin{pre}
G_MODULE_EXPORT void
hello_button__clicked (GtkButton *button,
                       gpointer data)
{
  // ...
@}
  @end{pre}
  On Linux and Unix, this is not necessary; applications should instead be
  compiled with the @code{-Wl,--export-dynamic} argument inside their compiler
  flags, and linked against @code{gmodule-export-2.0}.

  Example UI Definition
  @begin{pre}
<interface>
  <object class=\"GtkDialog\" id=\dialog1\">
    <child internal-child=\"content_area\">
      <object class=\"GtkBox\">
        <child internal-child=\"action_area\">
          <object class=\"GtkBox\">
            <child>
              <object class=\"GtkButton\" id=\"ok_button\">
                <property name=\"label\" translatable=\"yes\">_Ok</property>
                <property name=\"use-underline\">True</property>
                <signal name=\"clicked\" handler=\"ok_button_clicked\"/>
              </object>
            </child>
          </object>
        </child>
      </object>
    </child>
  </object>
</interface>
  @end{pre}
  @subeading{Using GtkBuildable for extending UI definitions}
  Objects can implement the @class{gtk:buildable} interface to add custom
  elements and attributes to the XML. Typically, any extension will be
  documented in each type that implements the interface.

  @subheading{Templates}
  When describing a @class{gtk:widget} object, you can use the
  @code{<template>} tag to describe a UI bound to a specific widget type. GTK
  will automatically load the UI definition when instantiating the type, and
  bind children and signal handlers to instance fields and function symbols.

  For more information, see the @class{gtk:widget} documentation for details.
  @see-constructor{gtk:builder-new}
  @see-constructor{gtk:builder-new-from-file}
  @see-constructor{gtk:builder-new-from-resource}
  @see-constructor{gtk:builder-new-from-string}
  @see-slot{gtk:builder-current-object}
  @see-slot{gtk:builder-scope}
  @see-slot{gtk:builder-translation-domain}
  @see-class{gtk:buildable}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- gtk:builder-current-object ---------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "current-object" 'builder) t)
 "The @code{current-object} property of type @class{g:object} (Read / Write)
  @br{}
  The object the builder is evaluating for.")

#+liber-documentation
(setf (liber:alias-for-function 'builder-current-object)
      "Accessor"
      (documentation 'builder-current-object 'function)
 "@version{#2023-9-18}
  @syntax{(gtk:builder-current-object object) => current}
  @syntax{(setf (gtk:builder-current-object object) current)}
  @argument[object]{a @class{gtk:builder} object}
  @argument[current]{a @class{g:object} instance}
  @begin{short}
    Accessor of the @slot[gtk:builder]{current-object} slot of the
    @class{gtk:builder} class.
  @end{short}
  The @fun{gtk:builder-current-object} function gets the current object for the
  builder. The @setf{gtk:builder-current-object} function sets the current
  object. The current object can be thought of as the this object that the
  builder is working for and will often be used as the default object when an
  object is optional.

  The @fun{gtk:widget-init-template} function for example will set the current
  object to the widget the template is inited for. For functions like the
  @fun{gtk:builder-new-from-resource} function, the current object will be
  @code{nil}.
  @see-class{gtk:builder}
  @see-class{g:object}
  @see-function{gtk:widget-init-template}
  @see-function{gtk:builder-new-from-resource}")

;;; --- gtk:builder-scope ------------------------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "scope" 'builder) t)
 "The @code{scope} property of type @code{GtkBuilderScope}
  (Read / Write / Construct) @br{}
  The scope the builder is operating in. Note: @code{GtkBuilderScope} support
  is currently not implemented in the Lisp binding.")

#+liber-documentation
(setf (liber:alias-for-function 'builder-scope)
      "Accessor"
      (documentation 'builder-scope 'function)
 "@version{#2023-9-18}
  @syntax{(gtk:builder-scope object) => scope}
  @syntax{(setf (gtk:builder-scope object) scope)}
  @argument[object]{a @class{gtk:builder} object}
  @argument[scope]{a @code{GtkBuilderScope} object}
  @begin{short}
    Accessor of the @slot[gtk:builder]{scope} slot of the @class{gtk:builder}
    class.
  @end{short}
  The @fun{gtk:builder-scope} function gets the scope in use. The
  @setf{gtk:builder-scope} function sets the scope the builder should operate
  in. If the @arg{scope} argument is @code{nil}, a new @code{GtkBuilderCScope}
  object will be created.
  @begin[Note]{dictionary}
    @code{GtkBuilderScope} support is currently not implemented in the Lisp
    binding.
  @end{dictionary}
  @see-class{gtk:builder}")

;;; --- gtk:builder-translation-domain -----------------------------------------

#+liber-documentation
(setf (documentation (liber:slot-documentation "translation-domain" 'builder) t)
 "The @code{translation-domain} property of type @code{:string} (Read / Write)
  @br{}
  The translation domain used when translating property values that have been
  marked as translatable in interface descriptions. If the translation domain
  is @code{nil}, the @class{gtk:builder} object uses GNU gettext, otherwise
  GLIB gettext. @br{}
  Default value: @code{nil}")

#+liber-documentation
(setf (liber:alias-for-function 'builder-translation-domain)
      "Accessor"
      (documentation 'builder-translation-domain 'function)
 "@version{#2023-9-18}
  @syntax{(gtk:builder-translation-domain object) => domain}
  @syntax{(setf (gtk:builder-translation-domain object) domain)}
  @argument[object]{a @class{gtk:builder} object}
  @argument[domain]{a string with the translation domain or @code{nil}}
  @begin{short}
    Accessor of the @slot[gtk:builder]{translation-domain} slot of the
    @class{gtk:builder} class.
  @end{short}
  The @fun{gtk:builder-translation-domain} function gets the translation domain
  of @arg{object}. The @setf{gtk:builder-translation-domain} function sets the
  translation domain.

  The translation domain used when translating property values that have been
  marked as translatable in interface descriptions. If the translation domain
  is @code{nil}, the @class{gtk:builder} object uses GNU gettext, otherwise
  GLIB gettext.
  @see-class{gtk:builder}")

;;; ----------------------------------------------------------------------------
;;; gtk_builder_new
;;; ----------------------------------------------------------------------------

(declaim (inline builder-new))

(defun builder-new ()
 #+liber-documentation
 "@version{#2022-1-10}
  @return{The new @class{gtk:builder} object.}
  @begin{short}
    Creates a new builder object.
  @end{short}
  This function is only useful if you intend to make multiple calls to the
  @fun{gtk:builder-add-from-file}, @fun{gtk:builder-add-from-resource} or
  @fun{gtk:builder-add-from-string} functions in order to merge multiple UI
  descriptions into a single builder.
  @see-class{gtk:builder}
  @see-function{gtk:builder-add-from-file}
  @see-function{gtk:builder-add-from-resource}
  @see-function{gtk:builder-add-from-string}"
  (make-instance 'builder))

(export 'builder-new)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_new_from_file
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_new_from_file" %builder-new-from-file)
    (g:object builder)
  (filename :string))

(defun builder-new-from-file (path)
 #+liber-documentation
 "@version{2023-1-29}
  @argument[path]{a pathname or a namestring for the file}
  @return{The @class{gtk:builder} object containing the described interface.}
  @begin{short}
    Builds the @class{gtk:builder} UI definition from a user interface
    description file.
  @end{short}
  If there is an error opening the file or parsing the description then the
  program will be aborted. You should only ever attempt to parse user interface
  descriptions that are shipped as part of your program.
  @see-class{gtk:builder}"
  (%builder-new-from-file (namestring path)))

(export 'builder-new-from-file)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_new_from_resource
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_new_from_resource" %builder-new-from-resource)
    (g:object builder)
  (namestring :string))

(defun builder-new-from-resource (path)
 #+liber-documentation
 "@version{#2023-8-3}
  @argument[path]{a path or namestring with the @class{g:resource} path}
  @return{The @class{gtk:builder} object containing the described interface.}
  @begin{short}
    Builds the @class{gtk:builder} UI definition from a resource path.
  @end{short}
  If there is an error locating the resource or parsing the description then
  the program will be aborted.
  @see-class{gtk:builder}
  @see-class{g:resource}
  @see-function{gtk:builder-new}
  @see-function{gtk:builder-new-from-file}
  @see-function{gtk:builder-new-from-string}"
  (let ((namestring (namestring path)))
    (%builder-new-from-resource namestring)))

(export 'builder-new-from-resource)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_new_from_string
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_new_from_string" %builder-new-from-string)
    (g:object builder)
  (string :string)
  (length :int))

(defun builder-new-from-string (string)
 #+liber-documentation
 "@version{#2022-9-13}
  @argument[string]{a string with the user interface description}
  @return{The @class{gtk:builder} object containing the interface described by
    @arg{string}.}
  @begin{short}
    Builds the user interface described by @arg{string} in the
    @class{gtk:builder} UI definition format.
  @end{short}
  If there is an error parsing the string then the program will be aborted. You
  should not attempt to parse user interface description from untrusted sources.
  @see-class{gtk:builder}
  @see-function{gtk:builder-new}
  @see-function{gtk:builder-new-from-file}
  @see-function{gtk:builder-new-from-resource}"
  (%builder-new-from-string string -1))

(export 'builder-new-from-string)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_create_closure
;;;
;;; GClosure*
;;; gtk_builder_create_closure (GtkBuilder* builder,
;;;                             const char* function_name,
;;;                             GtkBuilderClosureFlags flags,
;;;                             GObject* object,
;;;                             GError** error)
;;;
;;; Creates a closure to invoke the function called function_name.
;;;
;;; This is using the create_closure() implementation of builder‘s
;;; GtkBuilderScope.
;;;
;;; If no closure could be created, NULL will be returned and error will be set.
;;;
;;; function_name :
;;;     Name of the function to look up. The data is owned by the caller of the
;;;     function. The value is a NUL terminated UTF-8 string.
;;;
;;; flags :
;;;     Closure creation flags
;;;
;;; object :
;;;     Object to create the closure with. The argument can be NULL. The data
;;;     is owned by the caller of the function.
;;;
;;; error :
;;;     The return location for a GError*, or NULL.
;;;
;;; Returns :
;;;     A new closure for invoking function_name. The caller of the method
;;;     takes ownership of the data, and is responsible for freeing it. The
;;;     return value can be NULL.
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_builder_add_from_file
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_add_from_file" %builder-add-from-file) :uint
  (builder (g:object builder))
  (filename :string)
  (err :pointer))

(defun builder-add-from-file (builder path)
 #+liber-documentation
 "@version{2023-9-18}
  @argument[builder]{a @class{gtk:builder} object}
  @argument[path]{a pathname or namestring with the name of the file to parse}
  @begin{short}
    Parses a file containing a @class{gtk:builder} UI definition and merges it
    with the current contents of the builder.
  @end{short}
  This function is useful if you need to call the
  @fun{gtk:builder-current-object} function to add user data to callbacks
  before loading the @class{gtk:builder} UI definition. Otherwise, you probably
  want the @fun{gtk:builder-new-from-file} function instead.

  If there is an error opening the file or parsing the description then the
  program will be aborted.
  @see-class{gtk:builder}
  @see-function{gtk:builder-current-object}
  @see-function{gtk:builder-new-from-file}
  @see-function{gtk:builder-add-from-resource}
  @see-function{gtk:builder-add-from-string}"
  (glib:with-g-error (err)
    (%builder-add-from-file builder (namestring path) err)))

(export 'builder-add-from-file)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_add_from_resource
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_add_from_resource" %builder-add-from-resource) :uint
  (builder (g:object builder))
  (path :string)
  (err :pointer))

(defun builder-add-from-resource (builder path)
 #+liber-documentation
 "@version{#2023-9-18}
  @argument[builder]{a @class{gtk:builder} object}
  @argument[path]{a string with the path of the resouce file to parse}
  @begin{short}
    Parses a resource file containing a @class{gtk:builder} UI definition and
    merges it with the current contents of the builder.
  @end{short}
  This function is useful if you need to call the
  @fun{gtk:builder-current-object} function to add user data to callbacks before
  loading the @class{gtk:builder} UI definition. Otherwise, you probably want
  the @fun{gtk:builder-new-from-resource} function instead.

  If there is an error locating the resource or parsing the description then
  the program will be aborted.
  @see-class{gtk:builder}
  @see-class{g:resource}
  @see-function{gtk:builder-current-object}
  @see-function{gtk:builder-new-from-resource}
  @see-function{gtk:builder-add-from-file}
  @see-function{gtk:builder-add-from-string}"
  (glib:with-g-error (err)
    (%builder-add-from-resource builder path err)))

(export 'builder-add-from-resource)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_add_from_string
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_add_from_string" %builder-add-from-string) :uint
  (builder (g:object builder))
  (string :string)
  (length :int)
  (err :pointer))

(defun builder-add-from-string (builder string)
 #+liber-documentation
 "@version{2023-9-18}
  @argument[builder]{a @class{gtk:builder} object}
  @argument[string]{a string to parse}
  @begin{short}
    Parses a string containing a @class{gtk:builder} UI definition and merges
    it with the current contents of the builder.
  @end{short}
  This function is useful if you need to call the
  @fun{gtk:builder-current-object} function to add user data to callbacks before
  loading the @class{gtk:builder} UI definition. Otherwise, you probably want
  the @fun{gtk:builder-new-from-string} function instead.

  If there is an error parsing the string then the program will be aborted.
  @see-class{gtk:builder}
  @see-function{gtk:builder-current-object}
  @see-function{gtk:builder-new-from-string}
  @see-function{gtk:builder-add-from-file}
  @see-function{gtk:builder-add-from-resource}"
  (glib:with-g-error (err)
    (%builder-add-from-string builder string -1 err)))

(export 'builder-add-from-string)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_add_objects_from_file
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_add_objects_from_file"
               %builder-add-objects-from-file) :uint
  (builder (g:object builder))
  (filename :string)
  (strptr :pointer)
  (err :pointer))

;; TODO: Search a better place for this utility macro.
;; The macro is implemented for this file, but can be used generally to copy
;; a list of Lisp strings into a C array of strings.
(defmacro with-foreign-string-array ((strptr strs) &body body)
  (let ((i (gensym))
        (str (gensym)))
    `(let ((,strptr (cffi:foreign-alloc :pointer :count (1+ (length ,strs)))))
       (iter (for ,i from 0)
             (for ,str in ,strs)
             (setf (cffi:mem-aref ,strptr :pointer ,i)
                   (cffi:foreign-string-alloc ,str)))
       (setf (cffi:mem-aref ,strptr :pointer (length ,strs)) (cffi:null-pointer))
       (unwind-protect
         (progn ,@body)
         (progn
           (iter (for ,i from 0)
                 (repeat (1- (length ,strs)))
                 (cffi:foreign-string-free (cffi:mem-aref ,strptr
                                                          :pointer ,i)))
           (cffi:foreign-string-free ,strptr))))))

(defun builder-add-objects-from-file (builder path &rest args)
 #+liber-documentation
 "@version{2023-1-29}
  @argument[builder]{a @class{gtk:builder} object}
  @argument[path]{a pathname or namestring with the name of the file to parse}
  @argument[args]{strings with the object IDs to build}
  @return{The positive value on success, 0 if an error occurred.}
  @begin{short}
    Parses a file containing a @class{gtk:builder} UI definition building only
    the requested objects and merges them with the current contents of builder.
  @end{short}
  Upon errors 0 will be returned.
  @begin[Note]{dictionary}
    If you are adding an object that depends on an object that is not its
    child, for instance a @class{gtk:tree-view} widget that depends on its
    @class{gtk:tree-model} implementation, you have to explicitely list all of
    them in @arg{args}.
  @end{dictionary}
  @see-class{gtk:builder}
  @see-function{gtk:builder-add-objects-from-string}
  @see-function{gtk:builder-add-objects-from-resource}"
  (with-foreign-string-array (strptr args)
    (glib:with-g-error (err)
      (%builder-add-objects-from-file builder (namestring path) strptr err))))

(export 'builder-add-objects-from-file)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_add_objects_from_resource
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_add_objects_from_resource"
               %builder-add-objects-from-resource) :uint
  (builder (g:object builder))
  (path :string)
  (strptr :pointer)
  (err :pointer))

(defun builder-add-objects-from-resource (builder path &rest args)
 #+liber-documentation
 "@version{#2022-9-13}
  @argument[builder]{a @class{gtk:builder} object}
  @argument[path]{a string with the path of the resource file to parse}
  @argument[args]{strings with the object IDs to build}
  @return{The positive value on success, 0 if an error occurred.}
  @begin{short}
    Parses a resource file containing a @class{gtk:builder} UI definition
    building only the requested objects and merges them with the current
    contents of builder.
  @end{short}
  @begin[Note]{dictionary}
    If you are adding an object that depends on an object that is not its
    child, for instance a @class{gtk:tree-view} widget that depends on its
    @class{gtk:tree-model} implementation, you have to explicitely list all of
    them in @arg{args}.
  @end{dictionary}
  @see-class{gtk:builder}
  @see-function{gtk:builder-add-objects-from-file}
  @see-function{gtk:builder-add-objects-from-string}"
  (with-foreign-string-array (strptr args)
    (glib:with-g-error (err)
      (%builder-add-objects-from-resource builder path strptr err))))

(export 'builder-add-objects-from-resource)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_add_objects_from_string
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_add_objects_from_string"
               %builder-add-objects-from-string) :uint
  (builder (g:object builder))
  (string :string)
  (length :int)
  (strptr :pointer)
  (err :pointer))

(defun builder-add-objects-from-string (builder string &rest args)
 #+liber-documentation
 "@version{#2023-9-18}
  @argument[builder]{a @class{gtk:builder} object}
  @argument[string]{a string to parse}
  @argument[args]{strings with the object IDs to build}
  @return{The positive value on success, 0 if an error occurred.}
  @begin{short}
    Parses a string containing a @class{gtk:builder} UI definition building only
    the requested objects and merges them with the current contents of builder.
  @end{short}
  @begin[Note]{dictionary}
    If you are adding an object that depends on an object that is not its child,
    for instance a @class{gtk:tree-view} widget that depends on its
    @class{gtk:tree-model} implementation, you have to explicitely list all of
    them in @arg{args}.
  @end{dictionary}
  @see-class{gtk:builder}
  @see-function{gtk:builder-add-objects-from-file}
  @see-function{gtk:builder-add-objects-from-resource}"
  (with-foreign-string-array (strptr args)
    (glib:with-g-error (err)
      (%builder-add-objects-from-string builder string -1 strptr err))))

(export 'builder-add-objects-from-string)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_extend_with_template
;;;
;;; guint
;;; gtk_builder_extend_with_template (GtkBuilder *builder,
;;;                                   GtkWidget *widget,
;;;                                   GType template_type,
;;;                                   const gchar *buffer,
;;;                                   gsize length,
;;;                                   GError **error)
;;;
;;; Main private entry point for building composite container components from
;;; template XML.
;;;
;;; This is exported purely to let gtk:builder-tool validate templates,
;;; applications have no need to call this function.
;;;
;;; builder :
;;;     a GtkBuilder
;;;
;;; widget :
;;;     the widget that is being extended
;;;
;;; template_type :
;;; the type that the template is for
;;;
;;; buffer :
;;;     the string to parse
;;;
;;; length :
;;;     the length of buffer (may be -1 if buffer is nul-terminated)
;;;
;;; error :
;;;     return location for an error, or NULL.
;;;
;;; Returns :
;;;     A positive value on success, 0 if an error occurred
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_builder_get_object
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_get_object" builder-object) g:object
 #+liber-documentation
 "@version{2023-7-26}
  @argument[builder]{a @class{gtk:builder} object}
  @argument[name]{a string with the name of the object to get}
  @return{The @class{g:object} instance named @arg{name} or @code{nil} if it
    could not be found in the object tree.}
  @begin{short}
    Gets the object named @arg{name} from the @class{gtk:builder} UI definition.
  @end{short}
  @see-class{gtk:builder}
  @see-class{g:object}
  @see-function{gtk:builder-objects}"
  (builder (g:object builder))
  (name :string))

(export 'builder-object)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_get_objects
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_get_objects" builder-objects) (g:slist-t g:object)
 #+liber-documentation
 "@version{#2022-1-10}
  @argument[builder]{a @class{gtk:builder} object}
  @begin{return}
    A list containing all the @class{g:object} instances constructed by the
    @class{gtk:builder} object.
  @end{return}
  @begin{short}
    Gets all objects that have been constructed by the builder.
  @end{short}
  @see-class{gtk:builder}
  @see-class{g:object}
  @see-function{gtk:builder-object}"
  (builder (g:object builder)))

(export 'builder-objects)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_expose_object
;;; ----------------------------------------------------------------------------

(cffi:defcfun ("gtk_builder_expose_object" builder-expose-object) :void
 #+liber-documentation
 "@version{#2022-9-13}
  @argument[builder]{a @class{gtk:builder} object}
  @argument[name]{a string with the name of the object exposed to the builder}
  @argument[object]{a @class{g:object} instance to expose}
  @begin{short}
    Adds an object to the builder object pool so it can be referenced just like
    any other object built by the builder.
  @end{short}
  @see-class{gtk:builder}
  @see-class{g:object}"
  (builder (g:object builder))
  (name :string)
  (object g:object))

(export 'builder-expose-object)

;;; ----------------------------------------------------------------------------
;;; gtk_builder_get_type_from_name                          not exported
;;; ----------------------------------------------------------------------------

;; The default implementation returns (gtype name) e.g. (gtype "GtkDialog").

(cffi:defcfun ("gtk_builder_get_type_from_name" builder-type-from-name) g:type-t
 #+liber-documentation
 "@version{#2022-1-10}
  @argument[builder]{a @class{gtk:builder} object}
  @argument[name]{a string with the type name to lookup}
  @return{The @class{g:type-t} type ID found for @arg{name}.}
  @begin{short}
    Looks up a type by name, using the virtual function that the
    @class{gtk:builder} class has for that purpose.
  @end{short}
  This is mainly used when implementing the @class{gtk:buildable} interface on
  a type.
  @see-class{gtk:builder}
  @see-class{gtk:buildable}
  @see-class{g:type-t}"
  (builder (g:object builder))
  (name :string))

;;; ----------------------------------------------------------------------------
;;; gtk_builder_value_from_string
;;;
;;; gboolean
;;; gtk_builder_value_from_string (GtkBuilder *builder,
;;;                                GParamSpec *pspec,
;;;                                const gchar *string,
;;;                                GValue *value,
;;;                                GError **error)
;;;
;;; This function demarshals a value from a string. This function calls
;;; g_value_init() on the value argument, so it need not be initialised
;;; beforehand.
;;;
;;; This function can handle char, uchar, boolean, int, uint, long, ulong, enum,
;;; flags, float, double, string, GdkColor, GdkRGBA and GtkAdjustment type
;;; values. Support for GtkWidget type values is still to come.
;;;
;;; Upon errors FALSE will be returned and error will be assigned a GError from
;;; the GTK_BUILDER_ERROR domain.
;;;
;;; builder :
;;;     a GtkBuilder
;;;
;;; pspec :
;;;     the GParamSpec for the property
;;;
;;; string :
;;;     the string representation of the value
;;;
;;; value :
;;;     the GValue to store the result in
;;;
;;; error :
;;;     return location for an error, or NULL
;;;
;;; Returns :
;;;     TRUE on success
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_builder_value_from_string_type
;;;
;;; gboolean
;;; gtk_builder_value_from_string_type (GtkBuilder *builder,
;;;                                     GType type,
;;;                                     const gchar *string,
;;;                                     GValue *value,
;;;                                     GError **error)
;;;
;;; Like gtk_builder_value_from_string(), this function demarshals a value from
;;; a string, but takes a GType instead of GParamSpec. This function calls
;;; g_value_init() on the value argument, so it need not be initialised
;;; beforehand.
;;;
;;; Upon errors FALSE will be returned and error will be assigned a GError from
;;; the GTK_BUILDER_ERROR domain.
;;;
;;; builder :
;;;     a GtkBuilder
;;;
;;; type :
;;;     the GType of the value
;;;
;;; string :
;;;     the string representation of the value
;;;
;;; value :
;;;     the GValue to store the result in
;;;
;;; error :
;;;     return location for an error, or NULL
;;;
;;; Returns :
;;;     TRUE on success
;;; ----------------------------------------------------------------------------

;;; --- End of file gtk4.builder.lisp ------------------------------------------
