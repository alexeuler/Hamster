class Hamsters::CompareController < ApplicationController
  skip_before_filter :require_admin
  def show
    @selected_nav=3
  end
end
