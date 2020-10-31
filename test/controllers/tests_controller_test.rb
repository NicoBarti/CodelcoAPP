require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test = tests(:one)
  end

  test "should get index" do
    get tests_url
    assert_response :success
  end

  test "should get new" do
    get new_test_url
    assert_response :success
  end

  test "should create test" do
    assert_difference('Test.count') do
      post tests_url, params: { test: { episode_id: @test.episode_id, fecha_antigeno: @test.fecha_antigeno, fecha_pcr: @test.fecha_pcr, fecha_pcr_pac: @test.fecha_pcr_pac, res_antigeno: @test.res_antigeno, res_pcr: @test.res_pcr, res_pcr_pac: @test.res_pcr_pac } }
    end

    assert_redirected_to test_url(Test.last)
  end

  test "should show test" do
    get test_url(@test)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_url(@test)
    assert_response :success
  end

  test "should update test" do
    patch test_url(@test), params: { test: { episode_id: @test.episode_id, fecha_antigeno: @test.fecha_antigeno, fecha_pcr: @test.fecha_pcr, fecha_pcr_pac: @test.fecha_pcr_pac, res_antigeno: @test.res_antigeno, res_pcr: @test.res_pcr, res_pcr_pac: @test.res_pcr_pac } }
    assert_redirected_to test_url(@test)
  end

  test "should destroy test" do
    assert_difference('Test.count', -1) do
      delete test_url(@test)
    end

    assert_redirected_to tests_url
  end
end
