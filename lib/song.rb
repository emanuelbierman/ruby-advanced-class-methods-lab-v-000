class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize
  #   @name = name
  #   @artist_name = artist_name
  # end

  def self.pass_name(name)
    @name = name
  end

  # def self.pass_artist()
  #
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    self.create
    self.pass_name(name)
  end

  def self.create_by_name(name)
    song = self.create
    self.pass_values(name)
    song
  end

  def self.find_by_name(name)
    found = @@all.uniq.select {|song| song.name === name }
    found[0]
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    filenames = filename.split(" - ")
    artist_name = filenames[0]
    mp3_name = filenames[1].split(".")
    name = mp3_name[0]
    self.create_by_name(name)
# ("Thundercat - For Love I Come.mp3")
  end

  def self.create_from_filename

  end

  def self.destroy_all
    @@all.clear
  end
end
