class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  layout "ficha_trabajador"

  # GET /episodes
  # GET /episodes.json
  def index
    # @episodes = Episode.all
    @trabajador = Trabajador.find(params[:trabajador_id])
    @episodes = @trabajador.episodes

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
    # @episode = @trabajador.episodes.build
    # render layout: "ficha_trabajador"

  end

  # GET /episodes/1/edit
  def edit
    @trabajador = Trabajador.find(@episode.trabajador_id)
    # parantiq = episode_params.cambioSeguimiento

    if params[:cerrar] == "cerrar"
      if @episode.update(abierto: false)
      #   notice: 'Se modifico el episodio.'
        redirect_to @trabajador
      end

    end

  end


  # POST /episodes
  # POST /episodes.json
  def create
    @trabajador = Trabajador.find(params[:trabajador_id])

    params[:episode][:rut_indice] = RUT::format(params[:episode][:rut_indice])
    params[:episode][:abierto] = true
    params[:episode][:cambioSeguimiento] = params[:episode][:tipo_ingreso]
    params[:episode][:fecha_ingreso] = Date.today
    params[:episode][:contactos_laborales] = 0
    params[:episode][:contactos_no_laborales] = 0

    @episode = @trabajador.episodes.build(episode_params)

    respond_to do |format|
    if @episode.save
        if @episode.tipo_ingreso == "Contacto"
          format.html{  redirect_to trabajador_path(@trabajador) and return}
          else
          format.html{  redirect_to new_episode_sintoma_path(@episode) and return}
        end
    else
         format.html{ render :new, notice: @episode.errors.messages}
    end
   end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    params[:episode][:rut_indice] = RUT::format(params[:episode][:rut_indice])

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
      params.require(:episode).permit(:folio, :cerrar, :fechaPCR, :pcr, :abierto, :rut_indice, :cambioSeguimiento, :tipo_ingreso, :fecha_ingreso, :contactos_laborales, :contactos_no_laborales, :presentacion, :inicio_sintomas, :inicio_cuarentena, :fin_cuarentena, :fin_cuarentena_codelco, :origen_contagio, :cierre, :trabajador_id)
    end
end
