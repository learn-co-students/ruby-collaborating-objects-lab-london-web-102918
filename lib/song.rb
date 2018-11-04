class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    split_filename = filename.split(/\-|\./).map(&:strip).slice(0,2)
      song = split_filename[1]
      artist = split_filename[0]
      song = self.new(song)
      song.artist_name = artist
      song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end
