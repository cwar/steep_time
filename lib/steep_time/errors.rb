module SteepTime
  Error = Class.new(StandardError)
  SteepNotStarted = Class.new(SteepTime::Error)
  TimeParadox = Class.new(SteepTime::Error)
end
