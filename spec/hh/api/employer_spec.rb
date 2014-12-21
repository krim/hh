#encoding: utf-8

require 'spec_helper'

describe HH::API::Employer do
  let(:client) { HH::Client.new }

  describe "#employer" do
    before do
      stub_get("employer").to_return(body: fixture("employer.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.employer
      expect(a_get("employer")).to have_been_made
    end

    it "returns the requested metro list" do
      employer = client.employer
      expect(employer).to be_an Hash
      expect(employer[:name]).to eq "Национальный резервный банк, АКБ"
    end
  end
end