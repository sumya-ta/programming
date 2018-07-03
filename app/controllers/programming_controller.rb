class ProgrammingController < ApplicationController
    before_action :authenticate_account!, only: [:login_check, :show, :new ,:edit ,:index ,:add ,:find]

    def login_check
        @account = current_account
        @msg = 'you logined at: '+ @account.current_sign_in_at.to_s
    end

   def index
    @programming = Programming.page params[:page]
   end

   def show
    @programming = Programming.find(params[:id])
   end

   def add
     @programming = Programming.new
   end

   def create
    if request.post? then
        ogj = Programming.create(programming_params)
    end
    redirect_to '/programming'
   end
   
   def edit
    @programming = Programming.find(params[:id])
   end

   def update
    obj = Programming.find(params[:id])
    obj.update(programming_params)
    redirect_to '/programming'   
   end

   def delete
    Programming.find(params[:id]).destroy
    redirect_to '/programming'
   end

   def find
    #ViewのFormで取得したパラメータをモデルに渡す
    @programming = Programming.search(params[:search])
   end

    private
    def programming_params
        params.require(:programming).permit(:title, :question, :answer, :url)
    end   
end
