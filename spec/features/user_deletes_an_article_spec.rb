require 'rails_helper'

describe 'User deletes an article' do
    scenario 'they select and article and delete it' do
        FactoryBot.create(:article)
        visit '/articles'
        click_link 'Show'
        click_link 'Delete'

        expect(page).to have_content 'Article was deleted'
    end
end