class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :prod_url
      t.string :staging_url
      t.string :repo_url
      t.string :admin_user
      t.string :admin_password
      t.string :ftp_host
      t.string :ftp_user
      t.string :ftp_password

      t.timestamps
    end
  end
end
