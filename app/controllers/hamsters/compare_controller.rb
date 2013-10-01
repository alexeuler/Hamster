class Hamsters::CompareController < HamstersController
  skip_before_action :require_admin
  skip_before_action :set_hamster
  def show
    @selected_nav=3
  end
end
