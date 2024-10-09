# frozen_string_literal: true

require_relative 'constants'
require_relative 'task_list'
# require_relative file manager

puts(Constants::AUTHOR)

file_path = Constants::DEFAULT_FILE_INPUT_PATH
file_path = ARGV[0] unless ARGV.empty?

tasks_list # file input file_path

sum_priority, result_task_list = tasks_list.generate_task_list

# (sum_priority, result_task_list) output in file Constants::DEFAULT_FILE_OUTPUT_PATH if success puts(Constants::RESULT)
