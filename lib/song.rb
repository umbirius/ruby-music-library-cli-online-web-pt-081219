require 'pry'

class Song 
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    # @artist = artist
    self.artist = artist
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
  end 
 
    
end 