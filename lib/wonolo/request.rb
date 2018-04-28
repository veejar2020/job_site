# requests for wonolo api
class Request
  class << self
    def where(resource_path, query = {})
      response, status = get_json(resource_path, query)
      status == 200 ? response : errors(response)
    end

    def get(id)
      response = get_json(id)
      response.status == 200 ? values(response) : errors(response)
    end

    def values(response)
      JSON.parse(response.body).values[0]
    end

    def errors(response)
      { errors: { status: response.status, message: response.body } }
    end

    def get_json(root_path, query = {})
      query_string = query.map { |k, v| "#{k}=#{v}" }.join('&')
      path = query.empty? ? root_path : "#{root_path}?#{query_string}"
      connection.api.get(path)
    end

    def connection
      @connection ||= Connection.new
    end
  end
end
