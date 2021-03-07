class Movie < ActiveRecord::Base
  
  @ratings = ['G','PG','PG-13','R']
  
  def self.all_ratings
    return @ratings
  end
  
  def self.with_ratings(ratings)
    # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
    # movies with those ratings
    # if ratings_list is nil, retrieve ALL movies
    if ratings && ratings.empty? or ratings.nil? 
       return Movie.all
    else
      return Movie.where(rating: ratings)
    end
  end
  
  def self.order_by(sort, ratings)
    return Movie.order("#{sort} ASC").with_ratings(ratings)
  end
end