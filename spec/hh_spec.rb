require 'spec_helper'

describe HH do
  describe ".client" do
    it "returns a HH::Client" do
      expect(HH.client).to be_a HH::Client
    end
  end
end