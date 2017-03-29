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
