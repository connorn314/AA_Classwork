def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between 3 and 5
  # (inclusive). Show the id, title, year, and score.

  Movie
    .select("movies.id, movies.title, movies.yr, movies.score")
    .where("movies.score BETWEEN 3 AND 5")
    .where("movies.yr BETWEEN 1980 AND 1989")
  
end

def bad_years
  # List the years in which no movie with a rating above 8 was released.
  badMovies = Movie.select("movies.yr").where("movies.score > 8")

  Movie
    .where("movies.yr NOT IN (?)", badMovies).distinct.pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.

  Movie
    .select("actors.id, actors.name")
    .joins(:actors)
    .where("movies.title = ?", title)
    .order("castings.ord ASC")
end

def vanity_projects
  # List the title of all movies in which the director also appeared as the
  # starring actor. Show the movie id, title, and director's name.

  # Note: Directors appear in the 'actors' table.
  Actor
    .select("movies.id, movies.title, actors.name").distinct
    .joins(:directed_movies)
    .joins(:castings)
    .where("castings.ord = 1")
    .where("actors.id = castings.actor_id")
    
    # .group("actors.id")
    # .having("COUNT(")
  # Movie
  #   .select("movies.id, movies.title, actors.name")
  #   .joins(:director)
  #   .joins(:castings)
  #   .where("castings.ord = 1")
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name, and number of supporting roles.
  
end