require 'rails_helper'

RSpec.describe "Create User" do

  it "create user endpoint" do
    user_params = { name: 'test',
                    email: 'dopeboi69420@aol.com',
                    date_of_birth: Date.today
                  }

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:name]).to eq('test')
  end
end
