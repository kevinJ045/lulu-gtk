typedef unsigned int guint;
typedef unsigned long gulong;
typedef int gboolean;
typedef void* gpointer;

typedef struct _GApplication GApplication;
typedef struct _GObject GObject;
typedef struct _GtkApplication GtkApplication;
typedef struct _GtkWidget GtkWidget;
typedef struct _GtkWindow GtkWindow;
typedef struct _GtkBox GtkBox;
typedef struct _GtkLabel GtkLabel;
typedef struct _GtkButton GtkButton;
typedef struct _GtkOrientable GtkOrientable;

typedef void (*GCallback)(GtkApplication*, gpointer);

typedef enum _GtkOrientation {
  GTK_ORIENTATION_HORIZONTAL = 0,
  GTK_ORIENTATION_VERTICAL   = 1
} GtkOrientation;
typedef enum GtkJustification {
  GTK_JUSTIFY_LEFT,
  GTK_JUSTIFY_RIGHT,
  GTK_JUSTIFY_CENTER,
  GTK_JUSTIFY_FILL
} GtkJustification;
typedef enum _PangoWrapMode {
  PANGO_WRAP_WORD,
  PANGO_WRAP_CHAR,
  PANGO_WRAP_WORD_CHAR
} PangoWrapMode;
typedef enum {
  PANGO_ELLIPSIZE_NONE,
  PANGO_ELLIPSIZE_START,
  PANGO_ELLIPSIZE_MIDDLE,
  PANGO_ELLIPSIZE_END
} PangoEllipsizeMode;

GtkApplication* gtk_application_new(const char* app_id, guint flags);

gulong g_signal_connect_data(
    gpointer instance,
    const char* detailed_signal,
    GCallback c_handler,
    gpointer data,
    void* destroy_data,
    int connect_flags
);

GtkWidget* gtk_application_window_new(GtkApplication* application);
void gtk_window_set_title(GtkWindow* window, const char* title);
void gtk_window_set_default_size(GtkWindow* window, int width, int height);
void gtk_window_set_child(GtkWindow* window, GtkWidget* child);
void gtk_widget_show(GtkWidget* widget);

int g_application_run(GApplication* application, int argc, char** argv);


GtkWidget* gtk_box_new(GtkOrientation orientation, int spacing);
void gtk_box_append(GtkBox* box, GtkWidget* child);
void gtk_box_prepend(GtkBox* box, GtkWidget* child);
void gtk_box_remove(GtkBox* box, GtkWidget* child);
void gtk_box_remove(GtkBox* box, GtkWidget* child);
void gtk_orientable_set_orientation(GtkOrientable* orientable, GtkOrientation orientation);
void gtk_box_set_spacing(GtkBox* box, int spacing);

GtkWidget* gtk_label_new (const char* str);
void gtk_label_set_text(GtkLabel* label, const char* str);
void gtk_label_set_markup(GtkLabel* label, const char* str);
void gtk_label_set_justify(GtkLabel* label, GtkJustification jtype);
void gtk_label_set_wrap(GtkLabel* label, gboolean wrap);
void gtk_label_set_wrap_mode(GtkLabel* label, PangoWrapMode mode);
void gtk_label_set_selectable(GtkLabel* label, gboolean setting);
void gtk_label_set_ellipsize(GtkLabel* label, PangoEllipsizeMode mode);
void gtk_label_set_xalign(GtkLabel* label, float xalign);
void gtk_label_set_yalign(GtkLabel* label, float yalign);
void gtk_label_set_lines(GtkLabel* label, int lines);

GtkWidget* gtk_button_new (void);
GtkWidget* gtk_button_new_with_label (const char* str);
GtkWidget* gtk_button_new_from_icon_name (const char* str);
void gtk_button_set_label (GtkButton* button, const char* label);
void gtk_button_set_icon_name (GtkButton* button, const char* str);
void gtk_button_set_child (GtkButton* button, GtkWidget* child);

// HeaderBar
typedef struct _GtkHeaderBar GtkHeaderBar;
GtkWidget* gtk_header_bar_new(void);
void gtk_header_bar_pack_start(GtkHeaderBar* header_bar, GtkWidget* child);
void gtk_header_bar_pack_end(GtkHeaderBar* header_bar, GtkWidget* child);

// CheckButton
typedef struct _GtkCheckButton GtkCheckButton;
GtkWidget* gtk_check_button_new_with_label(const char* label);
gboolean gtk_check_button_get_active(GtkCheckButton* check_button);
void gtk_check_button_set_active(GtkCheckButton* check_button, gboolean active);

// Frame
typedef struct _GtkFrame GtkFrame;
GtkWidget* gtk_frame_new(const char* label);
void gtk_frame_set_child(GtkFrame* frame, GtkWidget* child);

// Image
typedef struct _GtkImage GtkImage;
GtkWidget* gtk_image_new(void);
GtkWidget* gtk_image_new_from_file(const char* filename);
GtkWidget* gtk_image_new_from_icon_name(const char* icon_name);
void gtk_image_set_from_icon_name(GtkImage* image, const char* icon_name);
void gtk_image_set_pixel_size(GtkImage* image, int pixel_size);

// ScrolledWindow
typedef struct _GtkScrolledWindow GtkScrolledWindow;
GtkWidget* gtk_scrolled_window_new(void);
void gtk_scrolled_window_set_child(GtkScrolledWindow* scrolled_window, GtkWidget* child);

// TextView
typedef struct _GtkTextView GtkTextView;
typedef struct _GtkTextBuffer GtkTextBuffer;
typedef struct _GtkTextIter GtkTextIter;
typedef enum {
  GTK_WRAP_NONE,
  GTK_WRAP_CHAR,
  GTK_WRAP_WORD,
  GTK_WRAP_WORD_CHAR
} GtkWrapMode;

GtkWidget* gtk_text_view_new(void);
GtkTextBuffer* gtk_text_view_get_buffer(GtkTextView* text_view);
void gtk_text_view_set_buffer(GtkTextView* text_view, GtkTextBuffer* buffer);
void gtk_text_buffer_set_text(GtkTextBuffer* buffer, const char* text, int len);
void gtk_text_buffer_get_start_iter(GtkTextBuffer* buffer, GtkTextIter* iter);
void gtk_text_buffer_get_end_iter(GtkTextBuffer* buffer, GtkTextIter* iter);
char* gtk_text_buffer_get_text(GtkTextBuffer* buffer, GtkTextIter* start, GtkTextIter* end, gboolean include_hidden_chars);
void gtk_text_view_set_editable(GtkTextView* text_view, gboolean setting);
void gtk_text_view_set_cursor_visible(GtkTextView* text_view, gboolean setting);
void gtk_text_view_set_monospace(GtkTextView* text_view, gboolean monospace);
void gtk_text_view_set_wrap_mode(GtkTextView* text_view, GtkWrapMode wrap_mode);


// Entry
typedef struct _GtkEntry GtkEntry;
GtkWidget* gtk_entry_new(void);
const char* gtk_entry_get_text(GtkEntry* entry);
void gtk_entry_set_text(GtkEntry* entry, const char* text);
void gtk_entry_set_placeholder_text(GtkEntry* entry, const char* text);
void gtk_entry_set_visibility(GtkEntry* entry, gboolean visible);
void gtk_entry_set_invisible_char(GtkEntry* entry, char ch);

// Switch
typedef struct _GtkSwitch GtkSwitch;
GtkWidget* gtk_switch_new(void);
gboolean gtk_switch_get_active(GtkSwitch* sw);
void gtk_switch_set_active(GtkSwitch* sw, gboolean active);

// Grid
typedef struct _GtkGrid GtkGrid;
GtkWidget* gtk_grid_new(void);
void gtk_grid_attach(GtkGrid* grid, GtkWidget* child, int column, int row, int width, int height);
void gtk_grid_set_row_spacing(GtkGrid* grid, guint spacing);
void gtk_grid_set_column_spacing(GtkGrid* grid, guint spacing);
void gtk_grid_set_row_homogeneous(GtkGrid* grid, gboolean homogeneous);
void gtk_grid_set_column_homogeneous(GtkGrid* grid, gboolean homogeneous);

// ListBox
typedef struct _GtkListBox GtkListBox;
GtkWidget* gtk_list_box_new(void);
void gtk_list_box_append(GtkListBox* list_box, GtkWidget* child);
typedef enum {
  GTK_SELECTION_NONE,
  GTK_SELECTION_SINGLE,
  GTK_SELECTION_BROWSE,
  GTK_SELECTION_MULTIPLE
} GtkSelectionMode;
void gtk_list_box_set_selection_mode(GtkListBox* list_box, GtkSelectionMode mode);
void gtk_list_box_set_show_separators(GtkListBox* list_box, gboolean show_separators);

// ListBoxRow
typedef struct _GtkListBoxRow GtkListBoxRow;
GtkWidget* gtk_list_box_row_new(void);
void gtk_list_box_row_set_child(GtkListBoxRow* list_box_row, GtkWidget* child);
void gtk_list_box_row_set_activatable(GtkListBoxRow* list_box_row, gboolean activatable);
void gtk_list_box_row_set_selectable(GtkListBoxRow* list_box_row, gboolean selectable);

// Revealer
typedef struct _GtkRevealer GtkRevealer;
typedef enum {
  GTK_REVEALER_TRANSITION_TYPE_NONE,
  GTK_REVEALER_TRANSITION_TYPE_CROSSFADE,
  GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT,
  GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT,
  GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP,
  GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN
} GtkRevealerTransitionType;
GtkWidget* gtk_revealer_new(void);
void gtk_revealer_set_child(GtkRevealer* revealer, GtkWidget* child);
gboolean gtk_revealer_get_reveal_child(GtkRevealer* revealer);
void gtk_revealer_set_reveal_child(GtkRevealer* revealer, gboolean reveal_child);
void gtk_revealer_set_transition_type(GtkRevealer* revealer, GtkRevealerTransitionType transition);
void gtk_revealer_set_transition_duration(GtkRevealer* revealer, guint duration);

// Stack
typedef struct _GtkStack GtkStack;
typedef enum {
  GTK_STACK_TRANSITION_TYPE_NONE,
  GTK_STACK_TRANSITION_TYPE_CROSSFADE,
  GTK_STACK_TRANSITION_TYPE_SLIDE_RIGHT,
  GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT,
  GTK_STACK_TRANSITION_TYPE_SLIDE_UP,
  GTK_STACK_TRANSITION_TYPE_SLIDE_DOWN,
  GTK_STACK_TRANSITION_TYPE_SLIDE_LEFT_RIGHT,
  GTK_STACK_TRANSITION_TYPE_SLIDE_UP_DOWN
} GtkStackTransitionType;
GtkWidget* gtk_stack_new(void);
void gtk_stack_add_titled(GtkStack* stack, GtkWidget* child, const char* name, const char* title);
void gtk_stack_set_transition_type(GtkStack* stack, GtkStackTransitionType transition);
void gtk_stack_set_transition_duration(GtkStack* stack, guint duration);

// StackSidebar
typedef struct _GtkStackSidebar GtkStackSidebar;
GtkWidget* gtk_stack_sidebar_new(void);
void gtk_stack_sidebar_set_stack(GtkStackSidebar* sidebar, GtkStack* stack);

// Separator
GtkWidget* gtk_separator_new(GtkOrientation orientation);

// Spinner
typedef struct _GtkSpinner GtkSpinner;
GtkWidget* gtk_spinner_new(void);
void gtk_spinner_start(GtkSpinner* spinner);
void gtk_spinner_stop(GtkSpinner* spinner);

// InfoBar
typedef struct _GtkInfoBar GtkInfoBar;
typedef enum {
  GTK_MESSAGE_INFO,
  GTK_MESSAGE_WARNING,
  GTK_MESSAGE_ERROR,
  GTK_MESSAGE_QUESTION,
  GTK_MESSAGE_OTHER
} GtkMessageType;
GtkWidget* gtk_info_bar_new(void);
void gtk_info_bar_add_child(GtkInfoBar* info_bar, GtkWidget* widget);
GtkWidget* gtk_info_bar_add_button(GtkInfoBar* info_bar, const char* button_text, int response_id);
void gtk_info_bar_set_message_type(GtkInfoBar* info_bar, GtkMessageType message_type);
void gtk_info_bar_set_show_close_button(GtkInfoBar* info_bar, gboolean setting);

// AspectFrame
typedef struct _GtkAspectFrame GtkAspectFrame;
GtkWidget* gtk_aspect_frame_new(float xalign, float yalign, float ratio, gboolean obey_child);
void gtk_aspect_frame_set_child(GtkAspectFrame* aspect_frame, GtkWidget* child);

// Calendar
typedef struct _GtkCalendar GtkCalendar;
typedef struct _GDateTime GDateTime;
GtkWidget* gtk_calendar_new(void);
GDateTime* gtk_calendar_get_date(GtkCalendar* calendar);
void gtk_calendar_select_day(GtkCalendar* calendar, GDateTime* date);

// LinkButton
typedef struct _GtkLinkButton GtkLinkButton;
GtkWidget* gtk_link_button_new(const char* uri);
GtkWidget* gtk_link_button_new_with_label(const char* uri, const char* label);
const char* gtk_link_button_get_uri(GtkLinkButton* link_button);
void gtk_link_button_set_uri(GtkLinkButton* link_button, const char* uri);
