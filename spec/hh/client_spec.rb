require 'spec_helper'

describe HH::Client do
  let(:connection) { described_class.new.connection }

  describe "default middleware" do
    it "connection use Faraday::Request::Multipart" do
      expect(connection.inspect).to include('Faraday::Request::Multipart')
    end
    it "default adapter is NetHttp" do
      expect(connection.inspect).to include('Faraday::Adapter::NetHttp')
    end
  end
end