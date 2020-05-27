class Api::Gmail::ListUserLabels < Api::Gmail::Connexion
  def call
    @gmail.list_user_labels @user.uid
  end
end
