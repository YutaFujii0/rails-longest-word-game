def is_valid?(string, choice)
  answer_letters = string.upcase.split('')
  choices = choice.split('')
  check = true
  answer_letters.reduce(check) do |_c, letter|
    puts letter
    if choices.include?(letter)
      choices.delete_at(choices.find_index(letter))
      # puts choices
      puts check
    else
      puts "here"
      check = false
    end
  end
  puts check
end


is_valid?("whya", "HETOIBWY")
