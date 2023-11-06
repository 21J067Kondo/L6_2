class AmazonController < ApplicationController
    def index
        @products=Product.all
        if session[:cart_id]==nil
            c=Cart.new
            c.save
            session[:cart_id]=c.id
        end
    end
    
    def delete
        Product.find(params[:pid]).destroy
        redirect_to '/'
    end
    
    def regist
        Product.new(name: params[:name],price: params[:price]).save
        redirect_to '/'
    end
    
    def cartin
        if params[:count].to_i!=0 
        for f in 1..params[:count].to_i do
            a=Cart.new(pid: params[:pid].to_i)
            
        end
        end
    end
    
    def cart
        cart=Cart.where(id: session[:cart_id])
        ps=Product.all
        ps.each do |p|
            puts p.id
        end
    end
    
end
