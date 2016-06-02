require 'capitol_words_wrapper'
require 'the_counted_wrapper'

class QueryController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @phrase = "civil rights"
    @year = "2015"
    @words = CapitolWordsWrapper.phrase(@phrase)
    @fatalities = TheCountedWrapper.year(@year)
    @matched_fatalities = TheCountedWrapper.state(@state)
  end

  def search
    if params[:search]
      @phrase_search = CapitolWordsWrapper.phrase(params[:search])
    else
      @phrase_search = CapitolWordsWrapper.phrase("civil rights")
    end
  end

  def civil_rights
    @phrase = "civil rights"
    @state = CapitolWordsWrapper::STATES
    @matched_fatalities = TheCountedWrapper.state(@state)
    @total_mentions = CapitolWordsWrapper.total_mentions(@phrase)
    @min_max = CapitolWordsWrapper.min_max(@phrase)
  end

  def blm
    @phrase = "black lives matter"
    @state = CapitolWordsWrapper::STATES
    @words = CapitolWordsWrapper.phrase(@phrase)
    @matched_fatalities = TheCountedWrapper.state(@state)
  end

  def police_brutality
    @phrase = "police_brutality"
    @state = CapitolWordsWrapper::STATES
    @words = CapitolWordsWrapper.phrase(@phrase)
    @matched_fatalities = TheCountedWrapper.state(@state)
  end

end
