class GamesController < ApplicationController
  def new
    @letters = %w[Y Z D U Q E Z Y Q I]
  end

  def score
    binding.pry
  end
end
