class BuscaTrabajadorController < ApplicationController
  layout "lista_y_busca_trabajador"


def index
  @trabajadors = Trabajador.all
render '_resultados'
end

def create
  params[:rut] = RUT::format(params[:rut])
  if params[:apellido1] == ""
    params[:apellido1] = "999"
  end
  if params[:apellido2] == ""
    params[:apellido2] = "999"
  end
  if params[:nombres] == ""
    params[:nombres] = "999"
  end

  @trabajadors = Trabajador.where("rut = ? OR nombres = ? OR apellido1 = ? OR apellido2 = ?", params[:rut], params[:nombres], params[:apellido1], params[:apellido2])
        if @trabajadors.blank?
          @trabajadors = Trabajador.all
          render  '_sinresultados'
        else
        render '_resultados'
        end
  end
end


private
  # Only allow a list of trusted parameters through.
  def buscaTrabajador_params
    params.permit(:rut, :apellido1, :apellido2, :nombres)
  end
