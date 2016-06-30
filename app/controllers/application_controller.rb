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

  def first_let
    params[:first_name]
  end

  def limit
    params[:limit]
  end

  def offset
    params[:offset]
  end

  def range
    (limit.to_i..(limit.to_i + offset.to_i))
  end

  def render(body, opts = {})
    {
      body: body,
      status: opts.fetch(:status, "200 OK"),
      as: opts.fetch(:as, "application/json")
    }
  end
end
