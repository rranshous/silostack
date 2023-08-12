require 'sinatra'

configure do
  set :bind, '0.0.0.0'
  set :port, '4567'
end

configure :production do
  certificate_content = File.open(ENV['SSL_CERT_PATH']).read
  key_content = File.open(ENV['SSL_KEY_PATH']).read
  puts "KEY CONTENT: #{key_content}"

  set :server_settings, {
    SSLEnable: true,
    SSLCertificate: OpenSSL::X509::Certificate.new(certificate_content),
    SSLPrivateKey: OpenSSL::PKey::RSA.new(key_content)
  }
end


get '/' do
  puts "getting root"
  "hello w0rld"
end
