class PagesController < ApplicationController
  include HighVoltage::StaticPage
  skip_before_action :authenticate_user!, :only => [:show]
end
