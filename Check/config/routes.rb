Rails.application.routes.draw do
  get 'home/index'

  get 'home/mypage'

  get 'home/edit'

  get 'home/destroy/:check_id' => 'home#destroy'

  post 'home/mypage'

  get 'home/ok/:check_id' => 'home#ok'

  get 'home/no/:check_id' => 'home#no'
  post 'home/create'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
