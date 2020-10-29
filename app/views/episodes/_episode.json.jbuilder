json.extract! episode, :id, :folio, :tipo_ingreso, :fecha_ingreso, :contactos_laborales, :contactos_no_laborales, :presentacion, :inicio_sintomas, :inicio_cuarentena, :fin_cuarentena, :fin_cuarentena_codelco, :origen_contagio, :cierre, :trabajador_id, :created_at, :updated_at
json.url episode_url(episode, format: :json)
