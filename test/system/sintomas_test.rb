require "application_system_test_case"

class SintomasTest < ApplicationSystemTestCase
  setup do
    @sintoma = sintomas(:one)
  end

  test "visiting the index" do
    visit sintomas_url
    assert_selector "h1", text: "Sintomas"
  end

  test "creating a Sintoma" do
    visit sintomas_url
    click_on "New Sintoma"

    check "Agueusia" if @sintoma.agueusia
    check "Anosmia" if @sintoma.anosmia
    check "Cefalea" if @sintoma.cefalea
    check "Cianosis" if @sintoma.cianosis
    check "Diabetes" if @sintoma.diabetes
    check "Diarrea" if @sintoma.diarrea
    check "Disnea" if @sintoma.disnea
    check "Dolorabdominal" if @sintoma.dolorabdominal
    check "Fiebre" if @sintoma.fiebre
    check "Hipertension" if @sintoma.hipertension
    fill_in "Inicio sintomas", with: @sintoma.inicio_sintomas
    check "Mialgia" if @sintoma.mialgia
    check "Odinofagia" if @sintoma.odinofagia
    fill_in "Otras", with: @sintoma.otras
    check "Taquipnea" if @sintoma.taquipnea
    check "Tos" if @sintoma.tos
    click_on "Create Sintoma"

    assert_text "Sintoma was successfully created"
    click_on "Back"
  end

  test "updating a Sintoma" do
    visit sintomas_url
    click_on "Edit", match: :first

    check "Agueusia" if @sintoma.agueusia
    check "Anosmia" if @sintoma.anosmia
    check "Cefalea" if @sintoma.cefalea
    check "Cianosis" if @sintoma.cianosis
    check "Diabetes" if @sintoma.diabetes
    check "Diarrea" if @sintoma.diarrea
    check "Disnea" if @sintoma.disnea
    check "Dolorabdominal" if @sintoma.dolorabdominal
    check "Fiebre" if @sintoma.fiebre
    check "Hipertension" if @sintoma.hipertension
    fill_in "Inicio sintomas", with: @sintoma.inicio_sintomas
    check "Mialgia" if @sintoma.mialgia
    check "Odinofagia" if @sintoma.odinofagia
    fill_in "Otras", with: @sintoma.otras
    check "Taquipnea" if @sintoma.taquipnea
    check "Tos" if @sintoma.tos
    click_on "Update Sintoma"

    assert_text "Sintoma was successfully updated"
    click_on "Back"
  end

  test "destroying a Sintoma" do
    visit sintomas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sintoma was successfully destroyed"
  end
end
