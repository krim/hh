#encoding: utf-8

require 'spec_helper'

describe HH::API::Metro do
  let(:client) { HH::Client.new }

  describe "#metro" do

    before do
      stub_get("metro").to_return(body: fixture("metro.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.metro
      expect(a_get("metro")).to have_been_made
    end

    it "returns the requested metro list" do
      metro = client.metro
      expect(metro).to be_an Array
      expect(metro.first).to be_an Hash
      expect(metro.first[:name]).to eq "Калининская"
    end
  end

  describe "metro_line" do

    before do
      stub_get("metro/6").to_return(body: fixture("metro_line.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requested line the correct resource" do
      client.metro_line(6)
      expect(a_get("metro/6")).to have_been_made
    end

    it "returns the requested metro line" do
      metro_line = client.metro_line(6)
      expect(metro_line).to be_an Hash
      expect(metro_line[:id]) == 6
    end
  end

  describe "metro_station" do

    before do
      stub_get("metro/6,8").to_return(body: fixture("metro_station.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requested station the correct resource" do
      client.metro_station(6, 8)
      expect(a_get("metro/6,8")).to have_been_made
    end

    it "returns the requested metro station" do
      metro_station = client.metro_station(6, 8)
      expect(metro_station).to be_an Hash
      expect(metro_station[:name]).to eq "Калужско-Рижская"
    end
  end
end