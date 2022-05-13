require 'rails_helper'

RSpec.describe 'Create User' do
  it 'has user information' do
    user_params = { name: 'test',
                    email: 'dopeboi69420@aol.com',
                    date_of_birth: Date.today }
  end
end
