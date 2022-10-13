class Provider
  class << self
    def create
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def all
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
