require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "Display correct message if word not in grid" do
    visit new_url
    fill_in "word", with: "xxxxxxx"
    click_on "play"

    assert_text "Sorry but XXXXXXX can't be built out of"
  end
end
