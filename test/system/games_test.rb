require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector ".letter", count: 10
  end

  test "fill the form with wrong attempt and get a message to point that" do
    visit new_url

    fill_in "answer"
    assert test: "New game"
    assert_selector ".letter", count: 10
  end
end
