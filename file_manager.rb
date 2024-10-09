# frozen_string_literal: true

require 'csv'

# An abstract class for managing file tasks
class FileManager
	@file_path = file_path
	@output_file_path = output_file_path
	@total_resources = 0
	@data_rows = []

	def initialize
		raise NotImplementedError, 'Abstract class cannot be instantiated'
	end

	def update_tasks_from_file
		unless File.exist?(@file_path)
			puts Constants::FILE_NOT_FOUND
			return
		end

		unless File.readable?(@file_path)
			puts Constants::FILE_NOT_READABLE
			return
		end

		unless File.broken?(@file_path)
			puts Constants::FILE_BROKEN
			return
		end

		File.open(@file_path, 'r') do |file|
			puts 'файл відкрито'
			first_line = file.readline
			@total_resources = first_line.split(':')[1].to_i

			file.readline

			CSV.foreach(@file_path, headers: true, col_sep: ',') do |row|
				@data_rows << {
					start: row['start'].to_i,
					end: row['end'].to_i,
					priority: row['priority'].to_i,
					resources: row['resorces'].to_i
				}
			end
		end
	end

	def write_tasks_to_file(max_sum_priority, managed_task_list)
		unless File.writable?(File.dirname(@output_file_path))
			puts Constants::FILE_NOT_WRITABLE
			return
		end

		File.open(@output_file_path, 'w') do |file|
			file.puts "max_sum_priority: #{max_sum_priority}"

			file.puts 'start, end, priority, resorces'

			managed_task_list.each do |row|
				file.puts "#{row[:start]}, #{row[:end]}, #{row[:priority]}, #{row[:resources]}"
			end
		end
	end
end
