class ReporteController < ApplicationController

def index
  @trabajadors = Trabajador.all

  respond_to do |format|
        format.html
        format.csv { send_data @trabajadors.to_csv, filename: "trabajadores-#{Date.today}.csv" }
  end
end
end
