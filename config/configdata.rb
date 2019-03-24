class ConfigData

  # All methods in this block are static
  class << self

    def driver
      ENV['FYT_DRIVER'] || 'capybara'
    end

    def environment
      ENV['FYT_ENVIRONMENT'] || 'dev'
    end

    def driver_file
      {
        :capybara => 'options/drivers/capybara_local',
        :browserstack => 'options/drivers/browserstack',
        :saucelabs => 'options/drivers/saucelabs'
      }[driver.to_sym]
    end

    def base_url
      {
          :dev => 'http://localhost:8081',
          :prod => 'http://demo.grandnode.com'
      }[environment.to_sym]
    end

  end

end