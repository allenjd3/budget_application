class CategoryItemController < ApplicationController
  before_action :authenticate_user!
    def index
        @transaction_spent = Transaction.where(user_id: current_user.id).sum(:spent_cents)
        @items = Item.where(user_id: current_user.id).all
        @transactions = Transaction.where(user_id: current_user.id).where(:spent_date => Date.today.beginning_of_month..Date.today.end_of_month ).order(id: :desc).limit(5)

        @categories = Category.where(user_id: current_user.id).includes(:items)
    end

    def month

      @month = Month.where(user_id: current_user.id, month: params[:month], year: params[:year]).take
      @transactions = @month.transactions.order(id: :desc).limit(5)
      @transaction_spent = @month.transactions.sum(:spent_cents)
      @items = @month.items
      @categories = @month.categories.includes(items: :transactions)

    end

    def cp
      @user = current_user
      @month = @user.months.order(id: :desc).first
      if(@month)
        redirect_to "/month/" + @month.month + "/year/" + @month.year.to_s
      else
        redirect_to new_month_url 
      end

    end

    def search
      @user = current_user
      @month = @user.months.where(month: params[:month], year: params[:year]).first
      if(@month)
        redirect_to "/month/" + @month.month + "/year/" + @month.year.to_s
      else
        redirect_to new_month_url
      end
    end
end
