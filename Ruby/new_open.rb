class File
	class << self
  		alias :old_open :open
  	end
	def self.open(file, mode)
		super unless ['yield', 'self.old_open', 'self.new', 'block_given?']
		unless mode.to_s=='p'
			self.old_open(file,mode)
		end
		if block_given?
			yield self.old_open(file+'_temp', 'w')
			self.old_open(file, :r) do |old|
				self.open(file+'_temp', :w) do |new|
					self.new.write(old)
				end
			end
		else
			self.new(file)
		end
	end
end