require "application_system_test_case"

class TrabajadorsTest < ApplicationSystemTestCase
  setup do
    @trabajador = trabajadors(:one)
  end

  test "visiting the index" do
    visit trabajadors_url
    assert_selector "h1", text: "Trabajadors"
  end

  test "creating a Trabajador" do
    visit trabajadors_url
    click_on "New Trabajador"

    fill_in "Comuna", with: @trabajador.comuna
    fill_in "Division", with: @trabajador.division
    fill_in "Edad", with: @trabajador.edad
    fill_in "Empresa", with: @trabajador.empresa
    fill_in "Fecha nac", with: @trabajador.fecha_nac
    fill_in "Nacionalidad", with: @trabajador.nacionalidad
    fill_in "Prevision", with: @trabajador.prevision
    fill_in "Region", with: @trabajador.region
    fill_in "Sexo", with: @trabajador.sexo
    fill_in "Tipo trabajador", with: @trabajador.tipo_trabajador
    click_on "Create Trabajador"

    assert_text "Trabajador was successfully created"
    click_on "Back"
  end

  test "updating a Trabajador" do
    visit trabajadors_url
    click_on "Edit", match: :first

    fill_in "Comuna", with: @trabajador.comuna
    fill_in "Division", with: @trabajador.division
    fill_in "Edad", with: @trabajador.edad
    fill_in "Empresa", with: @trabajador.empresa
    fill_in "Fecha nac", with: @trabajador.fecha_nac
    fill_in "Nacionalidad", with: @trabajador.nacionalidad
    fill_in "Prevision", with: @trabajador.prevision
    fill_in "Region", with: @trabajador.region
    fill_in "Sexo", with: @trabajador.sexo
    fill_in "Tipo trabajador", with: @trabajador.tipo_trabajador
    click_on "Update Trabajador"

    assert_text "Trabajador was successfully updated"
    click_on "Back"
  end

  test "destroying a Trabajador" do
    visit trabajadors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trabajador was successfully destroyed"
  end
end
