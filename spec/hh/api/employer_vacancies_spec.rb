#encoding: utf-8

require 'spec_helper'

describe HH::API::EmployerVacancies do
  let(:client) { HH::Client.new }
  let(:employer_id) { 7135086 }
  let(:request_path) { "employers/#{employer_id}/vacancies" }

  describe "#employer_vacancies" do
    before do
      stub_get(request_path).to_return(body: fixture("vacancy_employer.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.employer_vacancies(employer_id)
      expect(a_get(request_path)).to have_been_made
    end

    it "returns the requested metro list" do
      employer_vacancies = client.employer_vacancies(employer_id)
      expect(employer_vacancies).to be_an Array
      expect(employer_vacancies.first).to be_an Hash
      expect(employer_vacancies.first[:name]).to eq "Java разработчик (Минск)"
    end
  end
end