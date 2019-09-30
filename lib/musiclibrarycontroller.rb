class MusicLibraryController 
  
  attr_reader :path, :imp
  
  def initialize(path = './db/mp3s')
    @path = path 
    imp = MusicImporter.new(path)
    imp.import
  end 
  
  def call
    puts("Welcome to your music library!")
    puts("To list all of your songs, enter 'list songs'.")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")
    input = gets.strip
    while input != 'exit'
      input = gets.strip
      if input == 'list songs'
        list_songs 
      elsif input == 'list artists'
        Artist.all 
      elsif input == 'list genres'
        Genre.all
      elsif input == 'list artist'
        
      
      elsif input == 'list genre'
      
      elsif input == 'play song'
      
      elsif input == 'exit'
      break 
      end 
    end 
  end 

  def list_songs
    i = 1 
    list = Song.all.sort_by {|song| song.name}
    list.each do 
      |song| puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i+=1 
    end 
  end 
  
  def list_artists
    i = 1 
    list = Artist.all.sort_by {|artist| artist.name}
    list.each do 
      |artist| puts "#{i}. #{artist.name}"
      i+=1 
    end 
  end 
  
  def list_genres
    i = 1 
    list = Genre.all.sort_by {|genre| genre.name}
    list.each do 
      |genre| puts "#{i}. #{genre.name}"
      i+=1 
    end 
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    binding.pry
    # @artist.songs.each {|song| puts song}

  end 
  
end 