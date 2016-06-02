
module TheCountedWrapper
  API_ENDPOINT = "http://thecountedapi.com/api/counted"
  YEAR = "2015"

  def self.year(year)
    response = HTTParty.get(API_ENDPOINT + "/?year=#{YEAR}")
    table = response.map { |row| { "name": row["name"], "age": row["age"], "sex": row["sex"], "race": row["race"], "year": row["year"], "state": row["state"], "cause": row["cause"] } }
  end

  def self.state(state)
    response = year(YEAR)
    response.find_all { |row| row[:state] == state.to_s.upcase}
  end
end
