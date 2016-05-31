# GET Top Entities by Phrase /phrases/:entity.json
#
# Params:
# entity - enumerated - legislator/state/volume/chamber
# phrase - string
# mincount - integer
# page - integer
# per_page - integer
# sort - string
# state - string
# party - enumerated - D/R/I
# chamber - enumerated - house/senate/extensions
# date - date
# start_date - date
# end_date - date


module CapitolWordsWrapper

  STATES = %w(WA CA VA)
  API_ENDPOINT = "http://capitolwords.org/api/1"

  def self.phrase(phrase)
    # table = [
    #   {state: "WA", count: 2},
    #   {state: "CA", count: 4},
    #   {state: "VA", count: 9}
    # ]

    uri = Addressable::URI.parse(API_ENDPOINT + "/phrases/sta te.json")
    uri.query_values = {
      phrase: phrase,
      sort: "count",
      start_date: "2015-01-01",
      end_date: "2015-12-31",
      apikey: ENV["SUNLIGHT_FOUNDATION_KEY"]
    }

    table = HTTParty.get(uri.normalize.to_s).parsed_response["results"]
    table.map { |row| row.merge("count" => row["count"].to_i) }.select { |row| STATES.include?(row["state"]) }

  end

  def self.state

  end
end
