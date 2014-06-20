class CreateServiceTypes < ActiveRecord::Migration
  def change
    create_table :spree_service_types do |t|
      t.string :name
      t.integer :limit
      t.integer :limit_amount
      t.timestamps
    end
    add_index :spree_service_types, [:name], :name => 'index_spree_service_types_on_name'

    create_table :spree_service_fields do |t|
      t.string :name
      t.integer :type
      t.integer :position
      t.references :service_type
      t.timestamps
    end
    add_index :spree_service_fields, [:name], :name => 'index_spree_service_fields_on_name'
    add_index :spree_service_fields, :position

    add_reference :spree_variants, :service, index: true
  end  
end
