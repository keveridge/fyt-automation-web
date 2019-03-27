class ConfigData

  # All methods in this block are static
  class << self

    def driver
      ENV['FYT_DRIVER'] || 'local'
    end

    def environment
      ENV['FYT_ENVIRONMENT'] || 'dev'
    end

    def driver_file
      {
        :local => 'options/drivers/local',
        :browserstack => 'options/drivers/browserstack',
        :saucelabs => 'options/drivers/saucelabs',
        :lamdatest => 'options/drivers/lamdatest'
      }[driver.to_sym]
    end

    def base_url
      {
          :dev => 'http://localhost:8081',
          :prod => 'http://demo.grandnode.com'
      }[environment.to_sym]
    end

    def default_caps
      {
          :browserstack => {
              'build' => 'capybara-browserstack',
              'browserstack.selenium_version' => '3.14.0',
              'browserstack.debug' => true
          },
          :lamdatest => {
              'video' => true,
              'network' => true,
              'console' => true,
              'visual' => true,
              'build' => 'capybara-lambdatest',
              'name' => 'single-Test'
          },
          :saucelabs => {
              :platform=>:any,
              :javascript_enabled=>true,
              :css_selectors_enabled=>true,
              :takes_screenshot=>true,
              :native_events=>false,
              :rotatable=>false,
          }
      }[driver.to_sym]
    end

    def driver_url(username:, access_key:)
      {
          :browserstack => "https://#{username}:#{access_key}@hub-cloud.browserstack.com/wd/hub",
          :lamdatest => "https://#{username}:#{access_key}@hub.lambdatest.com:443/wd/hub",
          :saucelabs => "https://ondemand.saucelabs.com:443/wd/hub"
      }[driver.to_sym]
    end

    def selenium_driver(app:, username:, access_key:, caps:, browser: :remote)
      Capybara::Selenium::Driver.new(app,
                                     browser: browser,
                                     url: ConfigData.driver_url(username:username, access_key:access_key),
                                     desired_capabilities: caps)
    end

    def config_capybara(default_driver:)
      Capybara.default_driver = default_driver
      Capybara.run_server = false
      Capybara.app_host = ConfigData.base_url
    end
  end

end