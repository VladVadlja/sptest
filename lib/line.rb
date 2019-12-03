class Line

  attr_reader :path, :ip

  def initialize(path:, ip:)
    @path = path
    @ip = ip
  end

	def valid? 
		!!@path && !!@ip
	end

	def ==(other)
		self.path == other.path &&
		self.ip == other.ip
	end

	alias eql? ==

	def hash
		[self.path, self.ip].hash
	end

end
