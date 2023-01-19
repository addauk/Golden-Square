class SongList
  def initialize
    @songs =[]
  end

  def add(song)
    @songs << song
  end

  def list
    fail "No songs have been added to your list." unless @songs.length > 0
    @songs
  end


end