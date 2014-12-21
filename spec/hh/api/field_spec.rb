#encoding: utf-8

require 'spec_helper'

describe HH::API::Field do
  let(:client) { HH::Client.new }

  describe "#fields" do
    before do
      stub_get("field/all").to_return(body: fixture("field_all.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.fields
      expect(a_get("field/all")).to have_been_made
    end

    it "returns the requested fields" do
      fields = client.fields
      expect(fields).to be_an Array
      expect(fields.first).to be_an Hash
      expect(fields.first[:name]).to eq "Любая"
    end
  end

  describe "field" do
    before do
      stub_get("field/2").to_return(body: fixture("field.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requested line the correct resource" do
      client.field(2)
      expect(a_get("field/2")).to have_been_made
    end

    it "returns the requested field id" do
      field = client.field(2)
      expect(field).to be_an Hash
      expect(field[:name]).to eq "Бухгалтерия, управленческий учет, финансы предприятия"
    end
  end
end