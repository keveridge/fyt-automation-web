# A class of static test data methods

class TestData

  # All methods in this block are static
  class << self

    def environment
      ENV['FYT_ENVIRONMENT'].to_sym || :dev
    end

    def base_url
      {
        :dev => 'http://localhost:8081',
        :prod => 'http://demo.grandnode.com'
      }[environment]
    end

    def search_term(type:)
      {
          :popular => 'apple',
          :valid => 'camera'
      }[type.to_sym]
    end

  end

end