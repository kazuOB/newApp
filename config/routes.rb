Rails.application.routes.draw do
  get 'test1/index'

  get 'page/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources:posts do
    resources:comments
  end
  
  resources:pages
  resources:results
  resources:test2s
  
  # いらないけどトップページを新しく作るの面倒だからこのルーティングは残しておく
  root 'test2s#index'
  
end
