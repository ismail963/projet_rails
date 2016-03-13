class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :negotiate_xhtml
  after_filter :set_content_type

  def negotiate_xhtml
    @serving_polyglot = false
    if params[:format].nil? or request.format == :html
      @serving_polyglot = ((not request.accepts.include? :xhtml) or params[:format] == 'html')
      request.format = :xhtml
    end
  end

  def set_content_type
    if @serving_polyglot
      response.content_type = 'text/html'
    end
  end 

end
