class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(songs)
    song = self.new
    song.name = songs
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(songs)
    self.all.find{|song|song.name == songs}
  end

  def self.find_or_create_by_name(songs)
    self.find_by_name(songs) || self.create_by_name(songs)
  end

  def self.alphabetical
    self.all.sort_by{|m|m.name}
  end

  def self.new_from_filename(filename)
    one = filename.split(" - ")
    artist_name = one[0]
    song_name = one[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    single = filename.split(" - ")
    artist_name = single[0]
    song_name = single[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
