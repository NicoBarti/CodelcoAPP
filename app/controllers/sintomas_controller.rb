class SintomasController < ApplicationController
  before_action :set_sintoma, only: [:show, :edit, :update, :destroy]
  layout "ficha_trabajador"


  # GET /sintomas
  # GET /sintomas.json
  def index
    @sintomas = Sintoma.all
  end

  # GET /sintomas/1
  # GET /sintomas/1.json
  def show
  end

  # GET /sintomas/new
  def new
    @episode = Episode.find(params[:episode_id])
    @trabajador = Trabajador.find(@episode.trabajador_id)
    @sintoma = Sintoma.new
  end

  # GET /sintomas/1/edit
  def edit
  end

  # POST /sintomas
  # POST /sintomas.json
  def create
    @episode = Episode.find(params[:episode_id])
    @trabajador = Trabajador.find(@episode.trabajador_id)

    @sintoma = @episode.build_sintoma(sintoma_params)

    respond_to do |format|
      if @sintoma.save

        actualizaEpisodio

        format.html { redirect_to trabajador_path(@trabajador), notice: 'Sintoma agregados al ingreso.' }
        format.json { render :show, status: :created, location: @sintoma }
      else
        format.html { render :new }
        format.json { render json: @sintoma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sintomas/1
  # PATCH/PUT /sintomas/1.json
  def update
    respond_to do |format|
      if @sintoma.update(sintoma_params)
        format.html { redirect_to @sintoma, notice: 'Sintoma was successfully updated.' }
        format.json { render :show, status: :ok, location: @sintoma }
      else
        format.html { render :edit }
        format.json { render json: @sintoma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sintomas/1
  # DELETE /sintomas/1.json
  def destroy
    @sintoma.destroy
    respond_to do |format|
      format.html { redirect_to sintomas_url, notice: 'Sintoma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sintoma
      @sintoma = Sintoma.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sintoma_params
      params.require(:sintoma).permit(:inicio_sintomas, :fiebre, :cefalea, :disnea, :tos, :odinofagia, :taquipnea, :cianosis, :mialgia, :dolorabdominal, :diarrea, :anosmia, :agueusia, :diabetes, :hipertension, :otras, :episode_id)
    end

    def actualizaEpisodio
      if @sintoma.fiebre or @sintoma.cefalea or @sintoma.disnea or @sintoma.tos or @sintoma.odinofagia or @sintoma.taquipnea or @sintoma.cianosis or @sintoma.mialgia or @sintoma.dolorabdominal or @sintoma.diarrea or @sintoma.anosmia or @sintoma.agueusia
        @episode[:presentacion] = "Sintomatico"
        @episode[:inicio_sintomas] = @sintoma.inicio_sintomas
      else
        @episode[:presentacion] = "Asintomatico"
      end
      @episode.save
    end
end
