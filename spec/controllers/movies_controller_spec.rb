require 'rails_helper'

describe MoviesController, type: :controller do 
  let(:movie1) { Movie.create(title: 'American Sniper',
                plot: 'From director Clint Eastwood comes \'American Sniper,\'starring Bradley Cooper as ',
                actors: [
                  'Bradley Cooper',
                  'Sienna Miller',
                  'Ben Reed',
                  'Luke Grimes',
                  'Kyle Gallner',
                  'Elise Robertson'
                ],
                released: Date.new(2015, 1, 16),
                genre: ['Drama', 'Action & Adventure'],
                trailer: 'www.youtube.com/embed/99k3u9ay1gs',
                earnings: 64.6
                ) }
  let(:movie2) { Movie.create(
                title: 'The Boy Next Door',
                plot: 'Jennifer Lopez leads the cast in The Boy Next Door, a psychological thriller that explores a forbidden attraction ',
                actors: [
                  'Jennifer Lopez',
                  'John Corbett',
                  'Ryan Guzman',
                  'Ian Nelson',
                  'Kristin Chenoweth',
                  'Lexi Atkins'
                ],
                released: Date.new(2015, 1, 23),
                genre: ['Mystery & Suspense'],
                trailer: 'www.youtube.com/embed/KWWB11YulPc',
                earnings: 14.9
                ) }

  describe 'GET #index' do
    it 'renders index' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'populates an array of items' do
      get :index 
      expect(assigns(:movies)).to eq([movie1, movie2])
    end
  end

  describe 'GET #show' do
    it 'renders show' do
      get :show, id: movie1.id 
      expect(response).to render_template(:show)
    end

    it 'assigns correct item' do
      get :show, id: movie1.id
      expect(assigns(:movie)).to eq(movie1)
    end
  end

  describe 'GET #new' do
    it 'renders new' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new Movie' do
      get :new
      expect(assigns(:movie)).to be_a_new(Movie)
    end
  end

  describe 'POST #create' do
    context 'valid attributes' do
      let(:valid_attributes) { {
        title:  'The Boy Next Door',
        plot:   'Jennifer Lopez leads the cast in The Boy Next Door, a ',
        actors: ['Lexi Atkins'],
        released: Date.new(2015, 1, 23),
        genre: ['Mystery & Suspense'],
        trailer: 'www.youtube.com/embed/KWWB11YulPc',
        earnings: 14.9
        } }

      it 'create new movie' do
        expect {
          post :create, movie: valid_attributes         
        }.to change(Movie, :count).by(1)
      end

      it 'redirect to movies#index' do
        post :create, movie: valid_attributes
        expect(response).to redirect_to(movies_path)
      end
    end

    context 'invalid attributes' do
      let(:invalid_attributes) { { title: '' } }

      it 'does not create new movie' do
        expect {
          post :create, movie: invalid_attributes
        }.to_not change(Movie, :count)
      end

      it 're-renders new' do
        post :create, movie: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end
end
