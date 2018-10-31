require 'logger'

module Scrivnr
  # Namespace Logging
  module Ledger
    def self.log
      @log ||= Logger.new(
        STDOUT,
        level: Logger::DEBUG,
        datetime_format: '%Y-%m-%d %H:%M:%S '
      )
    end

    # Disable logging (set to highest level)
    def self.disable
      log.debug('Ledger') { 'Disabling logging.' }
      @log.level = Logger::UNKNOWN
    end
  end
end
