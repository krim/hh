#enoding: utf-8

require 'spec_helper'

describe HH::API::Vacancy do
  let(:client) { HH::Client.new }
  let(:vacancy_id) { 2618300 }
  let(:request_path) { "vacancies/#{vacancy_id}" }

  describe "#vacancy" do
    before do
      stub_get(request_path).to_return(body: fixture("vacancy.json"), headers: {content_type: "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      client.vacancy(vacancy_id)
      expect(a_get(request_path)).to have_been_made
    end

    it "returns the requested metro list" do
      vacancy = client.vacancy(vacancy_id)
      expect(vacancy).to be_an Hash
      expect(vacancy[:name]).to eq "Верстальщик"
    end
  end
end