require 'date'
require 'erb'
require 'time'

module Scrivnr
  # Handles the Journal file
  class Journal
    # [String] the path to today's journal file
    attr_reader :today_file
    # [String] the path to the journal template
    attr_reader :template_file

    def initialize
      @today = Date.today.strftime('%F')
      @today_file = "#{@today}-journal.md"
      @template_file = './template.erb'
    end

    # Create a new journal file for today
    def create
      File.open(@today_file.to_s, 'w+') do |file|
        file.write(template)
      end
    end

    # Append provided text to today's journal file
    #
    # @param text [String] The text to append to today's journal file.
    def append(text)
      create unless exists?
      text = "\n#{Time.now} -- #{text}"
      Ledger.log.info('Scrivnr') { "Appending today's journal" }
      File.open(@today_file, 'a+') { |file| file.write(text) }
    end

    # Edit opens today's journal file for editing
    #
    # @param text [String] (Optional) Text to append before editing the file
    def edit(text = '')
      append(text) if text
      Ledger.log.info('Scrivnr') { "Opening today's journal file for editing" }
    end

    # Check if a journal file exists already for today
    def exists?
      File.file?(@today_file)
    end

    # Generate the template
    def template
      ERB.new(File.read('./scrivnr/template.erb')).result(binding)
    end
  end
end
