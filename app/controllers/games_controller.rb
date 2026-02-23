require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    alphabet = ("A".."Z").to_a
    @letters = Array.new(10) do alphabet.sample
    end
  end

  def included?(guess, grid)
  guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

  def english_word?(word)
  response = URI.parse("https://dictionary.lewagon.com/#{word}")
  json = JSON.parse(response.read)
  return json['found']

  def score (attempt, grid, time)
    if included?&& enlgish_words (attempt.upcase, grid)
      [score, "well done"]
    else
       "not an english word"
  end
end
