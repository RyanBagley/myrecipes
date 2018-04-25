require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "ryan", email: "ryan@exmaple.com",
                        password: "password", password_confirmation: "password")
  end
end

test "reject an invalid edit" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chefname: " ", email: "ryan@example.com" } }
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "accept valid signup" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chefname: "ryan1", email: "ryan1@example.com" } }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "ryan1", @chef.chefname
    assert_match "ryan1@example.com", @chef.email
  end