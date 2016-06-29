require_relative '../models/user'

class UsersController < ApplicationController
  def index
    render User.all.to_json, status: "200 OK"
  end

  def show

    if params[:id]
      render User.all[params[:id].to_i - 1].to_json, status: "200 OK"
    end
  end
end
