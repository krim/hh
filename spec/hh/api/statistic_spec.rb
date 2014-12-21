#encoding: utf-8

require 'spec_helper'

describe HH::API::Statistic do
  let(:client) { HH::Client.new }

  describe "#statistic" do
    before do
      stub_get("statistic").to_return(body: fixture("statistic.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.statistic
      expect(a_get("statistic")).to have_been_made
    end

    it "returns the requested statistic list" do
      statistic = client.statistic
      expect(statistic).to be_an Hash
      expect(statistic[:invitations]) == 378520
    end
  end
end
