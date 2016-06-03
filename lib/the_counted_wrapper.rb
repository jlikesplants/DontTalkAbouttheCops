
module TheCountedWrapper
  API_ENDPOINT = "http://thecountedapi.com/api/counted"
  YEAR = "2015"

  def self.year(year)
    response = HTTParty.get(API_ENDPOINT + "/?year=#{YEAR}")
    table = response.map { |row| { "name": row["name"], "age": row["age"], "sex": row["sex"], "race": row["race"], "year": row["year"], "state": row["state"], "cause": row["cause"] } }
  end

  def self.state_fatalities(state)
    table = year(YEAR)
    table.find_all { |row| row[:state] == state.to_s.upcase}
  end

  def self.all_states
    year(YEAR).sort_by { |row| row["state"] }
  end

  def self.total_fatalities(year)
    year(year).count
  end

  # get all records
  # count how many fatalities per state
  # return highest & lowest
  def self.min_max_fatalities
    states_tally = []
    all = all_states
    CapitolWordsWrapper::STATES.each do |state|
      hash = {}
      count = all.find_all { |row| row[:state] == state.to_s.upcase}.count
      hash["state"] = state
      hash["count"] = count
      states_tally << hash
    end
    states_tally.minmax_by { |row| row["count"].to_i }
  end
end
