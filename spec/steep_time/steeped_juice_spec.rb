require 'spec_helper'

describe SteepTime::SteepedJuice do
  before :each do
    @test_steeped_juice = SteepTime::SteepedJuice.new
    @now_time = Time.new
  end

  context 'when a SteepedJuice is initialized' do
    it 'returns false when finished_steeping? is called' do
      expect(@test_steeped_juice.finished_steeping?).to eq(false)
    end
  end
  context 'when a steep is started' do
    it 'records the start time of the steep' do
      @test_steeped_juice.start_steep(@now_time)
      expect(@test_steeped_juice.steep_start_time).to eq(@now_time)
    end
    it 'sets the steep state from false to true' do
      expect(@test_steeped_juice.is_steeping).to eq(false)
      @test_steeped_juice.start_steep
      expect(@test_steeped_juice.is_steeping).to eq(true)
    end
    it 'returns false when finished_steeping? is called' do
      @test_steeped_juice.start_steep
      expect(@test_steeped_juice.finished_steeping?).to eq(false)
    end
  end
  context 'when a steep is ended' do
    it 'records the end time of the steep' do
      start_time = Time.new(2015,01,01)
      end_time = Time.new(2015,01,15)

      @test_steeped_juice.start_steep(start_time)
      @test_steeped_juice.end_steep(end_time)
      expect(@test_steeped_juice.steep_end_time).to eq(end_time)
    end
    it 'sets the steep state from true to false' do
      @test_steeped_juice.start_steep
      expect(@test_steeped_juice.is_steeping).to eq(true)
      @test_steeped_juice.end_steep
      expect(@test_steeped_juice.is_steeping).to eq(false)
    end
    it 'raises an exception if a steep is ended before it is actually steeping' do
      expect { @test_steeped_juice.end_steep }.to raise_error(SteepTime::SteepNotStarted)
    end
    it 'raises an exception if a steep is ended before it began' do
      start_time = Time.new(2015,01,15)
      end_time = Time.new(2015,01,01)

      @test_steeped_juice.start_steep(start_time)
      expect { @test_steeped_juice.end_steep(end_time) }.to raise_error(SteepTime::TimeParadox)
    end
    it 'marks the juice as finished_steeping if the end_steep call is succesful' do
      @test_steeped_juice.start_steep
      @test_steeped_juice.end_steep
      expect(@test_steeped_juice.finished_steeping?).to eq(true)
    end
  end
  context '#total_steep_time' do
    it 'returns the difference between the steep start and end times' do
      start_time = Time.new(2015,01,01)
      end_time = Time.new(2015,01,15)

      @test_steeped_juice.start_steep(start_time)
      @test_steeped_juice.end_steep(end_time)
      expect(@test_steeped_juice.total_steep_time).to eq('336:00:00')
    end
  end
end
