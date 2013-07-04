class UsersOrganisations < ActiveRecord::Migration
  def up
    create_table :clients_trainers, :id => false  do |t|
      t.integer :client_id
      t.integer :trainer_id
    end
  end

  def down
    drop_table :clients_trainers
  end
end
