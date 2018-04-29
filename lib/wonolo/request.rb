# requests for wonolo api
class Request
  class << self
    def get(path, query = {})
      response = get_json(path, query)
      response.status == 200 ? values(response) : errors(response)
    end

    def values(response)
      JSON.parse(response.body)
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
