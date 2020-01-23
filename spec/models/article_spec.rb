require 'rails_helper'

RSpec.describe Article do
    it "returns an article object with title, description, created at time, and updated at time" do
        test_article = FactoryBot.create(:article, title:"test title", description:"test description")

        expect(test_article.title).to eq("test title")
        expect(test_article.description).to eq("test description")
        expect(test_article.created_at).not_to be_nil
        expect(test_article.updated_at).not_to be_nil
    end

    it { should have_valid(:title).when("This is a title") }
    it { should_not have_valid(:title).when(nil, "") }
    
    it { should have_valid(:description).when("This is a description") }
    it { should_not have_valid(:description).when(nil, "") }

end