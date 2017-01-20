require "rails_helper"

RSpec.describe ApiKey, type: :model do
  context "scope" do
    describe '#api_key' do
      it "create an instance with 32 characters" do
        api_key = FactoryGirl.create(:api_key)

        expect(api_key.access_token.length).to eq(32)
      end
    end
  end
end
