require 'test_helper'

class UsersNewTest < ActionDispatch::IntegrationTest

  test "invalid new information" do
    get '/users/new'
    assert_no_difference 'User.count' do
      post '/users', user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end
  
end
