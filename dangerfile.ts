import {danger, warn, fail} from "danger"

const addedOrModified = danger.git.modified_files.concat(danger.git.created_files)
const added = danger.git.created_files
const fileInGraphQLFolder = addedOrModified.find(f => f.startsWith("app/graphql"))
if (fileInGraphQLFolder) {
  warn("If you want these changes to be reflected in Metaphysics, you will need to [update the stored schema](https://github.com/artsy/exchange#did-you-change-graphql-schema).")
}

if (danger.git.created_files.includes("schema.graphql")) {
  fail("Please remove the schema from your PR `rm schema.graphql` - it's meant to go to metaphysics.")
}

if (danger.git.created_files.includes("exchange.graphql")) {
  fail("Please remove the schema from your PR `rm exchange.graphql` - it's meant to go to metaphysics.")
}

const fileInModelsFolder = addedOrModified.find(f => f.startsWith("app/models"))
if (fileInModelsFolder) {
  warn("You have updated models folder please consider [notifying Analytics Team](https://github.com/artsy/exchange#did-you-change-models).")
}

const newFileInModelsFolder = added.find(f => f.startsWith("app/models"))
if (newFileInModelsFolder) {
warn("You have added something to the models folder. Please consider [implementing the PaperTrail pattern](https://github.com/artsy/exchange/blob/master/docs/papertrail_audit_logging.md).")
}
