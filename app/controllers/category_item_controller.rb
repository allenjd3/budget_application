class CategoryItemController < ApplicationController
  before_action :authenticate_user!
    def index
        @categories = Category.includes(:items)
    end
end
