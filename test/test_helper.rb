$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "minitest/autorun"
require "minitest/pride"
require "scrivnr"

# Disable the logger
Scrivnr::Ledger.disable
