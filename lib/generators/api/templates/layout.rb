module Api
  module V1
  	class <%= name.capitalize %>Controller < ApplicationController


  		respond_to :json


  		# GET
  		# =================================================
  		# =================================================
  		def index

  			@<%= name %>s = <%= name.capitalize %>.all

  			respond_with <%= name %>s: @<%= name %>s

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			@<%= name %> = <%= name.capitalize %>.find params[:id]

  			respond_with @<%= name %>

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

  			@<%= name %> = <%= name.capitalize %>.find params[:id]

			if @<%= name %>.update_attributes(params[:<%= name %>])

				render json: {<%= name %>: @<%= name %>},status: 200

			else

				render json: {error: true,errors: @<%= name %>.errors},status: unprocessable_entity

			end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@<%= name %> = <%= name.capitalize %>.new params[:<%= name %>]

  			if @<%= name %>.save

  				render json: {<%= name %>: @<%= name %>},status: 201

  			else

  				render json: {error: true,errors: @<%= name %>.errors},status: unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destory

  			@<%= name %> = <%= name.capitalize %>.find params[:id]

			if @<%= name %>.destroy

				render json: {<%= name %>: {id: params[:id].to_i}},status: 200

			else

				render json: {error: true,errors: @<%= name %>.errors},status: unprocessable_entity

			end

  		end
  		# =================================================
  		# =================================================

  	end
  end
end