class Admin::TagsController < Admin::ApplicationController
  def new
    @tag = Tag.new
    @tags = Tag.all.order(id: :desc)
  end

  def create
    tags_params[:name].split(',').map do |name|
      Tag.new(name: name).save
    end
    redirect_to new_admin_tag_url, notice: 'Tag was succefully created'
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update tags_params
      redirect_to new_admin_tag_url, notice: 'Tag was succefully updated'
    else
      flash[:alert] = 'There was a problem updating tag'
      render :edit
    end
  end

  def show
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to new_admin_tag_url, notice: 'Tag was succefully deleted'
  end

  def tags_params
    params.require(:tag).permit(:id, :name)
  end
end
