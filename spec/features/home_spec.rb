require 'rails_helper'

feature "when visiting the homepage" do
  scenario "the visitor sees a welcome text" do
    visit root_path
    expect(page).to have_text("Welcome to Ruby-App")
  end
end
