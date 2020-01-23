require 'rails_helper'

RSpec.describe ArticlesController do

    describe "GET #index" do
        it "renders the index template" do
            get :index
            expect(response.status).to eq 200
            assert_template 'articles/index'
        end
        
        it "gets all articles" do
            first_article = FactoryBot.create(:article)
            second_article = FactoryBot.create(:article, title:"second title", description:"second description")        
            get :index

            assert_equal Article.all, assigns(:articles)
            expect(assigns(:articles)).to eq([first_article, second_article])  
        end
    end

    describe "GET #new" do
        it "renders the new template" do
            get :new
            expect(response.status).to eq 200
            assert_template 'articles/new'
        end
    end

    describe "POST #create" do
        context 'when save is successful' do
            it "will create an article and redirect to article path" do
                post :create, params: { article: {title: 'a very good title', description: 'a wonderful description'} }

                expect(response.status).to eq 302
                expect(flash[:notice]).to match("Article was successfully created")
                expect(response).to redirect_to article_path(response.location.scan(/\d+/).first)
                # not a big fan of the above `response.location.scan` method but I was having issues pulling 
                # the created Article object from the returned ActionDispatch::TestResponse object.
            end
        end
        context 'when save is not successful' do
            it "will render the new template" do
                post :create, params: { article: {description: 'a lonely description'} }

                assert_template 'articles/new'
                expect(response).to_not be_redirect
            end   
        end
    end

    describe "GET #show" do
        it "will show the selected article" do
            test_article = FactoryBot.create(:article)
            get :show, params: { id: test_article.id }
            expect(response.status).to eq 200
            assert_template 'articles/show'
        end
    end

    describe "GET #edit" do
        it "will show the edit view for the selected article" do
            test_article = FactoryBot.create(:article)
            get :edit, params: { id: test_article.id }
            expect(response.status).to eq 200
            assert_template 'articles/edit'
        end
    end

    describe "PATCH #update" do
        context 'when save is successful' do
            it "will successfully update the selected article" do
                test_article = FactoryBot.create(:article)
                updated_attributes = { name: 'new name', description: 'new description' }
                patch :update, params: { id: test_article, article: updated_attributes }

                expect(response.status).to eq 302
                expect(response).to redirect_to article_path(test_article)
                expect(flash[:notice]).to match("Article was updated")
            end
        end
        # context 'when it cannot find the article ID' do
        #     it 'will raise an error' do
        #         expect(patch :update, params: { 
        #             id: 'unknown', title:'title will not work', description:'description will not work' 
        #             }).to raise_error(ActiveRecord::RecordNotFound)
        #     end
        # end
    end

    describe "DELETE #destroy" do
        it "will successfully delete the selected article" do
            test_article = FactoryBot.create(:article)
            delete :destroy, params: {id: test_article}

            expect(response.status).to eq 302
            expect(flash[:notice]).to match("Article was deleted")
        end
    end
  end