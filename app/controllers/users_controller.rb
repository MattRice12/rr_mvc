require_relative '../models/user'

class UsersController < ApplicationController
  def index
    if first_let #selects names starting with first letter of first name
      users = User.all.select { |name| name.first_name[0].downcase == first_let }
      render users.to_json, status: "200 OK"
    elsif limit # selects range of limit and offset
      render User.all[range].to_json, status: "200 OK"
    else
      render User.all.to_json, status: "200 OK"
    end
  end

  def show
    if id.to_i - 1 > User.all.count #404 error if users requested > user.count
      render "404 PAGE NOT FOUND".to_json, status: "404 NOT FOUND"

    elsif id # selects user at position stated in :id
      render User.all[id.to_i - 1].to_json, status: "200 OK"
    end
  end
end
