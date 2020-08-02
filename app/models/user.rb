class User
  def create
    User.create!(email: params[:email])
  end
end
