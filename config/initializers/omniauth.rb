OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,'842849218472-p6619h6om613qfghp751ik03tvssh0cu.apps.googleusercontent.com','uxVtsRS1WFPCFj_c04c4OcaM',{client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "464716873863755", "f05bb832186951c38943fe05e9e44372"
end
