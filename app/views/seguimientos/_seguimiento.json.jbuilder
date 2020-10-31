json.extract! seguimiento, :id, :tipo_aislamiento, :estado_seguimiento, :hospitalizacion, :ventilacion, :falleceresp, :estadoegreso, :evolucion, :references, :created_at, :updated_at
json.url seguimiento_url(seguimiento, format: :json)
