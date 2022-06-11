class ApplicationController < ActionController::Base

  def home
    render(html: "Microposter")
  end
end
