json.extract! producto, :id, :codigo, :codigo_proveedor, :proveedor, :importado, :categoria, :created_at, :updated_at
json.url producto_url(producto, format: :json)
