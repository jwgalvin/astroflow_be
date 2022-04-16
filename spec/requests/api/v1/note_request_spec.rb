require 'rails_helper'

RSpec.describe "Create Note" do

  it "create note endpoint" do

    user = User.create!(name: 'Dani', email: 'simpboi@gmail.com', date_of_birth: Date.today)

    note_params = { date: Date.today,
                    message: 'I am feeling extra sick today, I am getting cramps left and right.',
                    user_id: user.id
                  }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users/#{user.id}/notes", headers: headers, params: JSON.generate(note: note_params)

    expect(response).to be_successful

    note = JSON.parse(response.body, symbolize_names: true)

    expect(note[:message]).to eq('I am feeling extra sick today, I am getting cramps left and right.')
  end

  it "can call a note by date" do

    user = User.create!(name: 'Dani', email: 'simpboi@gmail.com', date_of_birth: Date.today)

    note = user.notes.create!(date: "2022-04-12", message: 'I am feeling great today', user_id: user.id)

    get "/api/v1/users/#{user.id}/notes?date=2022-04-12"

    expect(response).to be_successful

    note = JSON.parse(response.body, symbolize_names: true)

    expect(note[:message]).to eq('I am feeling great today')
  end
end
