require_relative '../models/user'

class UsersController < ApplicationController
  def index
    render User.all.to_json, status: "200 OK"
  end

  def show
    if params[:id].to_i - 1 > User.all.count
      render "404 PAGE NOT FOUND".to_json, status: "404 NOT FOUND"
    elsif params[:id]
      render User.all[params[:id].to_i - 1].to_json, status: "200 OK"
    end
  end
end
