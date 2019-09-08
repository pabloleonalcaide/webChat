Rails.application.routes.draw do
  scope module: :users do
    post 'user', controller: :user_post_real, action: :create
    post 'user_test', controller: :user_post_test, action: :create
  end
  scope module: :rooms do
    get 'rooms', controller: :rooms_get_real, action: :list
    get 'rooms_test', controller: :rooms_get_test, action: :list
  end
end

