class GamesController < ApplicationController
  def new
    @alphabets = 9.times.map { ("A".."Z").to_a.sample }
  end

  def score
    @choice   = params["choice"]
    @answer   = params["answer"]
    @english  = is_english?(@answer)
    @valid    = is_valid?(@answer, @choice)
    @result   = @english && @valid
    @score    = score_count(@answer, @valid)
  end

  private

  def is_english?(string)
    url = "https://wagon-dictionary.herokuapp.com/" + string
    html_doc = open(url).read
    doc = JSON.parse(html_doc)
    doc["found"]
  end

  def is_valid?(string, choice)
    entry = string.upcase.chars
    mother = choice.chars
    check = true
    entry.reduce(check) do |check, letter|
      if mother.include?(letter)
        mother.delete_at(mother.find_index(letter))
      else
        check = false
      end
    end
  end

  def score_count(string, valid)
    valid ? string.length ** 2 : 0
  end
end
