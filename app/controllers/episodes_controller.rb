class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
  end

  # GET /episodes/new
  def new
    @trabajador = Trabajador.find(params[:trabajador_id])
    @episode = Episode.new

    render 'episodes/_epi'

  end

  # GET /episodes/1/edit
  def edit
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @trabajador = Trabajador.find(params[:trabajador_id])
    @episode = @trabajador.episodes.create(episode_params)
    redirect_to trabajador_path(@trabajador)

  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @trabajador = Trabajador.find(params[:trabajador_id])
    @episode = @trabajador.episodes.find(params[:id])
    @episode.destroy
    redirect_to trabajador_path(@trabajador)


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def episode_params
      params.require(:episode).permit(:folio, :tipo_ingreso, :fecha_ingreso, :contactos_laborales, :contactos_no_laborales, :presentacion, :inicio_sintomas, :inicio_cuarentena, :fin_cuarentena, :fin_cuarentena_codelco, :origen_contagio, :cierre, :trabajador_id)
    end
end
