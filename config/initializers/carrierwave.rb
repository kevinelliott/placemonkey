Fog.credentials_path = Rails.root.join('config/fog_credentials.yml')

CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  
  config.fog_credentials = {
      :provider               => 'AWS'
  }
  config.fog_directory  = 'placemonkey'
  #config.fog_host       = 'https://assets.example.com'
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
end