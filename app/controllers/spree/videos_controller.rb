module Spree
  class VideosController < BaseController
    respond_to :html
    
    def index
      @videos = Video.all(:joins => :product, :conditions => 'spree_products.deleted_at is NULL')
    end

    def product_index
      @product = Product.friendly.find(params[:product_id])
      @videos = @product.videos.all(:order => 'position')
    end

    def show
      video = Video.find(params[:id])
      client = YouTubeIt::Client.new
    end

    private
    def video_params
      params.require(:video).permit(:youtube_ref)
    end
  end
end
