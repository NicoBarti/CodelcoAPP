class ReporteController < ApplicationController

def index
  @trabajadors = Trabajador.all
  @episodes = Episode.all
  @contactos = Contacto.all
  @aa = Trabajador.all.extract_associated(:episodes)

  respond_to do |format|
        format.html
        # format.csv { send_data Trabajador.joins(:episodes).to_csv, filename: "trabajadores-#{Date.today}.csv" }
        # format.csv { send_data @episodes.to_csv, filename: "episodios-#{Date.today}.csv" }
        # format.csv { send_data @contactos.to_csv, filename: "episodios-#{Date.today}.csv" }
        # format.csv { send_data Trabajador.joins(:tests).to_csv, filename: "trabajadores-#{Date.today}.csv" }
        format.csv { send_data @aa.to_csv, filename: "trabajadores-#{Date.today}.csv" }

  end
end
end


# "INNER JOIN posts ON posts.author_id = authors.id AND posts.published = 't'"
