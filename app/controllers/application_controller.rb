class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def pagination_params
    {
      page:     params[:page],
      per_page: 5
    }
  end
end
