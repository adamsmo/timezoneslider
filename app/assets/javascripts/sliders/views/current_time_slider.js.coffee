@Sliders.CurrentTimeSliderView = Sliders.CurrentTimeView.extend
  classNames: ['currentTimeSlider']
  
  template: SC.Handlebars.compile("{{hour}}<br/>{{minutes}}")
  
  offset: 0
  
  calculateOffset: (->
    @set( "offset", @get("offset") + 1 )
  ).observes("timer")
  
  startPosition: (->
    margin_left = 50
    slider_width = 19
    margin_left - slider_width/2  
  ).property()

  minutesTodayBinding: "Sliders.LocalTimeController.minutesToday"

  style: (->    
    #shift = Sliders.LocalTimeController.getHoursShift( @get("timezone") )
    #time = ( @get("hours") * 60 )  + @get("minutes") + ( shift * 60 ) + @get("offset") * 2
    time = @get("minutesToday")
    panel_width = 790
    minutes_per_day = 60 * 24
    pos = time * panel_width / minutes_per_day
    "left: " + (@get("startPosition") + pos) + "px"
  ).property("offset")
  
  attributeBindings: ['style']
