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

    elsif params[:limit]
      render User.all[(limit.to_i..(limit.to_i + offset.to_i))].to_json, status: "200 OK"

    end
  end
end


# Given this request http://localhost:3001/users?limit=10&offset=10 I should see ONLY 10 users with id of greater than 10 (There must be 20 users in your db minimum)


# elsif response[:params][:limit] #selects everyone but after users stated by :limit
#   after_ten = response[:params][:limit].to_i
#     users[after_ten..-1].select.with_index do |user, index|
#       puts "#{index + after_ten + 1} - #{user.first_name} #{user.last_name}, age: #{user.age}"
#     end
