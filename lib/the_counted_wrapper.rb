# [{"_id"=>"574ddf31e5b972652f2d7dc3",
#   "name"=>"Michael Kocher Jr",
#   "age"=>"19",
#   "sex"=>"Male",
#   "race"=>"White",
#   "month"=>"January",
#   "day"=>"3",
#   "year"=>"2015",
#   "address"=>"2600 Kaumualii Hwy",
#   "city"=>"Kaumakani",
#   "state"=>"HI",
#   "cause"=>"Struck by vehicle",
#   "dept"=>"Kauai Police Department",
#   "armed"=>"No",
#   "__v"=>0},



# search for all deaths in 2015 in each state
# return name, age, cause, state, race, sex

module TheCountedWrapper
  API_ENDPOINT = "http://thecountedapi.com/api/counted"

  def self.year(year)
    response = HTTParty.get(API_ENDPOINT + "/?year=#{year}")
    table = response.map { |row| { "name": row["name"], "age": row["age"], "sex": row["sex"], "race": row["race"], "year": row["year"], "state": row["state"], "cause": row["cause"] } }
  end

  def self.state(state, year)
    response = year(year)
    response.find_all { |row| row[:state] == state.to_s.upcase}
  end
end

# [{:name=>"Michael Kocher Jr", :age=>"19", :sex=>"Male", :race=>"White", :year=>"2015", :state=>"HI", :cause=>"Struck by vehicle"}, {:name=>"Michael Rodriguez", :age=>"39", :sex=>"Male", :race=>"Hispanic/Latino", :year=>"2015", :state=>"CO", :cause=>"Gunshot"}, {:name=>"Brock Nichols", :age=>"35", :sex=>"Male", :race=>"White", :year=>"2015", :state=>"KS", :cause=>"Gunshot"}, {:name=>"Hashim Abdul-Rasheed", :age=>"41", :sex=>"Male", :race=>"Black", :year=>"2015", :state=>"OH", :cause=>"Gunshot"}, {:name=>"James Barker", :age=>"42", :sex=>"Male", :race=>"White", :year=>"2015", :state=>"UT", :cause=>"Gunshot"}, {:name=>"Salvador Figueroa", :age=>"29", :sex=>"Male", :race=>"Hispanic/Latino", :year=>"2015", :state=>"NV", :cause=>"Gunshot"}, {:name=>"Michael Goebel", :age=>"29", :sex=>"Male", :race=>"White", :year=>"2015", :state=>"MO", :cause=>"Gunshot"}, {:name=>"Mario Jordan", :age=>"34", :sex=>"Male", :race=>"Black", :year=>"2015", :state=>"VA", :cause=>"Gunshot"}, {:name=>"Quincy Reindl", :age=>"24", :sex=>"Male", :race=>"White", :year=>"2015", :state=>"MN", :cause=>"Gunshot"}, {:name=>"Sinthanouxay Khottavongsa", :age=>"57", :sex=>"Male", :race=>"Asian/Pacific Islander", :year=>"2015", :state=>"MN", :cause=>"Taser"}, {:name=>"Terence Walker", :age=>"21", :sex=>"Male", :race=>"Black", :year=>"2015", :state=>"OK", :cause=>"Gunshot"}, {:name=>"Todd Allen Hodge", :age=>"36", :sex=>"Male", :race=>"White", :year=>"2015", :state=>"CA", :cause=>"Gunshot"}, {:name=>"Kristiana Coignard", :age=>"17", :sex=>"Female", :race=>"White", :year=>"2015", :state=>"TX", :cause=>"Gunshot"}]
