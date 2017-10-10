OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "repo, gist, user"  #, {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
