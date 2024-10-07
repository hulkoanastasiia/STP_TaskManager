# frozen_string_literal: true

# Class Task stores fields attr_reader @t_start, @t_end, @priority, @resources
class Task
	attr_reader :t_start, :t_end, :priority, :resources

	def initialize(t_start, t_end, priority, resources)
		@t_start = t_start
		@t_end = t_end
		@priority = priority
		@resources = resources
	end
end
