Rails.application.routes.draw do
  get 'passmaker/index'

  root 'passmaker#index'

  post '/ajax/passgen' => 'passmakercontroller#generate_pass'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
