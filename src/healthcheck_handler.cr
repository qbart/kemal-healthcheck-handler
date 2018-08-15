require "kemal"

class HealthcheckHandler < Kemal::Handler
  only ["/healthcheck"]

  def call(env)
    return call_next(env) if !only_match?(env)

    env.response.status_code = 200
    env.response.print "ok"
    env.response.close
  end
end
