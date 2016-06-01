require 'capitol_words_wrapper'
require 'the_counted_wrapper'

class QueryController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @words = CapitolWordsWrapper.phrase("civil rights")
    @fatalities = TheCountedWrapper.year(@year)
  end
end
