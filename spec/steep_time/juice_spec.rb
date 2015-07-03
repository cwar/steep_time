require 'spec_helper'

describe SteepTime::Juice do
  context 'when creating a juice object' do
    it 'populates brand when initialized with brand argument' do
      test_juice = SteepTime::Juice.new(:brand => 'test_brand')
      expect(test_juice.brand).to eq('test_brand')
    end

    it 'populates flavor when initialized with flavor argument' do
      test_juice = SteepTime::Juice.new(:flavor => 'test_flavor')
      expect(test_juice.flavor).to eq('test_flavor')
    end

    it 'populates volume_ml when initialized with volume_ml argument' do
      test_juice = SteepTime::Juice.new(:volume_ml => 'test_volume')
      expect(test_juice.volume_ml).to eq('test_volume')
    end

    it 'populates nicotine_mg when initialized with nicotine_mg argument' do
      test_juice = SteepTime::Juice.new(:nicotine_mg => 'test_nicotine_mg')
      expect(test_juice.nicotine_mg).to eq('test_nicotine_mg')
    end
  end
end
