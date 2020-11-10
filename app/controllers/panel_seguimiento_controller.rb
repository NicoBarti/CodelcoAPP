class PanelSeguimientoController < ApplicationController
layout 'panelSeguimientos'

def index
@tt = Trabajador.joins(:episodes).where('abierto = true')
@ss = Episode.where('abierto = true')
end

end
