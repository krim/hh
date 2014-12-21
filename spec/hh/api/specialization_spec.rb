#encoding: utf-8

require 'spec_helper'

describe HH::API::Specialization do
  let(:client) { HH::Client.new }

  describe "#specializations" do

    before do
      stub_get("specialization/all").to_return(body: fixture("specialization_all.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.specializations
      expect(a_get("specialization/all")).to have_been_made
    end

    it "returns the requested specializations" do
      specializations = client.specializations
      expect(specializations).to be_an Array
      expect(specializations.first).to be_an Hash
      expect(specializations.first[:name]).to eq "Маркшейдер"
    end
  end

  describe "#specialization" do

    before do
      stub_get("specialization/474").to_return(body: fixture("specialization.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.specialization(474)
      expect(a_get("specialization/474")).to have_been_made
    end

    it "returns the requested specialization" do
      specializations = client.specialization(474)
      expect(specializations).to be_an Hash
      expect(specializations[:id]) == 474
    end
  end
end