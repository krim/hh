#encoding: utf-8

require 'spec_helper'

describe "HH::API::Employment" do
  let(:client) { HH::Client.new }

  describe "#employment" do

    before do
      stub_get("employment").to_return(body: fixture("employment.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.employment
      expect(a_get("employment")).to have_been_made
    end

    it "returns the requested employments" do
      employment = client.employment
      expect(employment).to be_an Array
      expect(employment.first).to be_an Hash
      expect(employment.first[:name]).to eq "Полная занятость"
    end
  end
end