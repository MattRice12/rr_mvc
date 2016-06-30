require_relative '../models/user'

class UsersController < ApplicationController
  def index
    render User.all.to_json, status: "200 OK"
  end

  def show
    if id.to_i - 1 > User.all.count #404 error if users requested > user.count
      render "404 PAGE NOT FOUND".to_json, status: "404 NOT FOUND"

    elsif id # selects user at position stated in :id
      render User.all[id.to_i - 1].to_json, status: "200 OK"

    elsif limit
      render User.all[range].to_json, status: "200 OK"

    elsif first_name
      User.all.each do |user|
        if user[:first_name] == "Samwise"
          render user.to_json, status: "200 OK"
        end
      end
    end
  end
end


# Given this request http://localhost:3001/users?first_name=s I should see ALL users from where first_name starts with s.
