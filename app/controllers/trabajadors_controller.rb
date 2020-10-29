class TrabajadorsController < ApplicationController
  before_action :set_trabajador, only: [:show, :edit, :update, :destroy]

  # GET /trabajadors
  # GET /trabajadors.json
  def index
    @trabajadors = Trabajador.all
  end

  # GET /trabajadors/1
  # GET /trabajadors/1.json
  def show
  end

  # GET /trabajadors/new
  def new
    @trabajador = Trabajador.new
  end

  # GET /trabajadors/1/edit
  def edit
  end

  # POST /trabajadors
  # POST /trabajadors.json
  def create
    @trabajador = Trabajador.new(trabajador_params)

    respond_to do |format|
      if @trabajador.save
        format.html { redirect_to @trabajador, notice: 'Trabajador was successfully created.' }
        format.json { render :show, status: :created, location: @trabajador }
      else
        format.html { render :new }
        format.json { render json: @trabajador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trabajadors/1
  # PATCH/PUT /trabajadors/1.json
  def update
    respond_to do |format|
      if @trabajador.update(trabajador_params)
        format.html { redirect_to @trabajador, notice: 'Trabajador was successfully updated.' }
        format.json { render :show, status: :ok, location: @trabajador }
      else
        format.html { render :edit }
        format.json { render json: @trabajador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trabajadors/1
  # DELETE /trabajadors/1.json
  def destroy
    @trabajador.destroy
    respond_to do |format|
      format.html { redirect_to trabajadors_url, notice: 'Trabajador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trabajador
      @trabajador = Trabajador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trabajador_params
      params.require(:trabajador).permit(:rut, :apellido1, :apellido2, :nombres, :sexo, :fecha_nac, :edad, :region, :comuna, :prevision, :nacionalidad, :division, :tipo_trabajador, :empresa)
    end
end
