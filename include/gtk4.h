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