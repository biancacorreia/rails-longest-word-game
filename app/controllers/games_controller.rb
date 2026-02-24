equire "open-uri"
require "json"
class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ("A".."Z").to_a.sample }
  end
  def score
    @word = params[:word]
    @letters = params[:letters]
    if !included?(@word, @letters)
      @result = "Sorry but #{@word} can't be build out of #{@letters}"
    elsif !english_word?(@word)
      @result = "Sorry but #{@word} does not seem to be a valid English word."
    else
      @result = "Congratulations! #{@word} is a valid English word!"
    end
  end
  def included?(word, grid)
    word.chars.all? { |letter| word.count(letter) <= grid.count(letter) }
  end
  def english_word?(word)
    response = URI.parse("https://dictionary.lewagon.com/#{word}")
    json = JSON.parse(response.read)
    json["found"]
  end
end
