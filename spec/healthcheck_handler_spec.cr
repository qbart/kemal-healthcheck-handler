require "./spec_helper"

describe HealthcheckHandler do
  describe "#call" do
    it "returns 200 ok for /healthcheck" do
      handler = HealthcheckHandler.new
      env = HTTP::Server::Context.new(
        HTTP::Request.new("GET", "/healthcheck"),
        resp = HTTP::Server::Response.new(io = IO::Memory.new)
      )
      handler.call(env)

      resp.status_code.should eq 200
      io.to_s.should eq "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nok"
    end

    it "returns 404 for /" do
      handler = HealthcheckHandler.new
      env = HTTP::Server::Context.new(
        HTTP::Request.new("GET", "/"),
        resp = HTTP::Server::Response.new(IO::Memory.new)
      )
      handler.call(env)

      resp.status_code.should eq 404
    end
  end
end
