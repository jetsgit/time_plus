module IncrementTime

  class AddTime
    def  initialize(time, add_minutes)
      @time_current = time
      @add_minutes = add_minutes
      @hours, @minutes  = 0, 0
      @period = "none"
      @errors = []
    end

    def parse_time
      arr = [@time_current]
      arr.grep(/(\d\d?):(\d\d?).?(am|pm)/i) { @hours = $1.to_i, @minutes = $2.to_i, @period = $3.downcase }
      binding.pry
      if correct_time_input?
        display_minutes = minutes_convert.last
        display_hours   = hours_convert.last == 0 ? 12 : hours_convert.last
        puts "#{display_hours}:#{display_minutes} #{am_or_pm}"
      else
        output_errors
      end
    end

    private

    def  correct_time_input?
      # binding.pry
      if  @period != "am" && @period != "pm" 
        @errors << "Must indicate am or pm."
      end
      # binding.pry
      if ( @hours[0] > 12 )  
        @errors << "Time hours must be entered in 12 hour format."
      end
      if @minutes > 59 || @minutes == nil  
        @errors << "Minutes must not exceed 60."
      end
      true unless @errors.any?
    end

    def  total_minutes
      @minutes + @add_minutes
    end

    def minutes_convert
      total_minutes.divmod 60
    end

    def  total_hours
      @hours[0] + minutes_convert.first
    end

    def hours_convert
      total_hours.divmod 12
    end

    def  am_or_pm
      if ( total_hours < 12 || hours_convert.first.even ) 
        @period
      else
        @period == "am" ? "pm" : "am"
      end
    end

    def  output_errors
      @errors.each do |error|
        puts "#{error}\n"
      end  
    end
  end
end
