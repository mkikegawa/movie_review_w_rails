class Movie < ActiveRecord::Base
    validates :title,    presence: true, length: { maximum: 254 }
    validates :plot,     presence: true
    validates :earnings, presence: true
end
