class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def add_song(song)
    song.artist = self
    @songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    Artist.all.detect{|a| a.name == name}
  end

  def self.create_by_name(name)
    a = Artist.new(name)
    a.save
    a
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def print_songs
    puts self.songs.map{|s| s.name}
  end
end
