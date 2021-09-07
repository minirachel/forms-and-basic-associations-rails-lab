class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.map(&:content)
  end

  def note_contents=(contents)
    contents.each do |c|
      if c.strip != ""
        self.notes.build(content: c)
      end
    end
  end
end
