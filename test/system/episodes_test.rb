require "application_system_test_case"

class EpisodesTest < ApplicationSystemTestCase
  setup do
    @episode = episodes(:one)
  end

  test "visiting the index" do
    visit episodes_url
    assert_selector "h1", text: "Episodes"
  end

  test "creating a Episode" do
    visit episodes_url
    click_on "New Episode"

    fill_in "Cierre", with: @episode.cierre
    fill_in "Contactos laborales", with: @episode.contactos_laborales
    fill_in "Contactos no laborales", with: @episode.contactos_no_laborales
    fill_in "Fecha ingreso", with: @episode.fecha_ingreso
    fill_in "Fin cuarentena", with: @episode.fin_cuarentena
    fill_in "Fin cuarentena codelco", with: @episode.fin_cuarentena_codelco
    fill_in "Folio", with: @episode.folio
    fill_in "Inicio cuarentena", with: @episode.inicio_cuarentena
    fill_in "Inicio sintomas", with: @episode.inicio_sintomas
    fill_in "Origen contagio", with: @episode.origen_contagio
    fill_in "Presentacion", with: @episode.presentacion
    fill_in "Tipo ingreso", with: @episode.tipo_ingreso
    fill_in "Trabajador", with: @episode.trabajador_id
    click_on "Create Episode"

    assert_text "Episode was successfully created"
    click_on "Back"
  end

  test "updating a Episode" do
    visit episodes_url
    click_on "Edit", match: :first

    fill_in "Cierre", with: @episode.cierre
    fill_in "Contactos laborales", with: @episode.contactos_laborales
    fill_in "Contactos no laborales", with: @episode.contactos_no_laborales
    fill_in "Fecha ingreso", with: @episode.fecha_ingreso
    fill_in "Fin cuarentena", with: @episode.fin_cuarentena
    fill_in "Fin cuarentena codelco", with: @episode.fin_cuarentena_codelco
    fill_in "Folio", with: @episode.folio
    fill_in "Inicio cuarentena", with: @episode.inicio_cuarentena
    fill_in "Inicio sintomas", with: @episode.inicio_sintomas
    fill_in "Origen contagio", with: @episode.origen_contagio
    fill_in "Presentacion", with: @episode.presentacion
    fill_in "Tipo ingreso", with: @episode.tipo_ingreso
    fill_in "Trabajador", with: @episode.trabajador_id
    click_on "Update Episode"

    assert_text "Episode was successfully updated"
    click_on "Back"
  end

  test "destroying a Episode" do
    visit episodes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Episode was successfully destroyed"
  end
end
