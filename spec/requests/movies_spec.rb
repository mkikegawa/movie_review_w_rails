require 'rails_helper'

describe 'movies pages' do
  subject { page }

  describe 'movies#index' do
    before { visit movie_path }

    it { should have_selector('Title')}
  end

  describe 'about page' do


  end
end