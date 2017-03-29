# README

This README would document the steps are necessary to get the
application with Rspec, capybara_webkit, devise with factory_girl and ffaker,
and testing Admin Feature with simple_bdd.

Step 1: Follow steps listed here: https://github.com/blue0knight/GemCheatsheet/blob/master/README.rdoc

Step 2: A basic rspec-rails test for a home feature and specification:

  2a. Create “features” folder in /spec

  2b. Create “home_spec.rb” in /spec/features

  2c. In /features/home_spec.rb, add the ff features and scenarios:


      require 'rails_helper'

      feature "when visiting the homepage" do
        scenario "the visitor sees a welcome text" do
          visit root_path
          expect(page).to have_text("Welcome to Ruby-App")
        end
      end


  2d. Create Home Controller with Index Method:

      $rails g controller Home index

  2e. Edit /config/routes.rb: (add the root_path)

      root ‘home#index’

  2f. Edit /app/views/home/index.html: (add welcome text)

      <p>Welcome to Ruby-App</p>

Step 3: The capybara-webkit (test js in headless Webkit in Safari and Chrome) and
 database_cleaner setup:

  3a. Visit [Capybara-Webkit Github](https://github.com/thoughtbot/capybara-webkit).

  3b. Visit [database-cleaner Github](https://github.com/DatabaseCleaner/database_cleaner).

  3c. Setup: In /spec/rails_helper.rb change to:

  ```

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  # Prevent database truncation if the environment is production
  abort("The Rails environment is running in production mode!") if Rails.env.production?
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'capybara/webkit/matchers'
  require 'simple_bdd'
  require 'shoulda/matchers'

  # Add additional requires below this line. Rails is not loaded until this point!

  # Requires supporting ruby files with custom matchers and macros, etc, in
  # spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
  # run as spec files by default. This means that files in spec/support that end
  # in _spec.rb will both be required and run as specs, causing the specs to be
  # run twice. It is recommended that you do not name files matching this glob to
  # end with _spec.rb. You can configure this pattern with the --pattern
  # option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
  #
  # The following line is provided for convenience purposes. It has the downside
  # of increasing the boot-up time by auto-requiring all files in the support
  # directory. Alternatively, in the individual `*_spec.rb` files, manually
  # require only the support files necessary.
  #
  # Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  # Checks for pending migration and applies them before tests are run.
  # If you are not using ActiveRecord, you can remove this line.
  ActiveRecord::Migration.maintain_test_schema!

  RSpec.configure do |config|
    Capybara.javascript_driver = :webkit
   # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

   # If you're not using ActiveRecord, or you'd prefer not to run each of your
   # examples within a transaction, remove the following line or assign false
   # instead of true.
    config.use_transactional_fixtures = true

    config.include SimpleBdd, type: :feature
   # config.include Devise::TestHelpers, :type => :controller
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
   end

    config.before(:each) do
      DatabaseCleaner.start
   end

    config.after(:each) do
      DatabaseCleaner.clean
   end
    # RSpec Rails can automatically mix in different behaviours to your tests
    # based on their file location, for example enabling you to call `get` and
    # `post` in specs under `spec/controllers`.
    #
    # You can disable this behaviour by removing the line below, and instead
    # explicitly tag your specs with their type, e.g.:
    #
    #     RSpec.describe UsersController, :type => :controller do
    #       # ...
    #     end
    #
    # The different available types are documented in the features, such as in
    # https://relishapp.com/rspec/rspec-rails/docs
    config.infer_spec_type_from_file_location!

    # Filter lines from Rails gems in backtraces.
    config.filter_rails_from_backtrace!
    # arbitrary gems may also be filtered via:
    # config.filter_gems_from_backtrace("gem name")
  end

  ```
