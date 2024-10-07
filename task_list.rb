# frozen_string_literal: true

require_relative 'task'

# Class TaskList
class TaskList
	def initialize(total_resources, task_list = [])
		@_total_resources = total_resources
		@_tasks = task_list
	end

	def add(task)
		@_tasks.push(task)
	end

	def generate_task_list
	end
end
