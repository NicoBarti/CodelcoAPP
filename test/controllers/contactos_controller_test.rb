require 'test_helper'

class ContactosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contacto = contactos(:one)
  end

  test "should get index" do
    get contactos_url
    assert_response :success
  end

  test "should get new" do
    get new_contacto_url
    assert_response :success
  end

  test "should create contacto" do
    assert_difference('Contacto.count') do
      post contactos_url, params: { contacto: { episode_id: @contacto.episode_id, fecha_investigacion: @contacto.fecha_investigacion, parentesco: @contacto.parentesco, tipo_contacto: @contacto.tipo_contacto } }
    end

    assert_redirected_to contacto_url(Contacto.last)
  end

  test "should show contacto" do
    get contacto_url(@contacto)
    assert_response :success
  end

  test "should get edit" do
    get edit_contacto_url(@contacto)
    assert_response :success
  end

  test "should update contacto" do
    patch contacto_url(@contacto), params: { contacto: { episode_id: @contacto.episode_id, fecha_investigacion: @contacto.fecha_investigacion, parentesco: @contacto.parentesco, tipo_contacto: @contacto.tipo_contacto } }
    assert_redirected_to contacto_url(@contacto)
  end

  test "should destroy contacto" do
    assert_difference('Contacto.count', -1) do
      delete contacto_url(@contacto)
    end

    assert_redirected_to contactos_url
  end
end
