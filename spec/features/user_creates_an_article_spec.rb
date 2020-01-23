require 'rails_helper'

describe 'User creates an article' do
    scenario 'they fill in the form to create an article and are redirected to the show page' do
        visit '/articles/new'

        fill_in 'Title', with: 'My title'
        fill_in 'Description', with: 'My description'
        click_button 'Create Article'

        expect(page).to have_content 'successfully created'
        expect(page).to have_content 'Showing selected article'
    end
end