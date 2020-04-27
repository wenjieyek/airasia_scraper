require "spec_helper"

RSpec.describe AirasiaScraper do
  it "has a version number" do
    expect(AirasiaScraper::VERSION).not_to be nil
  end

  it "returns correct flight data hash" do
    c = AirasiaScraper::Client.new("2021-01-02", "KUL", "JHB")
    flight_data_hash = c.flight_data.first

    expect(flight_data_hash[:depart_time]).not_to be nil
    expect(flight_data_hash[:arrive_time]).not_to be nil
    expect(flight_data_hash[:fare]).to be_a Numeric
    expect(flight_data_hash[:link]).to eq("https://www.airasia.com/select/en/gb/KUL/JHB/2021-01-02/N/1/0/0/O/N/MYR/ST?key=ba68bcc7-87d7-11ea-8cc4-c9875338e7591587917120.34")
  end
end
