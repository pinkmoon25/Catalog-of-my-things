class Provider
  class << self
    def list
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def create
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def all
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
