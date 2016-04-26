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

        def create
          respond_with Item.create!(item_params)
        end

        def destroy
          respond_with Item.find(params[:id]).destroy
        end

        private

          def item_params
            params.permit(:name, :description, :image_url)
          end
      end
    end
  end
end
