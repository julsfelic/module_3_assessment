module Api
  module V1
    module Items
      class ItemsController < ApiController
        def index
          respond_with Item.all
        end

        def show
          respond_with Item.find(params[:id])
        end

        def destroy
          respond_with Item.find(params[:id]).destroy
        end
      end
    end
  end
end
