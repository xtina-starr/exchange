module PaperTrail
  class OrderVersion < PaperTrail::Version
    self.table_name = :order_versions
  end
end
