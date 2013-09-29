class Hamsters::VideosController < HamstersController
 
  def index
    @videos=Video.where(tag:'Hamster').to_a
    @selected_nav=2
  end
end
