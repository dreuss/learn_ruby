def translate(str)

  result = []
  str.split(' ').each do |word|
    word[/([aeiou]|qu|[^aeiou]+)(.*)/]
    first_character = $1
    remains = $2

    if first_character[/\A[aeiou]/]
      word = word + "ay"
    else
      word = remains + first_character + "ay"
    end

    result << word

  end
  result.join(' ')
end



