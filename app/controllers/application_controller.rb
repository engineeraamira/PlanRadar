class ApplicationController < ActionController::Base
  include Clearance::Controller

  before_action :require_login, except: [:sign_up, :sign_in]

end
