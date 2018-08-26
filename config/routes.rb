Rails.application.routes.draw do
  mount_ember_app :stage, to: "/"
end
