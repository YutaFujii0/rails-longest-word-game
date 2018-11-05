class GamesController < ApplicationController
  def new
    @alphabets = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @choice   = params['choice']
    @answer   = params['answer']
    @english  = english?(@answer)
    @valid    = valid?(@answer, @choice)
    @result   = @english && @valid
    @score    = score_count(@answer, @valid)
  end

  private

  def english?(string)
    url = 'https://wagon-dictionary.herokuapp.com/' + string
    html_doc = open(url).read
    doc = JSON.parse(html_doc)
    doc['found']
  end

  def valid?(string, choice)
    entry = string.upcase.chars
    mother = choice.chars
    check = true
    entry.reduce(check) do |_check, letter|
      if mother.include?(letter)
        mother.delete_at(mother.find_index(letter))
      else
        check = false
      end
    end
  end

  def score_count(string, valid)
    valid ? string.length**2 : 0
  end
end
