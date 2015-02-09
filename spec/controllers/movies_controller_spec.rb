require 'rails_helper'

describe MoviesController, type: :controller do 
  describe '#index' do
    it 'renders movies' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#show' do
    it 'renders movie' do
      get :show, id: 1 
      expect(response).to render_template(:show)
    end
  end
end