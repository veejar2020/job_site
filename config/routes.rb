Rails.application.routes.draw do
  root :to => "wonolo/job_requests#index"
    namespace :wonolo do
    resources :jobs
    resources :job_requests
  end
end
