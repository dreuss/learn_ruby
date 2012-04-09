def reverser
  result = []
  yield.split(' ').each do |word|
    find_characters = word.split('')
    result << find_characters.reverse.join
  end
  return result.join(' ')

end

def adder(counter = 1)
  yield + counter
end

def repeater(count = 1)
  (1..count).each do
    yield
  end
end