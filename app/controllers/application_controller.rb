class ApplicationController < ActionController::API
  def four_oh_four
    raise ActionController::RoutingError.new('Not Found')
  end
end
