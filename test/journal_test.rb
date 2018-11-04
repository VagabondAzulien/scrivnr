require "test_helper"

class JournalTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Scrivnr::VERSION
  end

  def test_that_it_creates_a_file
    jrnl = Scrivnr::Journal.new
    f_name = "#{Date.today.strftime('%F')}-journal.md"
    jrnl.create()
    assert File.file?("./#{f_name}")
  end
end
