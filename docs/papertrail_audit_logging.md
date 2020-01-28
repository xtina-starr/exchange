# Papertrail Audit Logging

As Exchange persists important financial information, we use the [PaperTrail gem](https://github.com/paper-trail-gem/paper_trail) to maintain a log of data changes to important models within the main relational database.

Exchange implements a slightly-customized, but supported, installation of PaperTrail. By default, PaperTrail writes audit log records to a single `versions` table. In Exchange, we write audit logs into model-namespaced tables. For example, the audit log for `Order` records are in the `order_versions` table and the audit log for `Offer` records are in the `offer_versions` table.

Why do we do this? It'll allow PostgreSQL to query across smaller sets of data when operating against the audit log for a particular model.

How to implement this pattern for future models:

1. Include the versioned model shared example in the spec for your model:

  ```ruby
    # spec/models/foo_spec.rb
    describe Foo, type: :model do
      ...
      it_behaves_like 'a papertrail versioned model', :foo
      ...
    end
  ```

2. Ensure that a Fabricator factory exists for your model:

  ```ruby
    # spec/fabricators/foo_fabricator.rb
    Fabricator(:foo) do
      # define enough attributes to have a `valid?` instance of `Foo`
    end
  ```

3. Include the customized PaperTrail DSL in your model (provides #versions):

  ```ruby
    # app/models/foo.rb
    class Foo < ApplicationRecord
      has_paper_trail versions: { class_name: 'PaperTrail::FooVersion' }
      ...
    end
  ```
4. Define the model-specific version class:

  ```ruby
    # app/models/paper_trail/foo_version.rb
    module PaperTrail
      class FooVersion < PaperTrail::Version
        self.table_name = :foo_versions
      end
    end
  ```

5. Create the model-specific versions table:

  ```sh
    bundle exec rails generate migration add_foo_versions
  ```

  ```ruby
    # db/migrate/timestamp_add_foo_versions.rb
    class AddFooVersions < ActiveRecord::Migration[5.2]
      def change
        create_table :foo_versions do |t|
          t.string   :item_type, null: false
          t.uuid     :item_id,   null: false
          t.string   :event,     null: false
          t.string   :whodunnit
          t.jsonb    :object
          t.jsonb    :object_changes
          t.datetime :created_at
        end

        add_index :foo_versions, %i[item_type item_id]
      end
    end
  ```

**N.B: If the model being versioned uses a different type of primary key (i.e. integer instead of UUID), feel free to change the `t.uuid` to `t.#{another_type}`**

#### References

- Exchange PR with initial implementation: https://github.com/artsy/exchange/pull/314
- PaperTrail docs on Custom Version Classes: https://github.com/paper-trail-gem/paper_trail/tree/091612fb565c5fa71aee828fa575cc4e4c180f28#6a-custom-version-classes
