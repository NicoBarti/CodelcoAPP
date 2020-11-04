class SeguimientosController < ApplicationController
  before_action :set_seguimiento, only: [:show, :edit, :update, :destroy]
  layout "ficha_trabajador"

  # GET /seguimientos
  # GET /seguimientos.json
  def index
    @episode = Episode.find(params[:episode_id])
    @trabajador = Trabajador.find(@episode.trabajador_id)
    @seguimientos = Seguimiento.all
  end

  # GET /seguimientos/1
  # GET /seguimientos/1.json
  def show
  end

  # GET /seguimientos/new
  def new
    @episode = Episode.find(params[:episode_id])
    @trabajador = Trabajador.find(@episode.trabajador_id)
    @seguimiento = Seguimiento.new
  end

  # GET /seguimientos/1/edit
  def edit
  end

  # POST /seguimientos
  # POST /seguimientos.json
  def create
    @episode = Episode.find(params[:episode_id])
    @trabajador = Trabajador.find(@episode.trabajador_id)

    # Modifico parámetros antes de guardar
    seguimiento_parametros = seguimiento_params
    seguimiento_parametros[:fecha_seguimiento] = Date.today

    @seguimiento = @episode.seguimientos.create(seguimiento_parametros)

    respond_to do |format|
      if @seguimiento.save
        format.html { redirect_to trabajador_path(@trabajador), notice: 'El seguimiento se guardo bien.' }
        format.json { render :show, status: :created, location: @seguimiento }
      else
        format.html { render :new }
        format.json { render json: @seguimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seguimientos/1
  # PATCH/PUT /seguimientos/1.json
  def update
    respond_to do |format|
      if @seguimiento.update(seguimiento_params)
        format.html { redirect_to @seguimiento, notice: 'Seguimiento was successfully updated.' }
        format.json { render :show, status: :ok, location: @seguimiento }
      else
        format.html { render :edit }
        format.json { render json: @seguimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguimientos/1
  # DELETE /seguimientos/1.json
  def destroy
    @seguimiento.destroy
    respond_to do |format|
      format.html { redirect_to seguimientos_url, notice: 'Seguimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seguimiento
      @seguimiento = Seguimiento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seguimiento_params
      params.require(:seguimiento).permit(:tipo_aislamiento, :fecha_seguimiento, :estado_seguimiento, :hospitalizacion, :ventilacion, :falleceresp, :estadoegreso, :evolucion, :references)
    end
end
