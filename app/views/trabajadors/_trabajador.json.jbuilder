json.extract! trabajador, :id, :sexo, :rut, :apellido1, :apellido2, :nombres, :fecha_nac, :edad, :region, :comuna, :prevision, :nacionalidad, :division, :tipo_trabajador, :empresa, :created_at, :updated_at
json.url trabajador_url(trabajador, format: :json)
