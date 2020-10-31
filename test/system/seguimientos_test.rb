require "application_system_test_case"

class SeguimientosTest < ApplicationSystemTestCase
  setup do
    @seguimiento = seguimientos(:one)
  end

  test "visiting the index" do
    visit seguimientos_url
    assert_selector "h1", text: "Seguimientos"
  end

  test "creating a Seguimiento" do
    visit seguimientos_url
    click_on "New Seguimiento"

    fill_in "Estado seguimiento", with: @seguimiento.estado_seguimiento
    fill_in "Estadoegreso", with: @seguimiento.estadoegreso
    fill_in "Evolucion", with: @seguimiento.evolucion
    check "Falleceresp" if @seguimiento.falleceresp
    check "Hospitalizacion" if @seguimiento.hospitalizacion
    fill_in "References", with: @seguimiento.references
    fill_in "Tipo aislamiento", with: @seguimiento.tipo_aislamiento
    check "Ventilacion" if @seguimiento.ventilacion
    click_on "Create Seguimiento"

    assert_text "Seguimiento was successfully created"
    click_on "Back"
  end

  test "updating a Seguimiento" do
    visit seguimientos_url
    click_on "Edit", match: :first

    fill_in "Estado seguimiento", with: @seguimiento.estado_seguimiento
    fill_in "Estadoegreso", with: @seguimiento.estadoegreso
    fill_in "Evolucion", with: @seguimiento.evolucion
    check "Falleceresp" if @seguimiento.falleceresp
    check "Hospitalizacion" if @seguimiento.hospitalizacion
    fill_in "References", with: @seguimiento.references
    fill_in "Tipo aislamiento", with: @seguimiento.tipo_aislamiento
    check "Ventilacion" if @seguimiento.ventilacion
    click_on "Update Seguimiento"

    assert_text "Seguimiento was successfully updated"
    click_on "Back"
  end

  test "destroying a Seguimiento" do
    visit seguimientos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Seguimiento was successfully destroyed"
  end
end
