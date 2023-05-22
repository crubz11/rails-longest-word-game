require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @input = params[:input]
    @grid = params[:letters]
    word_check_url = "https://wagon-dictionary.herokuapp.com/#{@input}"
    @word_check = JSON.parse(URI.open(word_check_url).read)
    @word_found = @word_check['found']

    word_chars = @input.downcase.chars
    grid_chars = @grid
    @include = word_chars.all? { |char| grid_chars.include?(char) && grid_chars.delete(char) }

    @score = @input.length
  end
end
