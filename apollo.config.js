// @ts-check

/**
 * @type {import("apollo-language-server/lib/config").ApolloConfigFormat}
 */
const config = {
  client: {
    service: {
      name: "local",
      localSchemaFile: "./_schema.graphql"
    },
    validationRules: rule => rule.name !== "NoAnonymousQueries",
    includes: ["{spec,app}/**/*.{rb,graphql}"],
    tagName: "GRAPHQL"
  }
};

module.exports = config;
