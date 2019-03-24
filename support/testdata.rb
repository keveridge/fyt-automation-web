# A class of static test data methods

class TestData

  # All methods in this block are static
  class << self

    def search_term(type:)
      {
          :popular => 'apple',
          :valid => 'camera'
      }[type.to_sym]
    end

  end

end