import {danger, warn} from "danger"

const addedOrModified = danger.git.modified_files.concat(danger.git.created_files)
const fileInGraphQLFolder = addedOrModified.find(f => f.startsWith("app/graphql"))
if (fileInGraphQLFolder) {
  warn("If you want these changes to be reflected in Metaphysics, you will need to [update the stored schema](https://github.com/artsy/exchange#did-you-change-graphql-schema?).")
}
