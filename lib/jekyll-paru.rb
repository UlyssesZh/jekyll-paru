# frozen_string_literal: true

require_relative "jekyll-paru/version"
require 'jekyll'

module Jekyll
	class Converters::Markdown::Paru
		def initialize config
			External.require_with_graceful_fail 'paru/pandoc'
			@config = config

			@paru = ::Paru::Pandoc.new do
				@@pandoc_exec = config['paru']&.[]('exec') || @@pandoc_exec
				@options = config['paru']&.[]('options')&.dup || {}
				from 'markdown'
				to 'html5'
				@options.each do |key, value|
					default = ::Paru::Pandoc::OPTIONS[key]
					if default.nil?
						@options.delete key
					elsif default.is_a? Array
						@options[key] = default + [value].flatten
					end
				end
			end
		end

		def convert content
			@paru.convert content
		end
	end
end
