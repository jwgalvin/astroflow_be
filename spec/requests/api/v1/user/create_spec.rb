require 'rails_helper'

RSpec.describe "Create User" do

  it "create user endpoint" do
    user_params = { name: 'test',
                    date_of_birth: Date.today
                  }

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

    user = User.last

    expect(user.name).to eq('test')
  end
end
