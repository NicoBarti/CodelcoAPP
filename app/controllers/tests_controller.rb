class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  layout "ficha_trabajador"

  # GET /tests
  # GET /tests.json
  def index
    @trabajador = Trabajador.find(params[:trabajador_id])
    @tests = @trabajador.tests
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @trabajador = Trabajador.find(params[:trabajador_id])

  end

  # GET /tests/new
  def new
    # @episode = Episode.find(params[:episode_id])
    @trabajador = Trabajador.find(params[:trabajador_id])
    @test = Test.new
    @hoy = Date.today
  end

  # GET /tests/1/edit
  def edit
    @trabajador = Trabajador.find(@test.trabajador_id)
  end

  # POST /tests
  # POST /tests.json
  def create
    # @episode = Episode.find(params[:episode_id])

    @trabajador = Trabajador.find(params[:trabajador_id])
    @test = @trabajador.tests.build(test_params)


    respond_to do |format|
      if @test.save
        format.html { redirect_to trabajador_path(@trabajador), notice: 'Resultado de test guardadao' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new}
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:fecha_resultado, :fecha_toma, :tipo_test, :resultado, :trabajador_id)
    end
end
