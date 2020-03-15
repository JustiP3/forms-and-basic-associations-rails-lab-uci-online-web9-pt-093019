class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes 

  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }

  def genre_name
    self.genre.name ? self.genre.name : nil 
  end 

  def genre_name=(name)
    self.genre.name = Genre.find_by(name: name)
  end 

  def artist_name
    if self.artist 
      self.artist.name
    end 
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.artist.name 
  end 
end
