class ContactosController < ApplicationController
  before_action :set_contacto, only: [:show, :edit, :update, :destroy]

  # GET /contactos
  # GET /contactos.json
  def index
    @contactos = Contacto.all
  end

  # GET /contactos/1
  # GET /contactos/1.json
  def show
  end

  # GET /contactos/new
  def new
    @episode = Episode.find(params[:episode_id])
    @trabajador = Trabajador.find(@episode.trabajador_id)
    @contacto = Contacto.new
  end

  # GET /contactos/1/edit
  def edit
  end

  # POST /contactos
  # POST /contactos.json
  def create
    @episode = Episode.find(params[:episode_id])
    @trabajador = Trabajador.find(@episode.trabajador_id)

    # Modifico parámetros antes de guardar
    contacto_patametros = contacto_params
    contacto_patametros[:fecha_investigacion] = Date.today

    @contacto = @episode.contactos.create(contacto_patametros)

    respond_to do |format|
      if @contacto.save
        actualizaContacos
        if existeRutLaboral
          format.html { redirect_to trabajador_path(@trabajador), notice: 'El contacto fue agregado.' }
          format.json { render :show, status: :created, location: @contacto }
        else
          format.html { redirect_to trabajador_path(@trabajador), notice: 'El RUT ingresado no está registrado como trabajador. Por favor, no olvide ingresarlo en la planilla de trabajadores.' }
        end
      else
        format.html { render :new }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contactos/1
  # PATCH/PUT /contactos/1.json
  def update
    respond_to do |format|
      if @contacto.update(contacto_params)
        format.html { redirect_to @contacto, notice: 'Contacto was successfully updated.' }
        format.json { render :show, status: :ok, location: @contacto }
      else
        format.html { render :edit }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contactos/1
  # DELETE /contactos/1.json
  def destroy
    @contacto.destroy
    respond_to do |format|
      format.html { redirect_to contactos_url, notice: 'Contacto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contacto
      @contacto = Contacto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contacto_params
      params.require(:contacto).permit(:tipo_contacto, :rut, :nombre, :parentesco, :fecha_investigacion, :episode_id)
    end

    def actualizaContacos
      if contacto_params[:tipo_contacto] == 'Laboral'
        @episode[:contactos_laborales] =  @episode[:contactos_laborales] + 1
        @episode.save
      else @episode[:contactos_no_laborales] =  @episode[:contactos_no_laborales] + 1
        @episode.save
      end
    end

    def existeRutLaboral
      a = Trabajador.find_by rut: @contacto.rut
        if a == nil
          tr = Trabajador.new
          tr[:rut] = @contacto.rut
          tr.save
          tr.episodes.create(rut_indice: @contacto.rut, contactos_laborales: 0,contactos_no_laborales: 0 ,abierto: true, cambioSeguimiento: 'Contacto', fecha_ingreso: Date.today, tipo_ingreso: 'Contacto')

          return false
        else
          activo =  a.episodes.find_by abierto: true
            if activo == nil
              a.episodes.create(rut_indice: @contacto.rut, contactos_laborales: 0,contactos_no_laborales: 0 ,abierto: true, cambioSeguimiento: 'Contacto', fecha_ingreso: Date.today, tipo_ingreso: 'Contacto')
            end
          return true
        end
    end

end
