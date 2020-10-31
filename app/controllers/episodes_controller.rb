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
    @trabajador = Trabajador.find(@episode.trabajador_id)
    @sintoma = @episode.sintoma
    @contactos = @episode.contactos
    @Useguimiento = @episode.seguimientos.last

  end

  # GET /episodes/new
  def new
    @trabajador = Trabajador.find(params[:trabajador_id])
    @episode = Episode.new

    render 'episodes/_epi'

  end

  # GET /episodes/1/edit
  def edit
    @trabajador = Trabajador.find(@episode.trabajador_id)
    # parantiq = episode_params.cambioSeguimiento
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @trabajador = Trabajador.find(params[:trabajador_id])

    # Modifico parámetros antes de guardar
    episode_parametros = episode_params
      episode_parametros[:abierto] = true
      episode_parametros[:cambioSeguimiento] = episode_parametros[:tipo_ingreso]
      episode_parametros[:fecha_ingreso] = Date.today
      episode_parametros[:contactos_laborales] = 0
      episode_parametros[:contactos_no_laborales] = 0

    @episode = @trabajador.episodes.create(episode_parametros)
    if @episode.tipo_ingreso == "Contacto"
      redirect_to trabajador_path(@trabajador)
    else
      redirect_to new_episode_sintoma_path(@episode)
    end

  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    @trabajador = Trabajador.find(@episode.trabajador_id)

    respond_to do |format|
      if @episode.update(episode_params)
        if @episode.sintoma == nil and @episode.abierto
          format.html { redirect_to new_episode_sintoma_path(@episode), notice: 'Se modifico el episodio.' }
          format.json { render :show, status: :ok, location: @episode }
        else
          format.html { redirect_to @trabajador, notice: 'Se modifico el episodio.' }
          format.json { render :show, status: :ok, location: @episode }
        end


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
      params.require(:episode).permit(:folio, :abierto, :rut_indice, :cambioSeguimiento, :tipo_ingreso, :fecha_ingreso, :contactos_laborales, :contactos_no_laborales, :presentacion, :inicio_sintomas, :inicio_cuarentena, :fin_cuarentena, :fin_cuarentena_codelco, :origen_contagio, :cierre, :trabajador_id)
    end
end
