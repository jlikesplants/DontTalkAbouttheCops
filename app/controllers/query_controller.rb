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
    @matched_fatalities = TheCountedWrapper.state("CA", "2015")
  end

  def search
    if params[:search]
      @phrase_search = CapitolWordsWrapper.phrase(params[:search])
    else
      @phrase_search = CapitolWordsWrapper.phrase("civil rights")
    end
  end

end
