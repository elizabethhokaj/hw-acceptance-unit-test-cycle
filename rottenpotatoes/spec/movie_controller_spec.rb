require 'rails_helper'

describe MoviesController, :type => :controller do


    describe "#similar" do

        context "When specified movie has a director" do

            it "should find movies with the same director" do

            @movie_id="111"
            @movie=double('Test movie', :director => 'Director 1')

            expect(Movie).to receive(:find).and_return(@movie)
            expect(Movie).to receive(:similar_movies)

            get :similar, id:  @movie_id

            expect(response).to render_template(:similar)
            end
        end

        context "When specified movie has no director" do
            it "should redirect to the movies page" do
            @movie_id="111"
            @movie=double('Test Movie').as_null_object
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            get :similar, :id => @movie_id
            expect(response).to redirect_to(root_path)

            end
        end
    end

  describe "#create" do
    it "should create movie with given parameters" do
        @movie_id = "111"
        @movie = double('Test movie').as_null_object
        @def = { :title => "Test Movie title", :rating => "G", :director => "TestDir" }
        expect(Movie).to receive(:create!).and_return(@movie)
        post :create, :movie => @def
        expect(response).to redirect_to(movies_path)
    end
  end
    describe "#create" do
    it "should create movie with given parameters" do
        @movie_id = "111"
        @movie = double('Test movie').as_null_object
        @def = { :title => "Test Movie title", :rating => "G", :director => "TestDir" }
        expect(Movie).to receive(:create!).and_return(@movie)
        post :create, :movie => @def
        expect(response).to redirect_to(movies_path)
    end
  end

  describe "#show" do
    it "should show details about the selected movie" do
        @movie_id = "111"
        @movie = double('Test movie').as_null_object
        expect(Movie).to receive(:find).and_return(@movie)
        get :show, :id => @movie_id
        expect(response).to render_template(:show)
    end
  end
  describe "#destroy" do
    it "should delete the selected movie" do
        @movie_id = "111"
        @movie = double('Test movie').as_null_object
        expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
        expect(@movie).to receive(:destroy)
        delete :destroy, :id => @movie_id
        expect(response).to redirect_to(movies_path)
    end
  end
  describe "#edit" do
    it "should edit the selected movie" do
        @movie_id = "111"
        @movie = double('Test movie').as_null_object
        expect(Movie).to receive(:find).and_return(@movie)
        get :edit, :id => @movie_id
        expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    let(:movie_params) {{title: "Inception", rating: "PG-13", release_date: "2010-07-13"}}
    it "should update an existing movie" do
        @movie_id = "111"
        @movie = double('Test movie').as_null_object
        expect(Movie).to receive(:find).and_return(@movie)
        put :update,  {:id => @movie_id, movie: movie_params}
        expect(response).to redirect_to(movie_path(@movie))
    end
  end

  describe "#index" do
    it 'should render the index template' do
      get :index
      expect(response).to render_template('index')
    end 
  end

  describe "#new" do
    it "should render the new template" do
      get :new 
        expect(response).to render_template(:new)
    end
  end
end 
