class PagesController < ApplicationController
  include HighVoltage::StaticPage
  skip_before_action :authenticate_user!

  def home
  end
end
