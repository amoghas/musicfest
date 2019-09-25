CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIASBKNWQCOOR4NQPE2',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'ap-northeast-2'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'mfestresources'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end