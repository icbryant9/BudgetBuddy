class SocialsController < ApplicationController 
    before_action :authenticate_user!

    before_action :set_post, only: [:show, :edit, :update, :destroy]


    def index
      # this needs to be changed to show the users followers
      @posts = Post.all
      end



    private 
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:attachment, :content)
    end


end
