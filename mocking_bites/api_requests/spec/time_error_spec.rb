require_relative '../lib/time_error.rb'

RSpec.describe TimeError do
  it "calls an API to get the current world time and returns the difference between that and computer time" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI("https://worldtimeapi.org/api/ip")
    ).and_return('{"abbreviation":"GMT","client_ip":"82.39.41.57","datetime":"2023-01-24T09:50:43.680976+00:00","day_of_week":2,"day_of_year":24,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1674553843,"utc_datetime":"2023-01-24T09:50:43.680976+00:00","utc_offset":"+00:00","week_number":4}')
    time_error = TimeError.new(fake_requester)
    #have to mock both the requester and Time
    current_time = Time.new(2023, 1, 24, 9, 50, 43)
    expect(time_error.error(current_time)).to eq 0.680976
  end
end