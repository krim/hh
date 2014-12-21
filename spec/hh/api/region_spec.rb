#encoding: utf-8

require 'spec_helper'

describe HH::API::Region do
  let(:client) { HH::Client.new }

  describe "#regions" do
    before do
      stub_get("areas").to_return(body: fixture("regions_all.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.regions
      expect(a_get("areas")).to have_been_made
    end

    it "returns the requested regions all" do
      regions = client.regions
      expect(regions).to be_an Array
      expect(regions.first).to be_an Hash
      expect(regions.first[:name]).to eq "Москва"
    end
  end

  describe "#region" do
    before do
      stub_get("areas/1").to_return(body: fixture("region.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.region(1)
      expect(a_get("areas/1")).to have_been_made
    end

    it "returns the requested regions all" do
      region = client.region(1)
      expect(region).to be_an Hash
      expect(region[:name]).to eq "Москва"
    end
  end
end