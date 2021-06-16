require 'uri'
require 'net/http'

class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Calling GH API for #{user.gh_username}..."
    
    uri = URI("https://api.github.com/users/#{user.gh_username}")
    res = Net::HTTP.get_response(uri)
    body = JSON.parse(res.body)

    sleep 20
    user.update gh_avatar: body["avatar_url"], gh_repos_count: body["public_repos"]

    puts "Done! Enriched #{user.gh_username} with GH"
  end
end