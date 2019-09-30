require 'pry'

class Song 
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    #@artist = artist
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    new = Song.new(name)
    new.save 
    new
  end 
    
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
    Artist.create(artist) unless Artist.all.detect {|art| art == artist}
  end 
  
  def genre=(genre)
    @genre = genre 
    @genre.add_song(self)
    Genre.create(genre) unless Genre.all.detect {|gen| gen == genre}
  end 
 
  def self.find_by_name(name)
    Song.all.detect {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil 
      Song.create(name)
    else 
      Song.find_by_name(name)
    end 
  end 
   
end 