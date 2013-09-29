class Hamsters::VideosController < HamstersController
  skip_before_filter :require_admin
  def index
    @videos=Video.where(tag:'Hamster').to_a
    @selected_nav=2
  end
end
