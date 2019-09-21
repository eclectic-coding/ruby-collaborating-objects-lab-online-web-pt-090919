class Artist
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def self.find_or_create_by_name(name)

    find(name) ? find(name) : new(name)
  end

  def self.find(name)
    all.find { |artist| artist.name == name }
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each { |song| puts song.name }
  end
end
