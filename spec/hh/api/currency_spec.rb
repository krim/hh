#encoding: utf-8

require 'spec_helper'

describe HH::API::Currency do
  let(:client) { HH::Client.new }

  describe "#currency" do

    before do
      stub_get("currency").to_return(body: fixture("currency.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.currency
      expect(a_get("currency")).to have_been_made
    end

    it "returns the requested currency list" do
      currency = client.currency
      expect(currency).to be_an Array
      expect(currency.first).to be_an Hash
      expect(currency.first[:code]).to eq "RUR"
    end
  end
end