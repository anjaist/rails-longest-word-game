require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end
end



# You can fill the form with a random word, click the play button,
# and get a message that the word is not in the grid.

# You can fill the form with a one-letter consonant word,
# click play, and get a message it's not a valid English word


# You can fill the form with a valid English word
# (that's hard because there is randomness!), click play and get a "Congratulations" message
