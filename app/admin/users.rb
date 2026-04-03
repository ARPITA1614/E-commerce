ActiveAdmin.register User do
  # remove_filter :reset_password_token
  # remove_filter :sign_in_count
  config.filters = false 
  # after_create :send_mail
  member_action :soft_delete, method: :put do
    resource.update(isdeleted: true)
    # byebug
    resource.update(active: false)
    redirect_to admin_users_path, notice: "User soft deleted"
  end  
  form do |f|
    f.inputs "User Details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: ['user', 'admin']
      f.input :active
      f.input :description
      f.input :isdeleted
    end
    f.actions
  end

  # controller do
  #   def after_create(user)
  #     #byebug
  #     UserMailer.send_welcome_emailwelcome_email(user).deliver_now
  #   end
  # end
  permit_params :email, :username, :password, :password_confirmation, 
                :role, :active, :isdeleted, :description
end
