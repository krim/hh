#encoding: utf-8

require 'spec_helper'

describe HH::API::Schedule do
  let(:client) { HH::Client.new }

  describe "#schedule" do

    before do
      stub_get("schedule").to_return(body: fixture("schedule.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.schedule
      expect(a_get("schedule")).to have_been_made
    end

    it "returns the requested schedule list" do
      schedule = client.schedule
      expect(schedule).to be_an Array
      expect(schedule.first).to be_an Hash
      expect(schedule.first[:name]).to eq "Полный день"
    end
  end
end