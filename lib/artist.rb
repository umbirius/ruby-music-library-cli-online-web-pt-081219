class Artist 
  
  attr_accessor :name
  @@all = []
  
  def initialize(name) 
    @name = name 
    @songs = []
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
    new = Artist.new(name)
    new.save 
    new
  end   
  
  def songs 
    @songs
  end 
  
  def add_song(song)
    if song.artist == nil
      song.artist = self 
      @songs << song
    end 
  end 
end 