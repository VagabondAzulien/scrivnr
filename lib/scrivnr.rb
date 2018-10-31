#!/usr/bin/env ruby

# Require all Ruby files in the scrivnr directory
Dir[File.join(__dir__, 'scrivnr', '*.rb')].each do |file|
  require file
end

require 'thor'

module Scrivnr
  # ArgParser for Scrivnr
  class CLI < Thor
    desc 'add TEXT', "Append TEXT to today's journal file"
    def add(text)
      journal = Journal.new
      journal.append(text)
    end

    desc 'edit', "Edit today's journal file"
    option :text, aliases: :t, desc: 'Text to append before editing file'
    def edit
      journal = Journal.new
      journal.edit(options[:text])
    end

    desc 'retro DATE', 'Generate a retrospective, from DATE until today'
    def retro(date)
      ScrivnrRetro.generate(date)
    end
  end
end

Scrivnr::CLI.start(ARGV)
