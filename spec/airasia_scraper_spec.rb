require "spec_helper"

RSpec.describe AirasiaScraper do
  it "has a version number" do
    expect(AirasiaScraper::VERSION).not_to be nil
  end

  it "returns correct flight data hash" do
    c = AirasiaScraper::Client.new("2021-01-02", "KUL", "JHB")
    flight_data_hash = c.flight_data

    expect(c.flight_data.first[:depart_time]).to eq("07:15")
    expect(c.flight_data.first[:arrive_time]).to eq("08:15")
    expect(c.flight_data.first[:fare]).to eq("84.30")
    expect(c.flight_data.first[:link]).to eq("https://www.airasia.com/select/en/gb/KUL/JHB/2021-01-02/N/1/0/0/O/N/MYR/ST?key=ba68bcc7-87d7-11ea-8cc4-c9875338e7591587917120.34")
  end
end
