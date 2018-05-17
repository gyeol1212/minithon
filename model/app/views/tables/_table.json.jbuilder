json.extract! table, :id, :title, :price, :etc, :post_id, :created_at, :updated_at
json.url table_url(table, format: :json)
