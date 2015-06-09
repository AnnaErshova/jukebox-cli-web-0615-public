songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
] # thank god this is not a hash...

def run(songs) # I thought we were supposed to call this bit 'runner'?
  puts "Welcome to my Jukebox!\n\n Please enter a command:\n\n Help, List, Play, or Exit\n\n"
  help
  command = gets.strip.to_s
  case command # I originally used if-else
    when "help"
      help
    when "list"
      list(songs)
    when "play"
      play(songs) # runs play songs method
    when "exit" # or use unless
      exit_jukebox
   # else
   # puts "Erroneous Command"
   # exit_jukebox
  end
end

def help
  puts "?=.*help)(?=.*list)(?=.*play)(?=.*exit"
  puts "You are in 'Help' right now."
  puts "'List' will output a numbered list of songs."
  puts "'Play' will play a song based on its title or number."
  puts "'Exit' will exit the Jukebox CLI."
end

# output songs with index
def list(songs)
  songs.each_with_index {|song, i| puts "#{i+1}. #{song}"} #or start each_with_index with counting at 1
end

  # ask user for the number it wants
  # puts "Here are songs available:"
  # puts list
  # puts "Which song would you like to play? Enter either number or title:"
  # this is actually a classic case of the code passing the test, but not working
  # it will blow up is input is some other string....
  # the way to go is to do if choice.class = Fixnum and if choice.class = String
def play(songs)
  puts "What song would you like to play?"
  choice = gets.strip #gets will make it a string
  if songs.include?(choice)  #this would be better if we regex'ed it for presence of the first word because people are usually too lazy to type everything
    puts choice
  else
    if choice.to_i > songs.size || choice.to_i < 0
      puts "Invalid input, please try again!" 
    else
      puts "Playing #{songs[choice.to_i-1]}"
    end
  end
    puts choice
end

# if number puts songs[songnumber-1]

def exit_jukebox
  puts "Goodbye!"
  # I feel like this still needs something to exit the program though, but apparently rspec doesn't care
end



# Your code here
# Your jukebox should respond to 4 commands: help, play, list, and exit.

# The *help* command should output instructions for the user on how to use the jukebox. 
# This should call a method named help. Try typing ruby -h for an example of 
# what your output could look like.

# The *list* command should output a list of songs that the user can play. 
# It should call a method named list.

# The *play* command should accept a song. It should call a play method. 
# The user can select either the song number/index or the song name. 
# Once the user has selected the song they want to play, 
# the jukebox should output 'Playing Phoenix - 1901' or whatever the song name is.
# puts "Playing #{song_name}"

# If the user types in *exit*, the jukebox should say goodbye and the program should shut down.
# puts "Goodbye"
# exit