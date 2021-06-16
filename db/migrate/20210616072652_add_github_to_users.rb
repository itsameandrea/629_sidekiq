class AddGithubToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gh_username, :string
    add_column :users, :gh_avatar, :string
    add_column :users, :gh_repos_count, :integer
  end
end
