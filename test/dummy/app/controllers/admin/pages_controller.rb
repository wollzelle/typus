class Admin::PagesController < Admin::ResourcesController

  def rebuild_all
    redirect_back(fallback_location: admin_path, notice: "Entries have been rebuilt.")
  end

end
