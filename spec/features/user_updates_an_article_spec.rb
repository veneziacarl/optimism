require 'rails_helper'

describe 'User updates an article' do
    scenario 'they navigate to a selected article and successfully update it' do
        test_article = FactoryBot.create(:article)
        visit '/articles'
        click_link 'Edit'

        expect(page).to have_content 'Edit Article'
        
        fill_in 'Title', with: 'My edited title'
        fill_in 'Description', with: 'My edited description'
        click_button 'Update Article'

        expect(page).to have_content 'Article was updated'
        expect(page).to have_content 'Showing selected article'
    end
end