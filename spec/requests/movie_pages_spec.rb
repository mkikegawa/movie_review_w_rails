require 'rails_helper'

describe 'movie pages' do
  subject { page }

  describe 'index' do
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

    before { visit movies_path }

    it { should have_title('Movies Index') }

    it 'lists each movie' do
      Movie.all.each do |movie|
        expect(page).to have_selector('a', text: movie.id)
      end
    end
  end

  describe 'show' do
    let(:movie) { Movie.create( 
        title:  'The Boy Next Door',
        plot:   'Jennifer Lopez leads the cast in The Boy Next Door, a ',
        actors: ['Lexi Atkins'],
        released: Date.new(2015, 1, 23),
        genre: ['Mystery & Suspense'],
        trailer: 'www.youtube.com/embed/KWWB11YulPc',
        earnings: 14.9) }

    before { visit movie_path(movie.id) }

    it { should have_title(movie.title) }
    it { should have_selector('h1', text: movie.title) }
  end

  describe 'new movie page' do
    before { visit new_movie_path }

    it { should have_title('New/Edit Movie') }
    it { should have_selector('h1', 'New/Edit') }

    describe 'create item' do
      let(:submit) { 'New/Edit Movie' }

      context 'valid information' do
        before do
          fill_in 'Title',    with: 'Great Movie'
          fill_in 'Plot',     with: 'This the the plot of the movie'
          fill_in 'Earnings', with: '10.5'
        end

        it 'creates item' do
          expect { click_button submit }.to change(Movie, :count).by(1)
        end

        describe 'after saving' do
          before { click_button submit }

          it { should have_title('Movies Index') } 
        end
      end

      context 'invalid information' do
        it 'does not create item' do
          expect { click_button submit }.not_to change(Movie, :count)
        end

        describe 'after submission' do
          before { click_button submit }

          it { should have_title('New/Edit Movie') }
          it { should have_content('error') }
        end
      end
    end
  end 
end


