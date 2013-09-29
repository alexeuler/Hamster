class Hamsters::VideosController < ApplicationController
  def index
    @videos=Video.where(tag:'Hamster').to_a
  end
end
