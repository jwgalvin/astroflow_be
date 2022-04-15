require 'rails_helper'

RSpec.describe "Create Note" do

  it "create user endpoint" do

    user = User.create!(name: 'Dani', email: 'simpboi@gmail.com', date_of_birth: Date.today)

    note_params = { date: Date.today,
                    message: 'I am feeling extra sick today, I am getting cramps left and right.'
                  }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users/#{user.id}/notes", headers: headers, params: JSON.generate(note: note_params)

    expect(user.notes.first.message).to eq('I am feeling extra sick today, I am getting cramps left and right.')
  end

end
