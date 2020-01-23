require 'rails_helper'

describe 'User sees a list of articles' do
    scenario 'they navigate to and see a list of articles' do
        first_article = FactoryBot.create(:article)
        second_article = FactoryBot.create(:article, title:'title 2', description:'description 2')
        visit '/articles'
        
        expect(page).to have_content 'All blog posts!'
        expect(page).to have_content first_article.title
        expect(page).to have_content first_article.description
        expect(page).to have_content second_article.title
        expect(page).to have_content second_article.description

    end
end