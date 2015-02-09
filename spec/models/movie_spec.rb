require 'rails_helper'

# RSpec.describe Movie, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"


describe Movie do
  let(:movie) { 
    Movie.new(
      title: 'American Sniper',
      plot: 'From director Clint Eastwood comes \'American Sniper,\' starring Bradley Cooper as Chris Kyle, the most lethal sniper in U.S. military history. But there was much more to this true American hero than his skill with a rifle. U.S. Navy SEAL sniper Chris Kyle is sent to Iraq with only one mission: to protect his brothers-in-arms. His pinpoint accuracy saves countless lives on the battlefield and, as stories of his courageous exploits spread, he earns the nickname \'Legend.\' However, his reputation is also growing behind enemy lines, putting a price on his head and making him a prime target of insurgents. Despite the danger, as well as the toll on his family at home, Chris serves through four harrowing tours of duty in Iraq, becoming emblematic of the SEAL creed to \'leave no man behind.\' But upon returning home, Chris finds that it is the war he can\'t leave behind. (C) Warner Bros',
      actors: 'Bradley Cooper',
      released: Date.new(2015, 1, 16),
      genre: 'Drama',
      trailer: 'www.youtube.com/embed/99k3u9ay1gs',
      earnings: 64.6
    )
  }

  subject { movie }

  it { should respond_to(:title) }
  it { should respond_to(:plot) }
  it { should respond_to(:actors) }
  it { should respond_to(:released) }
  it { should respond_to(:genre) }
  it { should respond_to(:trailer) }
  it { should respond_to(:earnings) }

  it { should be_valid }

  describe 'validations' do
    describe 'title' do
      context 'not present' do
        before { movie.title = nil }
        it { should_not be_valid }
      end
    
      context 'too long' do
        before { movie.title = 'a' * 255 }
        it { should_not be_valid }
      end
    end

    describe 'plot' do
      context 'not present' do
        before { movie.plot = nil }
        it { should_not be_valid }
      end
    end

    describe 'actors' do
      context 'not present' do
        before { movie.actors = nil }
        it { should_not be_valid }
      end
    end
 

    describe 'genre' do
      context 'not present' do
        before { movie.genre = nil }
        it { should_not be_valid }
      end
    end
  

    describe 'released' do
      context 'not present' do
        before { movie.released = nil }
        it { should_not be_valid }
      end
    end
  
    describe 'trailer' do
      context 'not present' do
        before { movie.trailer = nil }
        it { should_not be_valid }
      end
    end

    describe 'earnings' do
      context 'not present' do
        before { movie.earnings = nil }
        it { should_not be_valid }
      end
    end
  end
end
