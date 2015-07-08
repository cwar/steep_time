module SteepTime
  class SteepedJuice < Juice
    attr_accessor :steep_start_time, :steep_end_time
    attr_reader :is_steeping
    def initialize(args = {})
      super(args)
      @is_steeping = false
    end
    # Might want to make a steep schedule class so this class
    # doesn't have to worry about start/stop times
    def start_steep(start_time = Time.new)
      @steep_start_time = start_time
      @is_steeping = true
    end

    def end_steep(end_time = Time.new)
      fail SteepTime::SteepNotStarted if @steep_start_time.nil?
      fail SteepTime::TimeParadox if @steep_start_time > end_time
      @steep_end_time = end_time
      @is_steeping = false
    end

    def finished_steeping?
      !@steep_end_time.nil?
    end

    def total_steep_time(end_time = Time.new)
      fail SteepTime::SteepNotStarted if @steep_start_time.nil?
      steep_end_time = @steep_end_time || end_time
      time_diff(@steep_start_time, steep_end_time)
    end

    def time_diff(start_time, end_time)
      seconds_diff = (start_time - end_time).to_i.abs

      hours = seconds_diff / 3600
      seconds_diff -= hours * 3600

      minutes = seconds_diff / 60
      seconds_diff -= minutes * 60

      seconds = seconds_diff

      "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
    end
  end
end
