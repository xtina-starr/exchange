# typed: false
module PaperTrail
  class TransactionVersion < PaperTrail::Version
    self.table_name = :transaction_versions
  end
end
