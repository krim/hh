#encoding: utf-8

require 'spec_helper'

describe HH::API::VacancyEmployer do
  let(:client) { HH::Client.new }
  let(:vacancy_id) { 7135086 }
  let(:request_path) { "vacancy/employer/#{vacancy_id}" }

  describe "#vavancy_employer" do
    before do
      stub_get(request_path).to_return(body: fixture("vacancy_employer.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.vavancy_employer(vacancy_id)
      expect(a_get(request_path)).to have_been_made
    end

    it "returns the requested metro list" do
      vavancy_employer = client.vavancy_employer(vacancy_id)
      expect(vavancy_employer).to be_an Array
      expect(vavancy_employer.first).to be_an Hash
      expect(vavancy_employer.first[:name]).to eq "Java разработчик (Минск)"
    end
  end
end