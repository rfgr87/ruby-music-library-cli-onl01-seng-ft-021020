require_relative "../config/environment.rb"
require "pry"
class MusicLibraryController
  
  def initialize(path='./db/mp3s')
  @path = path
  @music_importer = MusicImporter.new(path)
  @music_importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    @input = gets.chomp
    while @input != 'exit'
<<<<<<< HEAD
      if @input == "list songs"
        self.list_songs
      elsif @input == "list artists"
        self.list_artists
      elsif @input == "list genres"
        self.list_genres
      elsif @input == "list artist"
        self.list_songs_by_artist
      elsif @input == "list genre"
        self.list_songs_by_genre
      elsif @input == "play song"
        self.play_song
      end
=======
>>>>>>> 055ba74aa5facbf785e02b767b8ae36857a51197
      @input = gets.chomp
    end 
  end
  
  def list_songs
    i = 0
    @sorted_songs = Song.all
    @sorted_songs = @sorted_songs.sort{ |a, b| a.name <=> b.name }
    while i < @sorted_songs.length
    puts "#{i+1}. #{@sorted_songs[i].artist.name} - #{@sorted_songs[i].name} - #{@sorted_songs[i].genre.name}"
      i += 1 
    end
  end
  
  def list_artists
    i =0
    @sorted_artists = Artist.all.sort{ |a, b| a.name <=> b.name}
    while i < @sorted_artists.length
      puts "#{i+1}. #{@sorted_artists[i].name}"
      i += 1 
    end
  end
  
  def list_genres
    i =0
    @sorted_genres = Genre.all.sort{ |a, b| a.name <=> b.name}
    while i < @sorted_genres.length
      puts "#{i+1}. #{@sorted_genres[i].name}"
      i += 1 
    end
  end
  
  def list_songs_by_artist
    i = 0
    puts "Please enter the name of an artist:"
    @input = gets.chomp
    if !Song.all.select{|song| song.artist.name == @input} == false
      @song_by_artist = Song.all.select{|song| song.artist.name == @input}
      @song_by_artist = @song_by_artist.sort{|a, b| a.name <=> b.name}
      while i < @song_by_artist.length 
        puts "#{i+1}. #{@song_by_artist[i].name} - #{@song_by_artist[i].genre.name}"
        i += 1 
      end 
    end 
  end
  
  def list_songs_by_genre
    i=0
    puts "Please enter the name of a genre:"
    @input = gets.chomp
    if !Song.all.select{|song| song.genre.name == @input} == false
      @song_by_genre = Song.all.select{|song| song.genre.name == @input}
<<<<<<< HEAD
      @song_by_genre = @song_by_genre.sort{|a, b| a.name <=> b.name}
=======
      @song_by_genre = @song_by_genre.sort{|a, b| a.artist.name <=> b.artist.name}
>>>>>>> 055ba74aa5facbf785e02b767b8ae36857a51197
      while i < @song_by_genre.length 
        puts "#{i+1}. #{@song_by_genre[i].artist.name} - #{@song_by_genre[i].name}"
        i += 1 
      end 
<<<<<<< HEAD
    end 
  end
  
  
  def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
  
  # def play_song
  #   #puts "Which song number would you like to play?"
  #   #self.list_songs
  #   @input = gets.chomp
  #   @sorted_songs2 = Song.all
  #   @sorted_songs2 = @sorted_songs2.sort{ |a, b| a.name <=> b.name }
  #   @input = @input.to_i
  #   if (@input-1) < @sorted_songs2.length && @input != 0
  #     puts "Playing #{@sorted_songs2[@input-1].name} by #{@sorted_songs2[@input-1].artist.name}"
  #     puts "Which song number would you like to play?"
  #   else
  #     puts "Which song number would you like to play?"
  #   end
  # end
  
end


# require "spec_helper"

# describe "MusicLibraryController - CLI Commands" do
#   let(:music_library_controller) { MusicLibraryController.new("./spec/fixtures/mp3s") }

#   describe "'list songs'" do
#     it "triggers #list_songs" do
#       allow(music_library_controller).to receive(:gets).and_return("list songs", "exit")

#       expect(music_library_controller).to receive(:list_songs)

#       capture_puts { music_library_controller.call }
#     end
#   end

#   describe "'list artists'" do
#     it "triggers #list_artists" do
#       allow(music_library_controller).to receive(:gets).and_return("list artists", "exit")

#       expect(music_library_controller).to receive(:list_artists)

#       capture_puts { music_library_controller.call }
#     end
#   end

#   describe "'list genres'" do
#     it "triggers #list_genres" do
#       allow(music_library_controller).to receive(:gets).and_return("list genres", "exit")

#       expect(music_library_controller).to receive(:list_genres)

#       capture_puts { music_library_controller.call }
#     end
#   end

#   describe "'list artist'" do
#     it "triggers #list_songs_by_artist" do
#       allow(music_library_controller).to receive(:gets).and_return("list artist", "exit")

#       expect(music_library_controller).to receive(:list_songs_by_artist)

#       capture_puts { music_library_controller.call }
#     end
#   end

#   describe "'list genre'" do
#     it "triggers #list_songs_by_genre" do
#       allow(music_library_controller).to receive(:gets).and_return("list genre", "exit")

#       expect(music_library_controller).to receive(:list_songs_by_genre)

#       capture_puts { music_library_controller.call }
#     end
#   end

#   describe "'play song'" do
#     it "triggers #play_song" do
#       allow(music_library_controller).to receive(:gets).and_return("play song", "2", "exit")

#       expect(music_library_controller).to receive(:play_song)

#       capture_puts { music_library_controller.call }
=======
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    self.list_songs
    @sorted_songs = Song.all.sort{ |a, b| a.name <=> b.name }
    loop do
      @input = gets.chomp
      if (@input.to_i-1) < @sorted_songs.length && @input.to_i != 0
        puts "Playing #{@sorted_songs[@input.to_i-1].name} by #{@sorted_songs[@input.to_i-1].artist.name}"
        break
      elsif @input.to_i == 0 
        puts "Which song number would you like to play?"
      end
    end
  end
  
end


# describe "#play_song" do
#     it "prompts the user to choose a song from the alphabetized list output by #list_songs" do
#       allow(music_library_controller).to receive(:gets).and_return("Testing for #puts")

#       expect($stdout).to receive(:puts).with("Which song number would you like to play?")

#       allow($stdout).to receive(:puts)

#       music_library_controller.play_song
#     end

#     it "accepts user input" do
#       allow(music_library_controller).to receive(:gets).and_return("Testing for #gets")

#       expect(music_library_controller).to receive(:gets)

#       music_library_controller.play_song
#     end

#     it "upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs" do
#       allow(music_library_controller).to receive(:gets).and_return("4")

#       expect($stdout).to receive(:puts).with("Which song number would you like to play?")
#       expect($stdout).to receive(:puts).with("Playing Larry Csonka by Action Bronson")

#       music_library_controller.play_song
#     end

#     it "does not 'puts' anything out if a matching song is not found" do
#       allow(music_library_controller).to receive(:gets).and_return("6")

#       expect($stdout).to receive(:puts).with("Which song number would you like to play?")
#       expect($stdout).to_not receive(:puts)

#       music_library_controller.play_song
#     end

#     it "checks that the user entered a number between 1 and the total number of songs in the library" do
#       allow(music_library_controller).to receive(:gets).and_return("0")

#       expect($stdout).to receive(:puts).with("Which song number would you like to play?")
#       expect($stdout).to_not receive(:puts)

#       music_library_controller.play_song
#     end
#   end
# end












# require "spec_helper"

# describe "MusicLibraryController - CLI Methods" do
#   let(:music_library_controller) { MusicLibraryController.new("./spec/fixtures/mp3s") }
#   let(:other_music_library_controller) { MusicLibraryController.new("./spec/fixtures/other_mp3s") }

#   describe "#list_songs" do
#     it "prints all songs in the music library in a numbered list (alphabetized by song name)" do
#       expect($stdout).to receive(:puts).with("1. Thundercat - For Love I Come - dance")
#       expect($stdout).to receive(:puts).with("2. Real Estate - Green Aisles - country")
#       expect($stdout).to receive(:puts).with("3. Real Estate - It's Real - hip-hop")
#       expect($stdout).to receive(:puts).with("4. Action Bronson - Larry Csonka - indie")
#       expect($stdout).to receive(:puts).with("5. Jurassic 5 - What's Golden - hip-hop")

#       music_library_controller.list_songs
#     end

#     it "is not hard-coded" do
#       expect($stdout).to receive(:puts).with("1. Bob Dylan - Ballad of a Thin Man - folk")
#       expect($stdout).to receive(:puts).with("2. Alpha 9 - Bliss - trance")
#       expect($stdout).to receive(:puts).with("3. Cass McCombs - County Line - indie")
#       expect($stdout).to receive(:puts).with("4. Bob Dylan - Masters of War - folk")

#       other_music_library_controller.list_songs
#     end
#   end

#   describe "#list_artists" do
#     it "prints all artists in the music library in a numbered list (alphabetized by artist name)" do
#       expect($stdout).to receive(:puts).with("1. Action Bronson")
#       expect($stdout).to receive(:puts).with("2. Jurassic 5")
#       expect($stdout).to receive(:puts).with("3. Real Estate")
#       expect($stdout).to receive(:puts).with("4. Thundercat")

#       music_library_controller.list_artists
#     end

#     it "is not hard-coded" do
#       Artist.create("ZZ Top")

#       expect($stdout).to receive(:puts).with("1. Alpha 9")
#       expect($stdout).to receive(:puts).with("2. Bob Dylan")
#       expect($stdout).to receive(:puts).with("3. Cass McCombs")
#       expect($stdout).to receive(:puts).with("4. ZZ Top")

#       other_music_library_controller.list_artists
#     end
#   end

#   describe "#list_genres" do
#     it "prints all genres in the music library in a numbered list (alphabetized by genre name)" do
#       expect($stdout).to receive(:puts).with("1. country")
#       expect($stdout).to receive(:puts).with("2. dance")
#       expect($stdout).to receive(:puts).with("3. hip-hop")
#       expect($stdout).to receive(:puts).with("4. indie")

#       music_library_controller.list_genres
#     end

#     it "is not hard-coded" do
#       expect($stdout).to receive(:puts).with("1. folk")
#       expect($stdout).to receive(:puts).with("2. indie")
#       expect($stdout).to receive(:puts).with("3. trance")

#       other_music_library_controller.list_genres
#     end
#   end

#   describe "#list_songs_by_artist" do
#     it "prompts the user to enter an artist" do
#       allow(music_library_controller).to receive(:gets).and_return("Testing for #puts")

#       expect($stdout).to receive(:puts).with("Please enter the name of an artist:")

#       music_library_controller.list_songs_by_artist
#     end

#     it "accepts user input" do
#       allow(music_library_controller).to receive(:gets).and_return("Testing for #gets")

#       expect(music_library_controller).to receive(:gets)

#       music_library_controller.list_songs_by_artist
#     end

#     it "prints all songs by a particular artist in a numbered list (alphabetized by song name)" do
#       Song.create_from_filename("Real Estate - Wonder Years - dream pop.mp3")

#       allow(music_library_controller).to receive(:gets).and_return("Real Estate")

#       expect($stdout).to receive(:puts).with("Please enter the name of an artist:")
#       expect($stdout).to receive(:puts).with("1. Green Aisles - country")
#       expect($stdout).to receive(:puts).with("2. It's Real - hip-hop")
#       expect($stdout).to receive(:puts).with("3. Wonder Years - dream pop")

#       music_library_controller.list_songs_by_artist
#     end

#     it "does nothing if no matching artist is found" do
#       allow(music_library_controller).to receive(:gets).and_return("Eel Restate")

#       expect($stdout).to receive(:puts).with("Please enter the name of an artist:")
#       expect($stdout).to_not receive(:puts)

#       music_library_controller.list_songs_by_artist
#     end
#   end

#   describe "#list_songs_by_genre" do
#     it "prompts the user to enter a genre" do
#       allow(music_library_controller).to receive(:gets).and_return("Testing for #puts")

#       expect($stdout).to receive(:puts).with("Please enter the name of a genre:")

#       music_library_controller.list_songs_by_genre
#     end

#     it "accepts user input" do
#       allow(music_library_controller).to receive(:gets).and_return("Testing for #gets")

#       expect(music_library_controller).to receive(:gets)

#       music_library_controller.list_songs_by_genre
#     end

#     it "prints all songs by a particular genre in a numbered list (alphabetized by song name)" do
#       allow(music_library_controller).to receive(:gets).and_return("hip-hop")

#       expect($stdout).to receive(:puts).with("Please enter the name of a genre:")
#       expect($stdout).to receive(:puts).with("1. Real Estate - It's Real")
#       expect($stdout).to receive(:puts).with("2. Jurassic 5 - What's Golden")

#       music_library_controller.list_songs_by_genre
#     end

#     it "does nothing if no matching genre is found" do
#       allow(music_library_controller).to receive(:gets).and_return("post-jazz")

#       expect($stdout).to receive(:puts).with("Please enter the name of a genre:")
#       expect($stdout).to_not receive(:puts)

#       music_library_controller.list_songs_by_genre
#     end
#   end

#   describe "#play_song" do
#     it "prompts the user to choose a song from the alphabetized list output by #list_songs" do
#       allow(music_library_controller).to receive(:gets).and_return("Testing for #puts")

#       expect($stdout).to receive(:puts).with("Which song number would you like to play?")

#       allow($stdout).to receive(:puts)

#       music_library_controller.play_song
#     end

#     it "accepts user input" do
#       allow(music_library_controller).to receive(:gets).and_return("Testing for #gets")

#       expect(music_library_controller).to receive(:gets)

#       music_library_controller.play_song
#     end

#     it "upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs" do
#       allow(music_library_controller).to receive(:gets).and_return("4")

#       expect($stdout).to receive(:puts).with("Which song number would you like to play?")
#       expect($stdout).to receive(:puts).with("Playing Larry Csonka by Action Bronson")

#       music_library_controller.play_song
#     end

#     it "does not 'puts' anything out if a matching song is not found" do
#       allow(music_library_controller).to receive(:gets).and_return("6")

#       expect($stdout).to receive(:puts).with("Which song number would you like to play?")
#       expect($stdout).to_not receive(:puts)

#       music_library_controller.play_song
#     end

#     it "checks that the user entered a number between 1 and the total number of songs in the library" do
#       allow(music_library_controller).to receive(:gets).and_return("0")

#       expect($stdout).to receive(:puts).with("Which song number would you like to play?")
#       expect($stdout).to_not receive(:puts)

#       music_library_controller.play_song
>>>>>>> 055ba74aa5facbf785e02b767b8ae36857a51197
#     end
#   end
# end
