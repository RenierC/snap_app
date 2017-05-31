class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :codigo
      t.string :codigo_proveedor
      t.string :proveedor
      t.boolean :importado
      t.integer :categoria

      t.timestamps null: false
    end
  end
end
