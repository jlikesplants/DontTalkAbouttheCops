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

  def self.phrase(phrase)
    table = [
      {state: "WA", count: 2},
      {state: "CA", count: 4},
      {state: "VA", count: 9}
    ]
  end

  def self.state

  end
end
