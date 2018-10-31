module Scrivnr
  # Generate a retrospective from the provided date until now.
  class ScrivnrRetro
    # Generate a retrospective from the provided date until now.
    #
    # @param date [Datetime] The date time reference to start at
    def self.generate(date)
      Ledger.log.info('Scrivnr') do
        "Generate a retrospective from #{date} until now!"
      end
    end
  end
end
