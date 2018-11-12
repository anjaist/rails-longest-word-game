class GamesController < ApplicationController
  def new
    @letters = []
    10.times do |_x|
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    @word = params[:word].upcase
    @letters = params[:letters].split(" ")
    @word_array = @word.split("")
    @word_check = count_letter_occurence(@word_array)
    @letter_check = count_letter_occurence(@letters)

    @phrase1 = "Congratulations! #{@word} is a valid English word!"
    @phrase2 = "Sorry but #{@word} does not seem to be a valid English word"
    @phrase3 = "Sorry but #{@word} can't be built out of #{@letters.join(", ")}"
    @result = ''

    # The word can't be built out of the original grid
    @word_check.each do |key, value|
      @result = @phrase3 unless @letter_check.key?(key) && value <= @letter_check[key]
    end

    if @result.blank?
      english?(@word) ? @result = @phrase1 : @result = @phrase2
    end
  end

  def count_letter_occurence(arr)
    @word_hash = Hash.new(0)
    arr.each do |letter|
      @word_hash[letter] += 1
    end
    @word_hash
  end

  def english?(word)
    @url = "https://wagon-dictionary.herokuapp.com/#{word}"
    @response_hash = HTTParty.get(@url).parsed_response
    @response_hash["found"]
  end
end
