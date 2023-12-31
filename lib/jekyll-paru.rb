# frozen_string_literal: true

require_relative "jekyll-paru/version"
require 'jekyll'

module Jekyll
	class Converters::Markdown::Paru
		def initialize config
			External.require_with_graceful_fail 'paru/pandoc'
			@config = config

			@paru = ::Paru::Pandoc.new do
				self.class.class_variable_set :@@pandoc_exec, config['paru']&.[]('exec') || self.class.class_variable_get(:@@pandoc_exec)
				@options = config['paru']&.[]('options')&.dup || {}
				@options['from'] ||= 'markdown'
				@options['to'] ||= 'html5'
				@options.each do |key, value|
					default = ::Paru::Pandoc::OPTIONS[key]
					if default.nil?
						@options.delete key
						Jekyll.logger.warn 'Paru:', "Unknown option #{key}, ignoring"
					elsif default.is_a? Array
						@options[key] = [value].flatten
					end
				end
			end
		end

		def convert content
			@paru.convert content
		end
	end
end
