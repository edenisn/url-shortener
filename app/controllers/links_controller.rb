class LinksController < ApplicationController
  before_action :find_link, only: [:show, :stats]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link      = Link.new(link_params)
    @link.slug = Shortener.new(@link.url).call

    if @link.save
      redirect_to links_path
    else
      flash[:error] = @link.errors.full_messages
      redirect_to new_link_path
    end
  end

  def show
    if @link.present?
      Link.increment_counter(:clicked, @link.id)
    else
      render file: "#{Rails.root}/public/404", layout: false, status: 404
    end
  end

  def stats
    if @link.nil?
      render file: "#{Rails.root}/public/404", layout: false, status: 404
    end
  end

  private

  def find_link
    @link = Link.find_by_slug(params[:short_url])
  end

  def link_params
    params.require(:link).permit(:url, :slug)
  end
end
