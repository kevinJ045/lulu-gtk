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

GtkWidget*
gtk_label_new (
  const char* str
);