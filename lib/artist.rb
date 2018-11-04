require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    @@all.find do |artist|
      if artist.name == name
        return artist
      end
    end
  end

  def self.create_by_name(name)
    artist = self.new(name)
    artist.name = name
    artist.save
    artist
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

  # binding.pry

end
