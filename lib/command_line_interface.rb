def welcome
  puts "Hello! Welcome to the Star Wars API!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  return (gets.chomp).to_s
end
