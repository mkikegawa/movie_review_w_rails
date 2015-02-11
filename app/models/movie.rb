class Movie < ActiveRecord::Base
    validates :title,    presence: true, length: { maximum: 254 }
    validates :plot,     presence: true
    validates :earnings, presence: true

  def self.find_by_id(id)
    all.find do |movie|
      movie.id == id
    end
  end

  def self.sort_by_title(library,  order = 'asc')
    sorted = library.sort { |x, y| x.title <=> y.title }
    order == 'desc' ? sorted.reverse : sorted
  end

  def self.sort_by_release(library, order = 'asc')
    sorted = library.sort { |x, y| x.released <=> y.released }
    order == 'desc' ? sorted.reverse : sorted
  end

  def self.sort_by_earnings(library, order = 'asc')
    sorted = library.sort { |x, y| x.earnings <=> y.earnings }
    order == 'desc' ? sorted.reverse : sorted
  end

  def self.movies_search_sort(search, category, sort_order = 'asc')
    if search && search.length > 0
      movies = search(search)
    else
      movies = all
    end
    if category && category.length > 0
      movies_sort(movies, category, sort_order)
    else
      all
    end
  end

  def self.movies_sort(movies, category, sort_order = 'asc')
    case category
    when 'title'
      sort_by_title(movies, sort_order)
    when 'released'
      sort_by_release(movies, sort_order)
    when 'earnings'
      sort_by_earnings(movies, sort_order)
    else
      all
    end
  end

  def self.search(item)
    all.select do |movie|
      movie.genre.downcase.include?(item.downcase)   ||
        movie.title.downcase.include?(item.downcase) ||
        movie.plot.downcase.include?(item.downcase)  ||
        movie.actors.downcase.include?(item.downcase)
    end
  end

  def self.glyph_builder(sort_order, glyph)
    if sort_order == 'desc'
      "<i class='glyphicon #{ glyph }-alt'></i>"
    else
      "<i class='glyphicon #{ glyph }'></i>"
    end
  end

  def self.sort_order_link(sort_order)
    if sort_order == 'desc'
      'asc'
    else
      'desc'
    end
  end

  def self.sort_link_generator(name, search, category, glyph,
      sort_order = 'asc')
    link = "<a href='/movies?"
    link << "search=#{ search }&" if search && search.length > 0
    link << "category=#{ name }&sort_order=#{ sort_order_link(sort_order) }'" \
      ">#{ name.capitalize } "
    link << "#{ glyph_builder(sort_order, glyph) }" if category == name
    link << '</a>'
  end
end
