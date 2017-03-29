require 'rails_helper'

feature "when visiting the homepage" do
  scenario "the visitor sees a welcome text" do
    visit root_path
    expect(page).to have_text("Welcome to Ruby-App")
  end

  scenario "the visitor sees Javascript Message", :js => true do
    visit root_path
    expect(page).not_to have_errors
    click_button "Javascript Message"
    within(".modal-text") do
      expect(page).to have_text("This is a Javascript Message!")
    end
    click_link "Close"
    expect(page).not_to have_text("This is a Javascript Message!")
  end
  
end
