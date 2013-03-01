class Song

  def initialize(name,author,duration)
    @name = name
    @author = author
    @duration = duration
  end

  attr_accessor :name, :author, :duration

  include Comparable
  def <=>(other)
    self.duration <=> other.duration
  end

end

s1 = Song.new('Gangnam Style','PSY',5.10)
s2 = Song.new('Bohemian Rhapsody','Queen',5.10)


puts s1 <=> s2 # true
