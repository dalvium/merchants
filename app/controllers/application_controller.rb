class ApplicationController < ActionController::Base
  before_action :authenticate_merchant!
  add_flash_types :warning
end
