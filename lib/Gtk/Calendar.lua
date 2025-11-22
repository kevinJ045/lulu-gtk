
local {} ->
  @GtkWidgetNative('gtk_calendar_new')
  @GtkWidgetWithOptions({
    day = -1,
    month = -1,
    year = -1,
    show_heading = -1,
    show_day_names = -1,
    show_week_numbers = -1
  }, 'gtk_calendar', "GtkCalendar*")
  Calendar:GtkWidget
do
  @GtkWidgetOperation({
    operation = 'gtk_calendar_get_date',
    cast = 'GtkCalendar*',
    arguments = {},
  })
  function Calendar:get_date()
  end

  @GtkWidgetOperation({
    operation = 'gtk_calendar_select_day',
    cast = 'GtkCalendar*',
    arguments = {true},
  })
  @GtkWidgetReturnSelf()
  function Calendar:select_day(date)
  end
end

return Calendar
