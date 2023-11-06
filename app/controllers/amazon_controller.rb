class AmazonController < ApplicationController
    def index
        @products=Product.all
        if session[:cart_id]==nil
            c=Cart.all
            puts '-------------'
            if c.maximum(:uid)==nil
                c=0
            else
                c=c.maximum(:uid)+1
            end
            session[:cart_id]=c
        end
    end
    
    def delete
        Product.find(params[:pid]).destroy
        Cart.where(pid: params[:pid]).destroy_all
        
        redirect_to '/'
    end
    
    def regist
        Product.new(name: params[:name],price: params[:price]).save
        redirect_to '/'
    end
    
    def cartin
        if params[:count].to_i!=0 
        for f in 1..params[:count].to_i do
            a=Cart.new(uid: session[:cart_id],pid: params[:pid].to_i)
            a.save
        end
        end
        redirect_to '/'
    end
    
    def cart
        @products=Product.all
    end
   
   def cdel
       cart=Cart.where(uid: session[:cart_id])
       cart.where(pid: params[:pid]).destroy_all
       redirect_to '/'
   end
end
