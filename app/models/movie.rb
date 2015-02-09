class Movie < ActiveRecord::Base
    validates :title,    presence: true, length: { maximum: 254 }
    validates :plot,     presence: true
    validates :actors,   presence: true
    validates :released, presence: true
    validates :genre,    presence: true
    validates :trailer,  presence: true
    validates :earnings, presence: true
end
