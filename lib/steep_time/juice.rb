module SteepTime
  class Juice
    attr_accessor :brand, :flavor, :volume_ml, :nicotine_mg

    def initilize(args)
      @brand = args[:brand]
      @flavor = args[:flavor]
      @volume_ml = args[:volume_ml]
      @nicotine_mg = args[:nicotine_mg]
    end
  end
end
