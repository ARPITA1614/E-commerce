class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!
  # before_action :authenticate_super_admin!
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  def authenticate_super_admin!
    # byebug
    unless current_user&.super_admin?
      redirect_to root_path, notice: "Access denied. Only Super Admins are allowed."
    end
  end

  def after_sign_in_path_for(resource)
    if resource.super_admin?
      admin_root_path
    else
      root_path
    end
  end

  def authenticate_user
    # byebug
    super
    if request.path.start_with?("/admin") && !current_user.super_admin?
      redirect_to root_path, alert: "Not authorize as Super Admin"
    end
  end
end
