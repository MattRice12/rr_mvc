class ApplicationController
  # This default ApplicationController is here to give you some helper methods
  # This means if your controller inherits from ApplicationController (which they should)
  # You will always have access to the request and params methods
  def initialize(request)
    @request = request
  end

  def request
    @request
  end

  def params
    @request[:params]
  end

  def id
    params[:id]
  end

  def limit
    params[:limit]
  end

  def offset
    params[:offset]
  end

  def range
    [limit..(limit + range)]
  end


# http://localhost:3001
# http://localhost:3001/users
# http://localhost:3001/users/1

# http://localhost:3001/users?limit=10&offset=10

  def render(body, opts = {})
    {
      body: body,
      status: opts.fetch(:status, "200 OK"),
      as: opts.fetch(:as, "application/json")
    }
  end
end
