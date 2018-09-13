module Errors
  class AuthError < ApplicationError
    def initialize(code)
      super(:auth, code)
    end
  end
end
