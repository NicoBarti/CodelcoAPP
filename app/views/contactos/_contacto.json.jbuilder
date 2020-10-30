json.extract! contacto, :id, :tipo_contacto, :parentesco, :fecha_investigacion, :episode_id, :created_at, :updated_at
json.url contacto_url(contacto, format: :json)
