require 'capitol_words_wrapper'
require 'the_counted_wrapper'

class QueriesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    
  end

  def search
    if params[:search].present?
      @phrase = params[:search]
    else
      render :index
    end
  end

  def show
    if params[:search].present?
      @phrase = params[:search]
    else
      @phrase = params["id"].gsub!(/[^0-9a-z]/i, ' ')
    end
    @year = "2015"
    @state = CapitolWordsWrapper::STATES
    @total_mentions = CapitolWordsWrapper.total_mentions(@phrase)
    @min_max_mentions = CapitolWordsWrapper.min_max(@phrase)
    @min_fatalities_phrase = TheCountedWrapper.state_fatalities(@min_max_mentions[0]["state"])
    @max_fatalities_phrase = TheCountedWrapper.state_fatalities(@min_max_mentions[1]["state"])
    @fatalities = TheCountedWrapper.total_fatalities(@year)
    @min_max_fatalities_state = TheCountedWrapper.min_max_fatalities
  end

end
