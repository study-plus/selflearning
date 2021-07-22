class ChecksController < ApplicationController

    def create
        check = current_user.checks.create(post_id: params[:post_id])
        redirect_back(fallback_location: posts_path)
    end
end
