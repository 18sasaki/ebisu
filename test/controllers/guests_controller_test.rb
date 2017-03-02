require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guest = guests(:one)
  end

  test "should get index" do
    get guests_url
    assert_response :success
  end

  test "should get new" do
    get new_guest_url
    assert_response :success
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post guests_url, params: { guest: { address: @guest.address, attend_bit: @guest.attend_bit, child_bit: @guest.child_bit, eri_message: @guest.eri_message, guest_message: @guest.guest_message, host_bit: @guest.host_bit, id_hash: @guest.id_hash, invite_message: @guest.invite_message, name: @guest.name, phone_number: @guest.phone_number, post_number: @guest.post_number, sex_bit: @guest.sex_bit, tomo_message: @guest.tomo_message } }
    end

    assert_redirected_to guest_url(Guest.last)
  end

  test "should show guest" do
    get guest_url(@guest)
    assert_response :success
  end

  test "should get edit" do
    get edit_guest_url(@guest)
    assert_response :success
  end

  test "should update guest" do
    patch guest_url(@guest), params: { guest: { address: @guest.address, attend_bit: @guest.attend_bit, child_bit: @guest.child_bit, eri_message: @guest.eri_message, guest_message: @guest.guest_message, host_bit: @guest.host_bit, id_hash: @guest.id_hash, invite_message: @guest.invite_message, name: @guest.name, phone_number: @guest.phone_number, post_number: @guest.post_number, sex_bit: @guest.sex_bit, tomo_message: @guest.tomo_message } }
    assert_redirected_to guest_url(@guest)
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete guest_url(@guest)
    end

    assert_redirected_to guests_url
  end
end
