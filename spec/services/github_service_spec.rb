require 'rails_helper'

describe GithubService do
  context 'Class Methods' do
    context '.initialize(user)' do
      it 'returns a valid object' do
        VCR.use_cassette('.initialize') do

          user = User.find_or_create_from_auth(stub_omniauth)
          require 'pry'; binding.pry

          service = GithubService.new(user.nickname)

          expect(service).to be_a GithubService
        end
      end
    end
  end
end
