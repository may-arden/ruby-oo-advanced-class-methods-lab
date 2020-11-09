require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
                          ########### self.class.all == @@all ############
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song 
  end 

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song 
  end 

  def self.find_by_name(song_name)
    # self is the Class (Song) . all is @@all 
    # detect iterates over the class {|variable that represents passed in song_name| 
    # passed in song_name is equal to song_name}
    @@all.detect{|s| s.name == song_name}
  end 

  def self.find_or_create_by_name(song_name) 
      self.find_by_name(song_name) || self.create_by_name(song_name)
  end 

  def self.alphabetical
    # self is the Class (Song) . all is @@all 
      @@all.sort_by{|s| s.name}
  end 

  def self.new_from_filename(filename)
      parts = filename.split(" - ")
      artist_name = parts[0]
      song_name = parts[1].gsub(".mp3", "")

      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song 
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save 
    song 
  end

  def self.destroy_all
      @@all.clear
  end

end
# binding.pry