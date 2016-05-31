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
end
