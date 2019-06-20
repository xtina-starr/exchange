# typed: false
module PaperTrail
  # rubocop:disable Rails/ApplicationRecord
  class Version < ActiveRecord::Base
    include PaperTrail::VersionConcern

    self.abstract_class = true
  end
  # rubocop:enable Rails/ApplicationRecord
end
