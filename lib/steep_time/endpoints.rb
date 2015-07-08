require 'sinatra'

module SteepTime
  class App < Sinatra::Base
    get '/' do
      puts 'Vape life.'
    end
  end
end
