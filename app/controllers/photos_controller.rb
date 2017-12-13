class PhotosController < ApplicationController

  def destroy
    @photo = Photo.find(params[:id])
    product = @photo.product
    @photo.destroy
    @photos = Photo.where(product_id: product.id)
    respond_to :js
  end

end
