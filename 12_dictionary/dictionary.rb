class Dictionary
  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def add (entry)
    if entry.kind_of?(String)
      entry = {entry => nil}
    end
    @entries = @entries.merge(entry)
  end

  def keywords
    @entries.keys
  end

  def include

  end
end