require 'cucumber/rails'
ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Chromedriver.set_version '2.42'

chrome_options = %w[no-sandbox disable-popup-blocking disable-infobars]

chrome_options << 'headless'

Capybara.register_driver :selenium do |app|
    options = Selenium::WebDriver::Chrome::Options.new(
        args: chrome_options
)
Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        options: options
)
end
# Simplify FactoryBot methods in step definitions
World(FactoryBot::Syntax::Methods)

# Simplify User management
Warden.test_mode!
World(Warden::Test::Helpers)
After { Warden.test_reset! }
