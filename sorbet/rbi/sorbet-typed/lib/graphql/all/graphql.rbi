# typed: strong
module GraphQL
  # sord omit - no YARD type given for "tracer:", using T.untyped
  sig { params(graphql_string: String, tracer: T.untyped).returns(GraphQL::Language::Nodes::Document) }
  def self.parse(graphql_string, tracer: GraphQL::Tracing::NullTracer); end
  sig { params(filename: String).returns(GraphQL::Language::Nodes::Document) }
  def self.parse_file(filename); end
  # sord omit - no YARD type given for "string", using T.untyped
  # sord omit - no YARD type given for "filename:", using T.untyped
  # sord omit - no YARD type given for "tracer:", using T.untyped
  sig { params(string: T.untyped, filename: T.untyped, tracer: T.untyped).void }
  def self.parse_with_racc(string, filename: nil, tracer: GraphQL::Tracing::NullTracer); end
  # sord omit - no YARD type given for "graphql_string", using T.untyped
  sig { params(graphql_string: T.untyped).returns(T::Array[GraphQL::Language::Token]) }
  def self.scan(graphql_string); end
  # sord omit - no YARD type given for "graphql_string", using T.untyped
  sig { params(graphql_string: T.untyped).void }
  def self.scan_with_ragel(graphql_string); end
class Error < StandardError
end
module StringDedupBackport
end
module Dig
  # sord omit - no YARD type given for "own_key", using T.untyped
  # sord omit - no YARD type given for "rest_keys", using T.untyped
  sig { params(own_key: T.untyped, rest_keys: T.untyped).returns(Object) }
  def dig(own_key, *rest_keys); end
end
class Field
  extend GraphQL::Define::InstanceDefinable
  sig { returns(T::Boolean) }
  def relay_node_field(); end
  # sord infer - inferred type of parameter "value" as T::Boolean using getter's return type
  sig { params(value: T::Boolean).returns(T::Boolean) }
  def relay_node_field=(value); end
  sig { returns(T::Boolean) }
  def relay_nodes_field(); end
  # sord infer - inferred type of parameter "value" as T::Boolean using getter's return type
  sig { params(value: T::Boolean).returns(T::Boolean) }
  def relay_nodes_field=(value); end
  # sord warn - "<#call(obj, args, ctx)>" does not appear to be a type
  sig { returns(SORD_ERROR_callobjargsctx) }
  def resolve_proc(); end
  # sord warn - "<#call(obj, args, ctx)>" does not appear to be a type
  sig { returns(SORD_ERROR_callobjargsctx) }
  def lazy_resolve_proc(); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { returns(T.nilable(String)) }
  def description(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def description=(value); end
  sig { returns(T.nilable(String)) }
  def deprecation_reason(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def deprecation_reason=(value); end
  sig { returns(T::Hash[String, GraphQL::Argument]) }
  def arguments(); end
  # sord infer - inferred type of parameter "value" as T::Hash[String, GraphQL::Argument] using getter's return type
  sig { params(value: T::Hash[String, GraphQL::Argument]).returns(T::Hash[String, GraphQL::Argument]) }
  def arguments=(value); end
  sig { returns(T.nilable(GraphQL::Relay::Mutation)) }
  def mutation(); end
  # sord infer - inferred type of parameter "value" as T.nilable(GraphQL::Relay::Mutation) using getter's return type
  sig { params(value: T.nilable(GraphQL::Relay::Mutation)).returns(T.nilable(GraphQL::Relay::Mutation)) }
  def mutation=(value); end
  sig { returns(T.any(Numeric, Proc)) }
  def complexity(); end
  # sord infer - inferred type of parameter "value" as T.any(Numeric, Proc) using getter's return type
  sig { params(value: T.any(Numeric, Proc)).returns(T.any(Numeric, Proc)) }
  def complexity=(value); end
  sig { returns(T.nilable(Symbol)) }
  def property(); end
  sig { returns(T.nilable(Object)) }
  def hash_key(); end
  sig { returns(T.any(Object, GraphQL::Function)) }
  def function(); end
  # sord infer - inferred type of parameter "value" as T.any(Object, GraphQL::Function) using getter's return type
  sig { params(value: T.any(Object, GraphQL::Function)).returns(T.any(Object, GraphQL::Function)) }
  def function=(value); end
  sig { void }
  def arguments_class(); end
  sig { params(value: T.untyped).void }
  def arguments_class=(value); end
  sig { params(value: T.untyped).void }
  def connection=(value); end
  sig { params(value: T.untyped).void }
  def introspection=(value); end
  sig { returns(T.nilable(String)) }
  def subscription_scope(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def subscription_scope=(value); end
  sig { returns(T::Boolean) }
  def trace(); end
  # sord infer - inferred type of parameter "value" as T::Boolean using getter's return type
  sig { params(value: T::Boolean).returns(T::Boolean) }
  def trace=(value); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  sig { returns(T::Boolean) }
  def connection?(); end
  sig { returns(T.nilable(Class)) }
  def edge_class(); end
  # sord infer - inferred type of parameter "value" as T.nilable(Class) using getter's return type
  sig { params(value: T.nilable(Class)).returns(T.nilable(Class)) }
  def edge_class=(value); end
  sig { returns(T::Boolean) }
  def edges?(); end
  sig { returns(T.nilable(Integer)) }
  def connection_max_page_size(); end
  # sord infer - inferred type of parameter "value" as T.nilable(Integer) using getter's return type
  sig { params(value: T.nilable(Integer)).returns(T.nilable(Integer)) }
  def connection_max_page_size=(value); end
  sig { returns(Field) }
  def initialize(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  sig { params(object: Object, arguments: Hash, context: GraphQL::Query::Context).void }
  def resolve(object, arguments, context); end
  # sord warn - "<#call(obj, args, ctx)>" does not appear to be a type
  sig { params(new_resolve_proc: T.nilable(SORD_ERROR_callobjargsctx)).void }
  def resolve=(new_resolve_proc); end
  # sord infer - inferred type of parameter "new_return_type" as T.any() using getter's return type
  sig { params(new_return_type: T.any()).void }
  def type=(new_return_type); end
  sig { void }
  def type(); end
  # sord infer - inferred type of parameter "new_name" as String using getter's return type
  sig { params(new_name: String).void }
  def name=(new_name); end
  sig { params(new_property: Symbol).void }
  def property=(new_property); end
  sig { params(new_hash_key: Symbol).void }
  def hash_key=(new_hash_key); end
  sig { void }
  def to_s(); end
  sig { params(obj: Object, args: GraphQL::Query::Arguments, ctx: GraphQL::Query::Context).returns(Object) }
  def lazy_resolve(obj, args, ctx); end
  # sord infer - inferred type of parameter "new_lazy_resolve_proc" as Object using getter's return type
  sig { params(new_lazy_resolve_proc: Object).void }
  def lazy_resolve=(new_lazy_resolve_proc); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).returns(GraphQL::Execution::Lazy) }
  def prepare_lazy(obj, args, ctx); end
  sig { void }
  def build_default_resolver(); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
module DefaultLazyResolve
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def self.call(obj, args, ctx); end
end
module Resolve
  sig { params(field: GraphQL::Field).returns(Proc) }
  def create_proc(field); end
  sig { params(field: GraphQL::Field).returns(Proc) }
  def self.create_proc(field); end
class BuiltInResolve
end
class MethodResolve < GraphQL::Field::Resolve::BuiltInResolve
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(field: T.untyped).returns(MethodResolve) }
  def initialize(field); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
end
class HashKeyResolve < GraphQL::Field::Resolve::BuiltInResolve
  # sord omit - no YARD type given for "hash_key", using T.untyped
  sig { params(hash_key: T.untyped).returns(HashKeyResolve) }
  def initialize(hash_key); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
end
class NameResolve < GraphQL::Field::Resolve::BuiltInResolve
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(field: T.untyped).returns(NameResolve) }
  def initialize(field); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
end
end
end
class Query
  extend GraphQL::Tracing::Traceable
  include Forwardable
  sig { void }
  def schema(); end
  sig { void }
  def context(); end
  sig { void }
  def provided_variables(); end
  sig { void }
  def root_value(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def root_value=(value); end
  sig { returns(T.nilable(String)) }
  def operation_name(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def operation_name=(value); end
  sig { returns(T::Boolean) }
  def validate(); end
  # sord infer - inferred type of parameter "value" as T::Boolean using getter's return type
  sig { params(value: T::Boolean).returns(T::Boolean) }
  def validate=(value); end
  sig { params(value: T.untyped).void }
  def query_string=(value); end
  sig { returns(GraphQL::Language::Nodes::Document) }
  def document(); end
  sig { void }
  def inspect(); end
  sig { returns(T.nilable(String)) }
  def selected_operation_name(); end
  sig { returns(T.nilable(String)) }
  def subscription_topic(); end
  sig { void }
  def tracers(); end
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "document:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "variables:", using T.untyped
  # sord omit - no YARD type given for "validate:", using T.untyped
  # sord omit - no YARD type given for "subscription_topic:", using T.untyped
  # sord omit - no YARD type given for "operation_name:", using T.untyped
  # sord omit - no YARD type given for "root_value:", using T.untyped
  # sord omit - no YARD type given for "max_depth:", using T.untyped
  # sord omit - no YARD type given for "max_complexity:", using T.untyped
  # sord omit - no YARD type given for "except:", using T.untyped
  # sord omit - no YARD type given for "only:", using T.untyped
  sig { params(schema: GraphQL::Schema, query_string: String, query: T.untyped, document: T.untyped, context: T.untyped, variables: T.untyped, validate: T.untyped, subscription_topic: T.untyped, operation_name: T.untyped, root_value: T.untyped, max_depth: T.untyped, max_complexity: T.untyped, except: T.untyped, only: T.untyped).returns(Query) }
  def initialize(schema, query_string = nil, query: nil, document: nil, context: nil, variables: nil, validate: true, subscription_topic: nil, operation_name: nil, root_value: nil, max_depth: nil, max_complexity: nil, except: nil, only: nil); end
  sig { void }
  def query_string(); end
  sig { returns(T::Boolean) }
  def subscription_update?(); end
  sig { returns(GraphQL::Execution::Lookahead) }
  def lookahead(); end
  # sord infer - inferred type of parameter "result_hash" as T.any() using getter's return type
  sig { params(result_hash: T.any()).void }
  def result_values=(result_hash); end
  sig { void }
  def result_values(); end
  sig { void }
  def fragments(); end
  sig { void }
  def operations(); end
  sig { returns(Hash) }
  def result(); end
  sig { void }
  def static_errors(); end
  sig { returns(T.nilable(GraphQL::Language::Nodes::OperationDefinition)) }
  def selected_operation(); end
  sig { returns(GraphQL::Query::Variables) }
  def variables(); end
  sig { void }
  def irep_selection(); end
  # sord omit - no YARD type given for "irep_or_ast_node", using T.untyped
  # sord omit - no YARD type given for "definition", using T.untyped
  sig { params(irep_or_ast_node: T.untyped, definition: T.untyped).returns(GraphQL::Query::Arguments) }
  def arguments_for(irep_or_ast_node, definition); end
  sig { void }
  def validation_pipeline(); end
  sig { void }
  def analysis_errors(); end
  sig { params(value: T.untyped).void }
  def analysis_errors=(value); end
  sig { returns(T::Boolean) }
  def valid?(); end
  sig { void }
  def warden(); end
  sig { params(abstract_type: T.any(GraphQL::UnionType, GraphQL::InterfaceType), value: Object).returns(T.nilable(GraphQL::ObjectType)) }
  def resolve_type(abstract_type, value = :__undefined__); end
  sig { returns(T::Boolean) }
  def mutation?(); end
  sig { returns(T::Boolean) }
  def query?(); end
  # sord omit - no YARD type given for "only:", using T.untyped
  # sord omit - no YARD type given for "except:", using T.untyped
  sig { params(only: T.untyped, except: T.untyped).void }
  def merge_filters(only: nil, except: nil); end
  sig { returns(T::Boolean) }
  def subscription?(); end
  # sord omit - no YARD type given for "operations", using T.untyped
  # sord omit - no YARD type given for "operation_name", using T.untyped
  sig { params(operations: T.untyped, operation_name: T.untyped).void }
  def find_operation(operations, operation_name); end
  sig { void }
  def prepare_ast(); end
  sig { void }
  def with_prepared_ast(); end
  sig { params(key: String, metadata: Hash).returns(Object) }
  def trace(key, metadata); end
  sig { params(idx: Integer, key: String, metadata: Object).returns(T.untyped) }
  def call_tracers(idx, key, metadata); end
class OperationNameMissingError < GraphQL::ExecutionError
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(name: T.untyped).returns(OperationNameMissingError) }
  def initialize(name); end
  sig { returns(GraphQL::Language::Nodes::Field) }
  def ast_node(); end
  # sord infer - inferred type of parameter "value" as GraphQL::Language::Nodes::Field using getter's return type
  sig { params(value: GraphQL::Language::Nodes::Field).returns(GraphQL::Language::Nodes::Field) }
  def ast_node=(value); end
  sig { returns(String) }
  def path(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def path=(value); end
  sig { returns(Hash) }
  def options(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def options=(value); end
  sig { returns(Hash) }
  def extensions(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def extensions=(value); end
  sig { returns(Hash) }
  def to_h(); end
end
class Result
  include Forwardable
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "values:", using T.untyped
  sig { params(query: T.untyped, values: T.untyped).returns(Result) }
  def initialize(query:, values:); end
  sig { returns(GraphQL::Query) }
  def query(); end
  sig { returns(Hash) }
  def to_h(); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(method_name: T.untyped, args: T.untyped, block: T.untyped).void }
  def method_missing(method_name, *args, &block); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "include_private", using T.untyped
  sig { params(method_name: T.untyped, include_private: T.untyped).returns(T::Boolean) }
  def respond_to_missing?(method_name, include_private = false); end
  sig { void }
  def inspect(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def ==(other); end
end
class Context
  extend GraphQL::Query::Context::SharedMethods
  include Forwardable
  sig { void }
  def execution_strategy(); end
  sig { void }
  def strategy(); end
  # sord infer - inferred type of parameter "new_strategy" as T.any() using getter's return type
  sig { params(new_strategy: T.any()).void }
  def execution_strategy=(new_strategy); end
  sig { returns(GraphQL::InternalRepresentation::Node) }
  def irep_node(); end
  sig { returns(GraphQL::Language::Nodes::Field) }
  def ast_node(); end
  sig { returns(T::Array[GraphQL::ExecutionError]) }
  def errors(); end
  sig { returns(GraphQL::Query) }
  def query(); end
  sig { returns(GraphQL::Schema) }
  def schema(); end
  sig { returns(T::Array[T.any(String, Integer)]) }
  def path(); end
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "values:", using T.untyped
  # sord omit - no YARD type given for "object:", using T.untyped
  sig { params(query: T.untyped, values: T.untyped, object: T.untyped).returns(Context) }
  def initialize(query:, values:, object:); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def interpreter=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def value=(value); end
  # sord omit - no YARD type given for "key", using T.untyped
  sig { params(key: T.untyped).void }
  def [](key); end
  # sord infer - inferred type of parameter "key" as T.any() using getter's return type
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(key: T.any(), value: T.any()).void }
  def []=(key, value); end
  sig { returns(GraphQL::Schema::Warden) }
  def warden(); end
  sig { params(ns: Object).returns(Hash) }
  def namespace(ns); end
  sig { void }
  def inspect(); end
  sig { void }
  def received_null_child(); end
  sig { returns(Object) }
  def object(); end
  # sord infer - inferred type of parameter "value" as Object using getter's return type
  sig { params(value: Object).returns(Object) }
  def object=(value); end
  sig { returns(T.nilable(T.any(Hash, Array, String, Integer, Float, T::Boolean))) }
  def value(); end
  sig { returns(T::Boolean) }
  def skipped(); end
  sig { returns(T::Boolean) }
  def skipped?(); end
  # sord infer - inferred type of parameter "value" as T::Boolean using getter's return type
  sig { params(value: T::Boolean).void }
  def skipped=(value); end
  sig { void }
  def skip(); end
  sig { returns(T::Boolean) }
  def invalid_null?(); end
  # sord omit - no YARD type given for "child_ctx", using T.untyped
  sig { params(child_ctx: T.untyped).void }
  def delete(child_ctx); end
  # sord omit - no YARD type given for "key:", using T.untyped
  # sord omit - no YARD type given for "irep_node:", using T.untyped
  # sord omit - no YARD type given for "object:", using T.untyped
  sig { params(key: T.untyped, irep_node: T.untyped, object: T.untyped).void }
  def spawn_child(key:, irep_node:, object:); end
  sig { params(error: GraphQL::ExecutionError).void }
  def add_error(error); end
  sig { returns(GraphQL::Backtrace) }
  def backtrace(); end
  sig { void }
  def execution_errors(); end
  sig { void }
  def lookahead(); end
module SharedMethods
  sig { returns(Object) }
  def object(); end
  # sord infer - inferred type of parameter "value" as Object using getter's return type
  sig { params(value: Object).returns(Object) }
  def object=(value); end
  sig { returns(T.nilable(T.any(Hash, Array, String, Integer, Float, T::Boolean))) }
  def value(); end
  sig { returns(T::Boolean) }
  def skipped(); end
  sig { returns(T::Boolean) }
  def skipped?(); end
  # sord infer - inferred type of parameter "value" as T::Boolean using getter's return type
  sig { params(value: T::Boolean).void }
  def skipped=(value); end
  sig { void }
  def skip(); end
  sig { returns(T::Boolean) }
  def invalid_null?(); end
  # sord omit - no YARD type given for "child_ctx", using T.untyped
  sig { params(child_ctx: T.untyped).void }
  def delete(child_ctx); end
  # sord omit - no YARD type given for "key:", using T.untyped
  # sord omit - no YARD type given for "irep_node:", using T.untyped
  # sord omit - no YARD type given for "object:", using T.untyped
  sig { params(key: T.untyped, irep_node: T.untyped, object: T.untyped).void }
  def spawn_child(key:, irep_node:, object:); end
  sig { params(error: GraphQL::ExecutionError).void }
  def add_error(error); end
  sig { returns(GraphQL::Backtrace) }
  def backtrace(); end
  sig { void }
  def execution_errors(); end
  sig { void }
  def lookahead(); end
end
class ExecutionErrors
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(ctx: T.untyped).returns(ExecutionErrors) }
  def initialize(ctx); end
  # sord omit - no YARD type given for "err_or_msg", using T.untyped
  sig { params(err_or_msg: T.untyped).void }
  def add(err_or_msg); end
  sig { void }
  def >>(); end
  sig { void }
  def push(); end
end
class FieldResolutionContext
  extend GraphQL::Tracing::Traceable
  extend GraphQL::Query::Context::SharedMethods
  include Forwardable
  sig { void }
  def irep_node(); end
  sig { void }
  def field(); end
  sig { void }
  def parent_type(); end
  sig { void }
  def query(); end
  sig { void }
  def schema(); end
  sig { void }
  def parent(); end
  sig { void }
  def key(); end
  sig { void }
  def type(); end
  sig { void }
  def selection(); end
  # sord omit - no YARD type given for "context", using T.untyped
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "object", using T.untyped
  sig { params(context: T.untyped, key: T.untyped, irep_node: T.untyped, parent: T.untyped, object: T.untyped).returns(FieldResolutionContext) }
  def initialize(context, key, irep_node, parent, object); end
  sig { void }
  def wrapped_connection(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def wrapped_connection=(value); end
  sig { void }
  def wrapped_object(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def wrapped_object=(value); end
  sig { void }
  def path(); end
  sig { returns(GraphQL::Language::Nodes::Field) }
  def ast_node(); end
  sig { params(error: GraphQL::ExecutionError).void }
  def add_error(error); end
  sig { void }
  def inspect(); end
  sig { params(new_value: Any).void }
  def value=(new_value); end
  sig { void }
  def received_null_child(); end
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(type: T.untyped).returns(T::Boolean) }
  def list_of_non_null_items?(type); end
  sig { params(key: String, metadata: Hash).returns(Object) }
  def trace(key, metadata); end
  sig { params(idx: Integer, key: String, metadata: Object).returns(T.untyped) }
  def call_tracers(idx, key, metadata); end
  sig { returns(Object) }
  def object(); end
  # sord infer - inferred type of parameter "value" as Object using getter's return type
  sig { params(value: Object).returns(Object) }
  def object=(value); end
  sig { returns(T.nilable(T.any(Hash, Array, String, Integer, Float, T::Boolean))) }
  def value(); end
  sig { returns(T::Boolean) }
  def skipped(); end
  sig { returns(T::Boolean) }
  def skipped?(); end
  # sord infer - inferred type of parameter "value" as T::Boolean using getter's return type
  sig { params(value: T::Boolean).void }
  def skipped=(value); end
  sig { void }
  def skip(); end
  sig { returns(T::Boolean) }
  def invalid_null?(); end
  # sord omit - no YARD type given for "child_ctx", using T.untyped
  sig { params(child_ctx: T.untyped).void }
  def delete(child_ctx); end
  # sord omit - no YARD type given for "key:", using T.untyped
  # sord omit - no YARD type given for "irep_node:", using T.untyped
  # sord omit - no YARD type given for "object:", using T.untyped
  sig { params(key: T.untyped, irep_node: T.untyped, object: T.untyped).void }
  def spawn_child(key:, irep_node:, object:); end
  sig { returns(GraphQL::Backtrace) }
  def backtrace(); end
  sig { void }
  def execution_errors(); end
  sig { void }
  def lookahead(); end
end
end
class Executor
  sig { returns(GraphQL::Query) }
  def query(); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).returns(Executor) }
  def initialize(query); end
  sig { returns(Hash) }
  def result(); end
  sig { void }
  def execute(); end
class PropagateNull < StandardError
end
end
class Arguments
  extend GraphQL::Dig
  include Forwardable
  # sord omit - no YARD type given for "argument_owner", using T.untyped
  sig { params(argument_owner: T.untyped).void }
  def self.construct_arguments_class(argument_owner); end
  sig { void }
  def argument_values(); end
  # sord omit - no YARD type given for "values", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "defaults_used:", using T.untyped
  sig { params(values: T.untyped, context: T.untyped, defaults_used: T.untyped).returns(Arguments) }
  def initialize(values, context:, defaults_used:); end
  sig { params(key: T.any(String, Symbol)).returns(Object) }
  def [](key); end
  sig { params(key: T.any(String, Symbol)).returns(T::Boolean) }
  def key?(key); end
  sig { params(key: T.any(String, Symbol)).returns(T::Boolean) }
  def default_used?(key); end
  sig { returns(Hash) }
  def to_h(); end
  sig { void }
  def each_value(); end
  sig { void }
  def self.argument_definitions(); end
  sig { params(value: T.untyped).void }
  def self.argument_definitions=(value); end
  # sord warn - "{Symbol=>Object}" does not appear to be a type
  sig { returns(SORD_ERROR_SymbolObject) }
  def to_kwargs(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "arg_defn_type", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(value: T.untyped, arg_defn_type: T.untyped, context: T.untyped).void }
  def wrap_value(value, arg_defn_type, context); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def unwrap_value(value); end
  # sord omit - no YARD type given for "own_key", using T.untyped
  # sord omit - no YARD type given for "rest_keys", using T.untyped
  sig { params(own_key: T.untyped, rest_keys: T.untyped).returns(Object) }
  def dig(own_key, *rest_keys); end
class ArgumentValue
  sig { void }
  def key(); end
  sig { void }
  def value(); end
  sig { void }
  def definition(); end
  sig { params(value: T.untyped).void }
  def default_used=(value); end
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "definition", using T.untyped
  # sord omit - no YARD type given for "default_used", using T.untyped
  sig { params(key: T.untyped, value: T.untyped, definition: T.untyped, default_used: T.untyped).returns(ArgumentValue) }
  def initialize(key, value, definition, default_used); end
  sig { returns(T::Boolean) }
  def default_used?(); end
end
end
class Variables
  include Forwardable
  sig { returns(T::Array[GraphQL::Query::VariableValidationError]) }
  def errors(); end
  sig { void }
  def context(); end
  # sord omit - no YARD type given for "ctx", using T.untyped
  # sord omit - no YARD type given for "ast_variables", using T.untyped
  # sord omit - no YARD type given for "provided_variables", using T.untyped
  sig { params(ctx: T.untyped, ast_variables: T.untyped, provided_variables: T.untyped).returns(Variables) }
  def initialize(ctx, ast_variables, provided_variables); end
end
class NullContext
  include Forwardable
  sig { void }
  def schema(); end
  sig { void }
  def query(); end
  sig { void }
  def warden(); end
  sig { returns(NullContext) }
  def initialize(); end
  sig { void }
  def self.instance(); end
class NullWarden < GraphQL::Schema::Warden
  # sord omit - no YARD type given for "t", using T.untyped
  sig { params(t: T.untyped).returns(T::Boolean) }
  def visible?(t); end
  # sord omit - no YARD type given for "t", using T.untyped
  sig { params(t: T.untyped).returns(T::Boolean) }
  def visible_field?(t); end
  # sord omit - no YARD type given for "t", using T.untyped
  sig { params(t: T.untyped).returns(T::Boolean) }
  def visible_type?(t); end
  # sord warn - "<#call(member)>" does not appear to be a type
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "schema:", using T.untyped
  sig { params(filter: SORD_ERROR_callmember, context: T.untyped, schema: T.untyped).returns(Warden) }
  def initialize(filter, context:, schema:); end
  sig { returns(T::Array[GraphQL::BaseType]) }
  def types(); end
  # sord omit - no YARD type given for "type_name", using T.untyped
  sig { params(type_name: T.untyped).returns(T.nilable(GraphQL::BaseType)) }
  def get_type(type_name); end
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(parent_type: T.untyped, field_name: T.untyped).returns(T.nilable(GraphQL::Field)) }
  def get_field(parent_type, field_name); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Array[GraphQL::BaseType]) }
  def possible_types(type_defn); end
  sig { params(type_defn: T.any(GraphQL::ObjectType, GraphQL::InterfaceType)).returns(T::Array[GraphQL::Field]) }
  def fields(type_defn); end
  sig { params(argument_owner: T.any(GraphQL::Field, GraphQL::InputObjectType)).returns(T::Array[GraphQL::Argument]) }
  def arguments(argument_owner); end
  # sord omit - no YARD type given for "enum_defn", using T.untyped
  sig { params(enum_defn: T.untyped).returns(T::Array[GraphQL::EnumType::EnumValue]) }
  def enum_values(enum_defn); end
  # sord omit - no YARD type given for "obj_type", using T.untyped
  sig { params(obj_type: T.untyped).returns(T::Array[GraphQL::InterfaceType]) }
  def interfaces(obj_type); end
  sig { void }
  def directives(); end
  # sord omit - no YARD type given for "op_name", using T.untyped
  sig { params(op_name: T.untyped).void }
  def root_type_for_operation(op_name); end
  # sord omit - no YARD type given for "obj_type", using T.untyped
  sig { params(obj_type: T.untyped).void }
  def union_memberships(obj_type); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def root_type?(type_defn); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def referenced?(type_defn); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def orphan_type?(type_defn); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def visible_abstract_type?(type_defn); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def visible_possible_types?(type_defn); end
  sig { void }
  def read_through(); end
end
end
class LiteralInput
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "variables", using T.untyped
  sig { params(type: T.untyped, ast_node: T.untyped, variables: T.untyped).void }
  def self.coerce(type, ast_node, variables); end
  # sord omit - no YARD type given for "ast_arguments", using T.untyped
  # sord omit - no YARD type given for "argument_owner", using T.untyped
  # sord omit - no YARD type given for "variables", using T.untyped
  sig { params(ast_arguments: T.untyped, argument_owner: T.untyped, variables: T.untyped).void }
  def self.from_arguments(ast_arguments, argument_owner, variables); end
end
module ArgumentsCache
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).returns(T::Hash[InternalRepresentation::Node, GraphQL::Language::NodesDirectiveNode, T::Hash[GraphQL::Field, GraphQL::Directive, GraphQL::Query::Arguments]]) }
  def self.build(query); end
end
class SerialExecution
  sig { params(ast_operation: GraphQL::Language::Nodes::OperationDefinition, root_type: GraphQL::ObjectType, query_object: GraphQL::Query).returns(Hash) }
  def execute(ast_operation, root_type, query_object); end
  sig { void }
  def field_resolution(); end
  sig { void }
  def operation_resolution(); end
  sig { void }
  def selection_resolution(); end
class FieldResolution
  sig { void }
  def irep_node(); end
  sig { void }
  def parent_type(); end
  sig { void }
  def target(); end
  sig { void }
  def field(); end
  sig { void }
  def arguments(); end
  sig { void }
  def query(); end
  # sord omit - no YARD type given for "selection", using T.untyped
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "target", using T.untyped
  # sord omit - no YARD type given for "query_ctx", using T.untyped
  sig { params(selection: T.untyped, parent_type: T.untyped, target: T.untyped, query_ctx: T.untyped).returns(FieldResolution) }
  def initialize(selection, parent_type, target, query_ctx); end
  sig { void }
  def result(); end
  sig { void }
  def execution_context(); end
  # sord omit - no YARD type given for "raw_value", using T.untyped
  sig { params(raw_value: T.untyped).void }
  def get_finished_value(raw_value); end
  sig { void }
  def get_raw_value(); end
end
module ValueResolution
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "field_defn", using T.untyped
  # sord omit - no YARD type given for "field_type", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "selection", using T.untyped
  # sord omit - no YARD type given for "query_ctx", using T.untyped
  sig { params(parent_type: T.untyped, field_defn: T.untyped, field_type: T.untyped, value: T.untyped, selection: T.untyped, query_ctx: T.untyped).void }
  def self.resolve(parent_type, field_defn, field_type, value, selection, query_ctx); end
end
module OperationResolution
  # sord omit - no YARD type given for "selection", using T.untyped
  # sord omit - no YARD type given for "target", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(selection: T.untyped, target: T.untyped, query: T.untyped).void }
  def self.resolve(selection, target, query); end
end
module SelectionResolution
  # sord omit - no YARD type given for "target", using T.untyped
  # sord omit - no YARD type given for "current_type", using T.untyped
  # sord omit - no YARD type given for "selection", using T.untyped
  # sord omit - no YARD type given for "query_ctx", using T.untyped
  sig { params(target: T.untyped, current_type: T.untyped, selection: T.untyped, query_ctx: T.untyped).void }
  def self.resolve(target, current_type, selection, query_ctx); end
end
end
class ValidationPipeline
  sig { void }
  def max_depth(); end
  sig { void }
  def max_complexity(); end
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "validate:", using T.untyped
  # sord omit - no YARD type given for "parse_error:", using T.untyped
  # sord omit - no YARD type given for "operation_name_error:", using T.untyped
  # sord omit - no YARD type given for "max_depth:", using T.untyped
  # sord omit - no YARD type given for "max_complexity:", using T.untyped
  sig { params(query: T.untyped, validate: T.untyped, parse_error: T.untyped, operation_name_error: T.untyped, max_depth: T.untyped, max_complexity: T.untyped).returns(ValidationPipeline) }
  def initialize(query:, validate:, parse_error:, operation_name_error:, max_depth:, max_complexity:); end
  sig { returns(T::Boolean) }
  def valid?(); end
  sig { returns(T::Array[GraphQL::StaticValidation::Error]) }
  def validation_errors(); end
  # sord warn - "Hash<String, nil => GraphQL::InternalRepresentation::Node] Operation name -" does not appear to be a type
  sig { returns(SORD_ERROR_HashStringnilGraphQLInternalRepresentationNodeOperationname) }
  def internal_representation(); end
  sig { void }
  def analyzers(); end
  sig { void }
  def ensure_has_validated(); end
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "max_depth", using T.untyped
  # sord omit - no YARD type given for "max_complexity", using T.untyped
  sig { params(schema: T.untyped, max_depth: T.untyped, max_complexity: T.untyped).void }
  def build_analyzers(schema, max_depth, max_complexity); end
end
class InputValidationResult
  sig { void }
  def problems(); end
  sig { params(value: T.untyped).void }
  def problems=(value); end
  sig { returns(T::Boolean) }
  def valid?(); end
  # sord omit - no YARD type given for "explanation", using T.untyped
  # sord omit - no YARD type given for "path", using T.untyped
  sig { params(explanation: T.untyped, path: T.untyped).void }
  def add_problem(explanation, path = nil); end
  # sord omit - no YARD type given for "path", using T.untyped
  # sord omit - no YARD type given for "inner_result", using T.untyped
  sig { params(path: T.untyped, inner_result: T.untyped).void }
  def merge_result!(path, inner_result); end
end
class VariableValidationError < GraphQL::ExecutionError
  sig { void }
  def value(); end
  sig { params(value: T.untyped).void }
  def value=(value); end
  sig { void }
  def validation_result(); end
  sig { params(value: T.untyped).void }
  def validation_result=(value); end
  # sord omit - no YARD type given for "variable_ast", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "validation_result", using T.untyped
  sig { params(variable_ast: T.untyped, type: T.untyped, value: T.untyped, validation_result: T.untyped).returns(VariableValidationError) }
  def initialize(variable_ast, type, value, validation_result); end
  sig { void }
  def to_h(); end
  sig { void }
  def problem_fields(); end
  sig { returns(GraphQL::Language::Nodes::Field) }
  def ast_node(); end
  # sord infer - inferred type of parameter "value" as GraphQL::Language::Nodes::Field using getter's return type
  sig { params(value: GraphQL::Language::Nodes::Field).returns(GraphQL::Language::Nodes::Field) }
  def ast_node=(value); end
  sig { returns(String) }
  def path(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def path=(value); end
  sig { returns(Hash) }
  def options(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def options=(value); end
  sig { returns(Hash) }
  def extensions(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def extensions=(value); end
end
end
module Define
  # sord warn - "#call(defn, value)" does not appear to be a type
  sig { params(key: Object).returns(SORD_ERROR_calldefnvalue) }
  def self.assign_metadata_key(key); end
class TypeDefiner
  extend Singleton
  sig { void }
  def Int(); end
  sig { void }
  def String(); end
  sig { void }
  def Float(); end
  sig { void }
  def Boolean(); end
  sig { void }
  def ID(); end
  sig { params(type: Type).returns(GraphQL::ListType) }
  def [](type); end
end
module AssignArgument
  # sord omit - no YARD type given for "target", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(target: T.untyped, args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.call(target, *args, **kwargs, &block); end
end
module AssignConnection
  # sord omit - no YARD type given for "type_defn", using T.untyped
  # sord omit - no YARD type given for "field_args", using T.untyped
  # sord omit - no YARD type given for "max_page_size:", using T.untyped
  # sord omit - no YARD type given for "field_kwargs", using T.untyped
  sig { params(type_defn: T.untyped, field_args: T.untyped, max_page_size: T.untyped, field_kwargs: T.untyped, field_block: T.untyped).void }
  def self.call(type_defn, *field_args, max_page_size: nil, **field_kwargs, &field_block); end
end
module AssignEnumValue
  # sord omit - no YARD type given for "enum_type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "desc", using T.untyped
  # sord omit - no YARD type given for "deprecation_reason:", using T.untyped
  # sord omit - no YARD type given for "value:", using T.untyped
  sig { params(enum_type: T.untyped, name: T.untyped, desc: T.untyped, deprecation_reason: T.untyped, value: T.untyped, block: T.untyped).void }
  def self.call(enum_type, name, desc = nil, deprecation_reason: nil, value: name, &block); end
end
module InstanceDefinable
  # sord omit - no YARD type given for "base", using T.untyped
  sig { params(base: T.untyped).void }
  def self.included(base); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
class Definition
  sig { void }
  def define_keywords(); end
  sig { void }
  def define_proc(); end
  # sord omit - no YARD type given for "define_keywords", using T.untyped
  # sord omit - no YARD type given for "define_proc", using T.untyped
  sig { params(define_keywords: T.untyped, define_proc: T.untyped).returns(Definition) }
  def initialize(define_keywords, define_proc); end
end
module ClassMethods
  sig { params(kwargs: Hash, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "accepts", using T.untyped
  sig { params(accepts: T.untyped).void }
  def accepts_definitions(*accepts); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def ensure_defined(*method_names); end
  sig { void }
  def ensure_defined_method_names(); end
  sig { returns(Hash) }
  def dictionary(); end
  sig { returns(Hash) }
  def own_dictionary(); end
end
class AssignMetadataKey
  # sord omit - no YARD type given for "key", using T.untyped
  sig { params(key: T.untyped).returns(AssignMetadataKey) }
  def initialize(key); end
  # sord omit - no YARD type given for "defn", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(defn: T.untyped, value: T.untyped).void }
  def call(defn, value = true); end
end
class AssignAttribute
  # sord omit - no YARD type given for "attr_name", using T.untyped
  sig { params(attr_name: T.untyped).returns(AssignAttribute) }
  def initialize(attr_name); end
  # sord omit - no YARD type given for "defn", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(defn: T.untyped, value: T.untyped).void }
  def call(defn, value); end
end
end
module NonNullWithBang
  sig { returns(GraphQL::NonNullType) }
  def !(); end
end
module AssignObjectField
  # sord omit - no YARD type given for "owner_type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type_or_field", using T.untyped
  # sord omit - no YARD type given for "desc", using T.untyped
  # sord omit - no YARD type given for "function:", using T.untyped
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "relay_mutation_function:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(owner_type: T.untyped, name: T.untyped, type_or_field: T.untyped, desc: T.untyped, function: T.untyped, field: T.untyped, relay_mutation_function: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.call(owner_type, name, type_or_field = nil, desc = nil, function: nil, field: nil, relay_mutation_function: nil, **kwargs, &block); end
end
class NoDefinitionError < GraphQL::Error
end
class DefinedObjectProxy
  sig { void }
  def target(); end
  # sord omit - no YARD type given for "target", using T.untyped
  sig { params(target: T.untyped).returns(DefinedObjectProxy) }
  def initialize(target); end
  sig { void }
  def types(); end
  # sord warn - "<#use(defn, **kwargs)>" does not appear to be a type
  sig { params(plugin: SORD_ERROR_usedefnkwargs, kwargs: Hash).void }
  def use(plugin, **kwargs); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(name: T.untyped, args: T.untyped, block: T.untyped).void }
  def method_missing(name, *args, &block); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "include_private", using T.untyped
  sig { params(name: T.untyped, include_private: T.untyped).returns(T::Boolean) }
  def respond_to_missing?(name, include_private = false); end
end
module AssignGlobalIdField
  # sord omit - no YARD type given for "type_defn", using T.untyped
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(type_defn: T.untyped, field_name: T.untyped).void }
  def self.call(type_defn, field_name); end
end
module AssignMutationFunction
  # sord omit - no YARD type given for "target", using T.untyped
  # sord omit - no YARD type given for "function", using T.untyped
  sig { params(target: T.untyped, function: T.untyped).void }
  def self.call(target, function); end
class ResultProxy < SimpleDelegator
  sig { void }
  def client_mutation_id(); end
  # sord omit - no YARD type given for "target", using T.untyped
  # sord omit - no YARD type given for "client_mutation_id", using T.untyped
  sig { params(target: T.untyped, client_mutation_id: T.untyped).returns(ResultProxy) }
  def initialize(target, client_mutation_id); end
end
end
end
class Filter
  # sord omit - no YARD type given for "only:", using T.untyped
  # sord omit - no YARD type given for "except:", using T.untyped
  sig { params(only: T.untyped, except: T.untyped).returns(Filter) }
  def initialize(only: nil, except: nil); end
  # sord omit - no YARD type given for "member", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(member: T.untyped, ctx: T.untyped).void }
  def call(member, ctx); end
  # sord omit - no YARD type given for "only:", using T.untyped
  # sord omit - no YARD type given for "except:", using T.untyped
  sig { params(only: T.untyped, except: T.untyped).void }
  def merge(only: nil, except: nil); end
class MergedOnly
  # sord omit - no YARD type given for "first", using T.untyped
  # sord omit - no YARD type given for "second", using T.untyped
  sig { params(first: T.untyped, second: T.untyped).returns(MergedOnly) }
  def initialize(first, second); end
  # sord omit - no YARD type given for "member", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(member: T.untyped, ctx: T.untyped).void }
  def call(member, ctx); end
  # sord omit - no YARD type given for "onlies", using T.untyped
  sig { params(onlies: T.untyped).void }
  def self.build(onlies); end
end
class MergedExcept < GraphQL::Filter::MergedOnly
  # sord omit - no YARD type given for "member", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(member: T.untyped, ctx: T.untyped).void }
  def call(member, ctx); end
  # sord omit - no YARD type given for "first", using T.untyped
  # sord omit - no YARD type given for "second", using T.untyped
  sig { params(first: T.untyped, second: T.untyped).returns(MergedOnly) }
  def initialize(first, second); end
  # sord omit - no YARD type given for "onlies", using T.untyped
  sig { params(onlies: T.untyped).void }
  def self.build(onlies); end
end
end
class Schema
  extend GraphQL::Define::InstanceDefinable
  include GraphQL::Schema::Member::AcceptsDefinition
  include Forwardable
  sig { void }
  def query(); end
  sig { params(value: T.untyped).void }
  def query=(value); end
  sig { void }
  def mutation(); end
  sig { params(value: T.untyped).void }
  def mutation=(value); end
  sig { void }
  def subscription(); end
  sig { params(value: T.untyped).void }
  def subscription=(value); end
  sig { void }
  def query_execution_strategy(); end
  sig { params(value: T.untyped).void }
  def query_execution_strategy=(value); end
  sig { void }
  def mutation_execution_strategy(); end
  sig { params(value: T.untyped).void }
  def mutation_execution_strategy=(value); end
  sig { void }
  def subscription_execution_strategy(); end
  sig { params(value: T.untyped).void }
  def subscription_execution_strategy=(value); end
  sig { void }
  def max_depth(); end
  sig { params(value: T.untyped).void }
  def max_depth=(value); end
  sig { void }
  def max_complexity(); end
  sig { params(value: T.untyped).void }
  def max_complexity=(value); end
  sig { void }
  def default_max_page_size(); end
  sig { params(value: T.untyped).void }
  def default_max_page_size=(value); end
  sig { void }
  def orphan_types(); end
  sig { params(value: T.untyped).void }
  def orphan_types=(value); end
  sig { void }
  def directives(); end
  sig { params(value: T.untyped).void }
  def directives=(value); end
  sig { void }
  def query_analyzers(); end
  sig { params(value: T.untyped).void }
  def query_analyzers=(value); end
  sig { void }
  def multiplex_analyzers(); end
  sig { params(value: T.untyped).void }
  def multiplex_analyzers=(value); end
  sig { void }
  def instrumenters(); end
  sig { params(value: T.untyped).void }
  def instrumenters=(value); end
  sig { void }
  def lazy_methods(); end
  sig { params(value: T.untyped).void }
  def lazy_methods=(value); end
  sig { void }
  def cursor_encoder(); end
  sig { params(value: T.untyped).void }
  def cursor_encoder=(value); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  sig { void }
  def raise_definition_error(); end
  sig { params(value: T.untyped).void }
  def raise_definition_error=(value); end
  sig { void }
  def introspection_namespace(); end
  sig { params(value: T.untyped).void }
  def introspection_namespace=(value); end
  sig { void }
  def analysis_engine(); end
  sig { params(value: T.untyped).void }
  def analysis_engine=(value); end
  sig { void }
  def error_bubbling(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def error_bubbling=(value); end
  sig { returns(GraphQL::Subscriptions) }
  def subscriptions(); end
  # sord infer - inferred type of parameter "value" as GraphQL::Subscriptions using getter's return type
  sig { params(value: GraphQL::Subscriptions).returns(GraphQL::Subscriptions) }
  def subscriptions=(value); end
  sig { returns(MiddlewareChain) }
  def middleware(); end
  # sord infer - inferred type of parameter "value" as MiddlewareChain using getter's return type
  sig { params(value: MiddlewareChain).returns(MiddlewareChain) }
  def middleware=(value); end
  # sord warn - "<#call(member, ctx)>" does not appear to be a type
  sig { returns(SORD_ERROR_callmemberctx) }
  def default_mask(); end
  # sord warn - "<#call(member, ctx)>" does not appear to be a type
  # sord infer - inferred type of parameter "value" as SORD_ERROR_callmemberctx using getter's return type
  # sord warn - "<#call(member, ctx)>" does not appear to be a type
  sig { params(value: SORD_ERROR_callmemberctx).returns(SORD_ERROR_callmemberctx) }
  def default_mask=(value); end
  sig { returns(Class) }
  def context_class(); end
  # sord infer - inferred type of parameter "value" as Class using getter's return type
  sig { params(value: Class).returns(Class) }
  def context_class=(value); end
  sig { params(value: T.untyped).void }
  def self.default_execution_strategy=(value); end
  sig { void }
  def default_filter(); end
  # sord warn - "#trace(key" does not appear to be a type
  # sord warn - "data)" does not appear to be a type
  sig { returns(T::Array[T.any(SORD_ERROR_tracekey, SORD_ERROR_data)]) }
  def tracers(); end
  sig { void }
  def static_validator(); end
  sig { void }
  def object_from_id_proc(); end
  sig { void }
  def id_from_object_proc(); end
  sig { void }
  def resolve_type_proc(); end
  sig { returns(Schema) }
  def initialize(); end
  sig { returns(T::Boolean) }
  def interpreter?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def interpreter=(value); end
  sig { void }
  def inspect(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped, block: T.untyped).void }
  def rescue_from(*args, &block); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped, block: T.untyped).void }
  def remove_handler(*args, &block); end
  sig { returns(T::Boolean) }
  def using_ast_analysis?(); end
  sig { void }
  def graphql_definition(); end
  # sord omit - no YARD type given for "rules:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(string_or_document: T.any(String, GraphQL::Language::Nodes::Document), rules: T.untyped, context: T.untyped).returns(T::Array[GraphQL::StaticValidation::Error]) }
  def validate(string_or_document, rules: nil, context: nil); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  sig { params(instrumentation_type: Symbol, instrumenter: T.untyped).void }
  def instrument(instrumentation_type, instrumenter); end
  sig { returns(T::Array[GraphQL::BaseType]) }
  def root_types(); end
  sig { returns(GraphQL::Schema::TypeMap) }
  def types(); end
  sig { void }
  def introspection_system(); end
  sig { params(type_name: String).returns(Hash) }
  def references_to(type_name); end
  sig { params(type: GraphQL::ObjectType).returns(T::Array[GraphQL::UnionType]) }
  def union_memberships(type); end
  # sord omit - no YARD type given for "query_str", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(query_str: T.untyped, kwargs: T.untyped).returns(Hash) }
  def execute(query_str = nil, **kwargs); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(queries: T::Array[Hash], kwargs: T.untyped).returns(T::Array[Hash]) }
  def multiplex(queries, **kwargs); end
  sig { params(path: String).returns(T.any(GraphQL::BaseType, GraphQL::Field, GraphQL::Argument, GraphQL::Directive)) }
  def find(path); end
  sig { params(parent_type: T.any(String, GraphQL::BaseType), field_name: String).returns(T.nilable(GraphQL::Field)) }
  def get_field(parent_type, field_name); end
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(type: T.untyped).returns(T::Hash[String, GraphQL::Field]) }
  def get_fields(type); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(ast_node: T.untyped).void }
  def type_from_ast(ast_node); end
  sig { params(type_defn: T.any(GraphQL::InterfaceType, GraphQL::UnionType)).returns(T::Array[GraphQL::ObjectType]) }
  def possible_types(type_defn); end
  # sord omit - no YARD type given for "operation", using T.untyped
  sig { params(operation: T.untyped).returns(T.nilable(GraphQL::ObjectType)) }
  def root_type_for_operation(operation); end
  # sord omit - no YARD type given for "operation", using T.untyped
  sig { params(operation: T.untyped).void }
  def execution_strategy_for_operation(operation); end
  # sord warn - "GraphQL:InterfaceType" does not appear to be a type
  sig { params(type: T.any(GraphQL::UnionType, SORD_ERROR_GraphQLInterfaceType), object: Any, ctx: GraphQL::Query::Context).returns(GraphQL::ObjectType) }
  def resolve_type(type, object, ctx = :__undefined__); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(type: T.untyped, object: T.untyped, ctx: T.untyped).void }
  def check_resolved_type(type, object, ctx = :__undefined__); end
  # sord infer - inferred type of parameter "new_resolve_type_proc" as GraphQL::ObjectType using getter's return type
  sig { params(new_resolve_type_proc: GraphQL::ObjectType).void }
  def resolve_type=(new_resolve_type_proc); end
  sig { params(id: String, ctx: GraphQL::Query::Context).returns(Any) }
  def object_from_id(id, ctx); end
  # sord duck - #call looks like a duck type, replacing with T.untyped
  sig { params(new_proc: T.untyped).void }
  def object_from_id=(new_proc); end
  sig { params(err: GraphQL::TypeError, ctx: GraphQL::Query::Context).returns(T.untyped) }
  def type_error(err, ctx); end
  # sord duck - #call looks like a duck type, replacing with T.untyped
  sig { params(new_proc: T.untyped).void }
  def type_error=(new_proc); end
  sig { void }
  def _schema_class(); end
  sig { params(err: GraphQL::ParseError, ctx: GraphQL::Query::Context).returns(T.untyped) }
  def parse_error(err, ctx); end
  # sord duck - #call looks like a duck type, replacing with T.untyped
  sig { params(new_proc: T.untyped).void }
  def parse_error=(new_proc); end
  sig { params(object: Any, type: GraphQL::BaseType, ctx: GraphQL::Query::Context).returns(String) }
  def id_from_object(object, type, ctx); end
  # sord duck - #call looks like a duck type, replacing with T.untyped
  sig { params(new_proc: T.untyped).void }
  def id_from_object=(new_proc); end
  sig { params(introspection_result: Hash).returns(GraphQL::Schema) }
  def self.from_introspection(introspection_result); end
  # sord omit - no YARD type given for "default_resolve:", using T.untyped
  # sord omit - no YARD type given for "parser:", using T.untyped
  sig { params(definition_or_path: String, default_resolve: T.untyped, parser: T.untyped).returns(GraphQL::Schema) }
  def self.from_definition(definition_or_path, default_resolve: BuildFromDefinition::DefaultResolve, parser: BuildFromDefinition::DefaultParser); end
  # sord omit - no YARD type given for "obj", using T.untyped
  sig { params(obj: T.untyped).returns(T.nilable(Symbol)) }
  def lazy_method_name(obj); end
  # sord omit - no YARD type given for "obj", using T.untyped
  sig { params(obj: T.untyped).returns(T::Boolean) }
  def lazy?(obj); end
  # sord omit - no YARD type given for "only:", using T.untyped
  # sord omit - no YARD type given for "except:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(only: T.untyped, except: T.untyped, context: T.untyped).returns(String) }
  def to_definition(only: nil, except: nil, context: {}); end
  sig { returns(GraphQL::Language::Document) }
  def to_document(); end
  # sord omit - no YARD type given for "only:", using T.untyped
  # sord omit - no YARD type given for "except:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(only: T.untyped, except: T.untyped, context: T.untyped).returns(Hash) }
  def as_json(only: nil, except: nil, context: {}); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).returns(String) }
  def to_json(*args); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "plugin", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(plugin: T.untyped, options: T.untyped).void }
  def self.use(plugin, options = {}); end
  sig { void }
  def self.plugins(); end
  sig { void }
  def self.to_graphql(); end
  # sord omit - no YARD type given for "new_query_object", using T.untyped
  sig { params(new_query_object: T.untyped).void }
  def self.query(new_query_object = nil); end
  # sord omit - no YARD type given for "new_mutation_object", using T.untyped
  sig { params(new_mutation_object: T.untyped).void }
  def self.mutation(new_mutation_object = nil); end
  # sord omit - no YARD type given for "new_subscription_object", using T.untyped
  sig { params(new_subscription_object: T.untyped).void }
  def self.subscription(new_subscription_object = nil); end
  # sord omit - no YARD type given for "new_introspection_namespace", using T.untyped
  sig { params(new_introspection_namespace: T.untyped).void }
  def self.introspection(new_introspection_namespace = nil); end
  # sord omit - no YARD type given for "new_encoder", using T.untyped
  sig { params(new_encoder: T.untyped).void }
  def self.cursor_encoder(new_encoder = nil); end
  # sord omit - no YARD type given for "new_default_max_page_size", using T.untyped
  sig { params(new_default_max_page_size: T.untyped).void }
  def self.default_max_page_size(new_default_max_page_size = nil); end
  # sord omit - no YARD type given for "new_query_execution_strategy", using T.untyped
  sig { params(new_query_execution_strategy: T.untyped).void }
  def self.query_execution_strategy(new_query_execution_strategy = nil); end
  # sord omit - no YARD type given for "new_mutation_execution_strategy", using T.untyped
  sig { params(new_mutation_execution_strategy: T.untyped).void }
  def self.mutation_execution_strategy(new_mutation_execution_strategy = nil); end
  # sord omit - no YARD type given for "new_subscription_execution_strategy", using T.untyped
  sig { params(new_subscription_execution_strategy: T.untyped).void }
  def self.subscription_execution_strategy(new_subscription_execution_strategy = nil); end
  # sord omit - no YARD type given for "max_complexity", using T.untyped
  sig { params(max_complexity: T.untyped).void }
  def self.max_complexity(max_complexity = nil); end
  # sord omit - no YARD type given for "new_error_bubbling", using T.untyped
  sig { params(new_error_bubbling: T.untyped).void }
  def self.error_bubbling(new_error_bubbling = nil); end
  # sord omit - no YARD type given for "new_max_depth", using T.untyped
  sig { params(new_max_depth: T.untyped).void }
  def self.max_depth(new_max_depth = nil); end
  # sord omit - no YARD type given for "new_orphan_types", using T.untyped
  sig { params(new_orphan_types: T.untyped).void }
  def self.orphan_types(*new_orphan_types); end
  sig { void }
  def self.default_execution_strategy(); end
  # sord omit - no YARD type given for "new_context_class", using T.untyped
  sig { params(new_context_class: T.untyped).void }
  def self.context_class(new_context_class = nil); end
  # sord omit - no YARD type given for "err_classes", using T.untyped
  sig { params(err_classes: T.untyped, handler_block: T.untyped).void }
  def self.rescue_from(*err_classes, &handler_block); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(type: T.untyped, obj: T.untyped, ctx: T.untyped).void }
  def self.resolve_type(type, obj, ctx); end
  # sord omit - no YARD type given for "node_id", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(node_id: T.untyped, ctx: T.untyped).void }
  def self.object_from_id(node_id, ctx); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(object: T.untyped, type: T.untyped, ctx: T.untyped).void }
  def self.id_from_object(object, type, ctx); end
  # sord omit - no YARD type given for "member", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(member: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.visible?(member, context); end
  # sord omit - no YARD type given for "member", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(member: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.accessible?(member, context); end
  sig { params(error: InaccessibleFieldsError).returns(T.nilable(AnalysisError)) }
  def self.inaccessible_fields(error); end
  sig { params(unauthorized_error: GraphQL::UnauthorizedError).returns(Object) }
  def self.unauthorized_object(unauthorized_error); end
  sig { params(unauthorized_error: GraphQL::UnauthorizedFieldError).returns(Field) }
  def self.unauthorized_field(unauthorized_error); end
  # sord omit - no YARD type given for "type_err", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(type_err: T.untyped, ctx: T.untyped).void }
  def self.type_error(type_err, ctx); end
  # sord omit - no YARD type given for "lazy_class", using T.untyped
  # sord omit - no YARD type given for "value_method", using T.untyped
  sig { params(lazy_class: T.untyped, value_method: T.untyped).void }
  def self.lazy_resolve(lazy_class, value_method); end
  # sord omit - no YARD type given for "instrument_step", using T.untyped
  # sord omit - no YARD type given for "instrumenter", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(instrument_step: T.untyped, instrumenter: T.untyped, options: T.untyped).void }
  def self.instrument(instrument_step, instrumenter, options = {}); end
  # sord omit - no YARD type given for "new_directives", using T.untyped
  sig { params(new_directives: T.untyped).void }
  def self.directives(new_directives = nil); end
  # sord omit - no YARD type given for "new_directive", using T.untyped
  sig { params(new_directive: T.untyped).void }
  def self.directive(new_directive); end
  sig { void }
  def self.default_directives(); end
  # sord omit - no YARD type given for "new_tracer", using T.untyped
  sig { params(new_tracer: T.untyped).void }
  def self.tracer(new_tracer); end
  # sord omit - no YARD type given for "new_analyzer", using T.untyped
  sig { params(new_analyzer: T.untyped).void }
  def self.query_analyzer(new_analyzer); end
  # sord omit - no YARD type given for "new_middleware", using T.untyped
  sig { params(new_middleware: T.untyped).void }
  def self.middleware(new_middleware = nil); end
  # sord omit - no YARD type given for "new_analyzer", using T.untyped
  sig { params(new_analyzer: T.untyped).void }
  def self.multiplex_analyzer(new_analyzer); end
  sig { void }
  def self.lazy_classes(); end
  sig { void }
  def self.defined_instrumenters(); end
  sig { void }
  def self.defined_tracers(); end
  sig { void }
  def self.defined_query_analyzers(); end
  sig { void }
  def self.defined_middleware(); end
  sig { void }
  def self.defined_multiplex_analyzers(); end
  # sord omit - no YARD type given for "member", using T.untyped
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "default:", using T.untyped
  sig { params(member: T.untyped, method_name: T.untyped, args: T.untyped, default: T.untyped).void }
  def self.call_on_type_class(member, method_name, *args, default:); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def after_lazy(value); end
  sig { params(value: Object).returns(Object) }
  def self.sync_lazy(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def sync_lazy(value); end
  sig { returns(T::Boolean) }
  def rescues?(); end
  sig { void }
  def rescue_middleware(); end
  sig { void }
  def rebuild_artifacts(); end
  sig { void }
  def with_definition_error_check(); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
class InvalidDocumentError < GraphQL::Error
end
module MethodWrappers
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(type: T.untyped, obj: T.untyped, ctx: T.untyped).void }
  def resolve_type(type, obj, ctx = :__undefined__); end
end
class CyclicalDefinitionError < GraphQL::Error
end
class Enum < GraphQL::Schema::Member
  include Forwardable
  include GraphQL::Schema::Member::AcceptsDefinition
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.value(*args, **kwargs, &block); end
  sig { returns(T::Hash[String, GraphQL::Schema::Enum::Value]) }
  def self.values(); end
  sig { returns(GraphQL::EnumType) }
  def self.to_graphql(); end
  # sord omit - no YARD type given for "new_enum_value_class", using T.untyped
  sig { params(new_enum_value_class: T.untyped).returns(Class) }
  def self.enum_value_class(new_enum_value_class = nil); end
  sig { void }
  def self.kind(); end
  sig { void }
  def self.own_values(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class List < GraphQL::Schema::Wrapper
  sig { void }
  def to_graphql(); end
  sig { returns(GraphQL::TypeKinds::LIST) }
  def kind(); end
  sig { returns(T::Boolean) }
  def list?(); end
  sig { void }
  def to_type_signature(); end
  sig { returns(T.any(Class, Module)) }
  def of_type(); end
  # sord omit - no YARD type given for "of_type", using T.untyped
  sig { params(of_type: T.untyped).returns(Wrapper) }
  def initialize(of_type); end
  sig { void }
  def unwrap(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def ==(other); end
  sig { returns(Schema::NonNull) }
  def to_non_null_type(); end
  sig { returns(Schema::List) }
  def to_list_type(); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { void }
  def graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def initialize_copy(original); end
end
class Field
  extend GraphQL::Schema::Member::HasPath
  extend GraphQL::Schema::Member::HasArguments
  extend GraphQL::Schema::Member::AcceptsDefinition
  extend GraphQL::Schema::Member::CachedGraphQLDefinition
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { params(value: T.untyped).void }
  def description=(value); end
  sig { returns(T.nilable(String)) }
  def deprecation_reason(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def deprecation_reason=(value); end
  sig { returns(Symbol) }
  def method_sym(); end
  sig { returns(String) }
  def method_str(); end
  sig { returns(Symbol) }
  def resolver_method(); end
  sig { returns(Class) }
  def owner(); end
  sig { returns(Symobol) }
  def original_name(); end
  sig { returns(T.nilable(Class)) }
  def resolver(); end
  sig { returns(T.nilable(Class)) }
  def mutation(); end
  sig { returns(T::Array[Symbol]) }
  def extras(); end
  sig { returns(T::Boolean) }
  def trace(); end
  sig { returns(T.nilable(String)) }
  def subscription_scope(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "desc", using T.untyped
  # sord omit - no YARD type given for "resolver:", using T.untyped
  # sord omit - no YARD type given for "mutation:", using T.untyped
  # sord omit - no YARD type given for "subscription:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  # sord warn - "GraphQL::Schema:Field" does not appear to be a type
  sig { params(name: T.untyped, type: T.untyped, desc: T.untyped, resolver: T.untyped, mutation: T.untyped, subscription: T.untyped, kwargs: T.untyped, block: T.untyped).returns(SORD_ERROR_GraphQLSchemaField) }
  def self.from_options(name = nil, type = nil, desc = nil, resolver: nil, mutation: nil, subscription: nil, **kwargs, &block); end
  sig { returns(T::Boolean) }
  def connection?(); end
  sig { returns(T::Boolean) }
  def scoped?(); end
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "owner:", using T.untyped
  # sord omit - no YARD type given for "null:", using T.untyped
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "function:", using T.untyped
  # sord omit - no YARD type given for "description:", using T.untyped
  # sord omit - no YARD type given for "deprecation_reason:", using T.untyped
  # sord omit - no YARD type given for "method:", using T.untyped
  # sord omit - no YARD type given for "hash_key:", using T.untyped
  # sord omit - no YARD type given for "resolver_method:", using T.untyped
  # sord omit - no YARD type given for "resolve:", using T.untyped
  # sord omit - no YARD type given for "connection:", using T.untyped
  # sord omit - no YARD type given for "max_page_size:", using T.untyped
  # sord omit - no YARD type given for "scope:", using T.untyped
  # sord omit - no YARD type given for "introspection:", using T.untyped
  # sord omit - no YARD type given for "camelize:", using T.untyped
  # sord omit - no YARD type given for "trace:", using T.untyped
  # sord omit - no YARD type given for "complexity:", using T.untyped
  # sord omit - no YARD type given for "extras:", using T.untyped
  # sord omit - no YARD type given for "extensions:", using T.untyped
  # sord omit - no YARD type given for "resolver_class:", using T.untyped
  # sord omit - no YARD type given for "subscription_scope:", using T.untyped
  # sord omit - no YARD type given for "relay_node_field:", using T.untyped
  # sord omit - no YARD type given for "relay_nodes_field:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  sig { params(type: T.untyped, name: T.untyped, owner: T.untyped, null: T.untyped, field: T.untyped, function: T.untyped, description: T.untyped, deprecation_reason: T.untyped, method: T.untyped, hash_key: T.untyped, resolver_method: T.untyped, resolve: T.untyped, connection: T.untyped, max_page_size: T.untyped, scope: T.untyped, introspection: T.untyped, camelize: T.untyped, trace: T.untyped, complexity: T.untyped, extras: T.untyped, extensions: T.untyped, resolver_class: T.untyped, subscription_scope: T.untyped, relay_node_field: T.untyped, relay_nodes_field: T.untyped, arguments: T.untyped, definition_block: T.untyped).returns(Field) }
  def initialize(type: nil, name: nil, owner: nil, null: nil, field: nil, function: nil, description: nil, deprecation_reason: nil, method: nil, hash_key: nil, resolver_method: nil, resolve: nil, connection: nil, max_page_size: nil, scope: nil, introspection: false, camelize: true, trace: nil, complexity: 1, extras: [], extensions: [], resolver_class: nil, subscription_scope: nil, relay_node_field: false, relay_nodes_field: false, arguments: {}, &definition_block); end
  sig { params(text: String).returns(String) }
  def description(text = nil); end
  # sord omit - no YARD type given for "new_extensions", using T.untyped
  sig { params(new_extensions: T.untyped).returns(T::Array[GraphQL::Schema::FieldExtension]) }
  def extensions(new_extensions = nil); end
  sig { params(extension: Class, options: Object).void }
  def extension(extension, options = nil); end
  # sord omit - no YARD type given for "new_complexity", using T.untyped
  sig { params(new_complexity: T.untyped).void }
  def complexity(new_complexity); end
  sig { returns(T.nilable(Integer)) }
  def max_page_size(); end
  sig { returns(GraphQL::Field) }
  def to_graphql(); end
  sig { void }
  def type(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def authorized?(object, context); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def resolve_field(obj, args, ctx); end
  sig { params(object: GraphQL::Schema::Object, args: Hash, ctx: GraphQL::Query::Context).void }
  def resolve(object, args, ctx); end
  sig { params(obj: GraphQL::Schema::Object, ruby_kwargs: T::Hash[Symbol, Object], ctx: GraphQL::Query::Context).void }
  def resolve_field_method(obj, ruby_kwargs, ctx); end
  # sord omit - no YARD type given for "extra_name", using T.untyped
  sig { params(extra_name: T.untyped, ctx: GraphQL::Query::Context::FieldResolutionContext).void }
  def fetch_extra(extra_name, ctx); end
  sig { params(obj: GraphQL::Schema::Object, graphql_args: GraphQL::Query::Arguments, field_ctx: GraphQL::Query::Context::FieldResolutionContext).returns(T::Hash[Symbol, Any]) }
  def to_ruby_args(obj, graphql_args, field_ctx); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "ruby_kwargs", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(obj: T.untyped, ruby_kwargs: T.untyped, field_ctx: T.untyped).void }
  def public_send_field(obj, ruby_kwargs, field_ctx); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).returns(Object) }
  def with_extensions(obj, args, ctx); end
  # sord omit - no YARD type given for "memos", using T.untyped
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  # sord omit - no YARD type given for "idx:", using T.untyped
  sig { params(memos: T.untyped, obj: T.untyped, args: T.untyped, ctx: T.untyped, idx: T.untyped).void }
  def run_extensions_before_resolve(memos, obj, args, ctx, idx: 0); end
  sig { returns(String) }
  def path(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).returns(GraphQL::Schema::Argument) }
  def argument(*args, **kwargs, &block); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def arguments(); end
  sig { params(new_arg_class: Class).void }
  def argument_class(new_arg_class = nil); end
  sig { void }
  def own_arguments(); end
  sig { void }
  def graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def initialize_copy(original); end
class ScopeExtension < GraphQL::Schema::FieldExtension
  # sord omit - no YARD type given for "value:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  sig { params(value: T.untyped, context: T.untyped, rest: T.untyped).void }
  def after_resolve(value:, context:, **rest); end
  sig { returns(GraphQL::Schema::Field) }
  def field(); end
  sig { returns(Object) }
  def options(); end
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "options:", using T.untyped
  sig { params(field: T.untyped, options: T.untyped).returns(FieldExtension) }
  def initialize(field:, options:); end
  sig { void }
  def apply(); end
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped).returns(Object) }
  def resolve(object:, arguments:, context:); end
end
class ConnectionExtension < GraphQL::Schema::FieldExtension
  sig { void }
  def apply(); end
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped).void }
  def resolve(object:, arguments:, context:); end
  # sord omit - no YARD type given for "value:", using T.untyped
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "memo:", using T.untyped
  sig { params(value: T.untyped, object: T.untyped, arguments: T.untyped, context: T.untyped, memo: T.untyped).void }
  def after_resolve(value:, object:, arguments:, context:, memo:); end
  sig { returns(GraphQL::Schema::Field) }
  def field(); end
  sig { returns(Object) }
  def options(); end
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "options:", using T.untyped
  sig { params(field: T.untyped, options: T.untyped).returns(FieldExtension) }
  def initialize(field:, options:); end
end
end
class Union < GraphQL::Schema::Member
  include GraphQL::Schema::Member::AcceptsDefinition
  # sord omit - no YARD type given for "types", using T.untyped
  sig { params(types: T.untyped).void }
  def self.possible_types(*types); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Finder
  # sord omit - no YARD type given for "schema", using T.untyped
  sig { params(schema: T.untyped).returns(Finder) }
  def initialize(schema); end
  # sord omit - no YARD type given for "path", using T.untyped
  sig { params(path: T.untyped).void }
  def find(path); end
  sig { void }
  def schema(); end
  # sord omit - no YARD type given for "directive", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(directive: T.untyped, path: T.untyped).void }
  def find_in_directive(directive, path:); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(type: T.untyped, path: T.untyped).void }
  def find_in_type(type, path:); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "kind:", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(type: T.untyped, kind: T.untyped, path: T.untyped).void }
  def find_in_fields_type(type, kind:, path:); end
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(field: T.untyped, path: T.untyped).void }
  def find_in_field(field, path:); end
  # sord omit - no YARD type given for "input_object", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(input_object: T.untyped, path: T.untyped).void }
  def find_in_input_object(input_object, path:); end
  # sord omit - no YARD type given for "enum_type", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(enum_type: T.untyped, path: T.untyped).void }
  def find_in_enum_type(enum_type, path:); end
class MemberNotFoundError < ArgumentError
end
end
module Loader
  include GraphQL::Schema::Loader
  sig { params(introspection_result: Hash).returns(GraphQL::Schema) }
  def load(introspection_result); end
  # sord omit - no YARD type given for "types", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(types: T.untyped, type: T.untyped).void }
  def self.resolve_type(types, type); end
  # sord omit - no YARD type given for "default_value_str", using T.untyped
  # sord omit - no YARD type given for "input_value_ast", using T.untyped
  sig { params(default_value_str: T.untyped, input_value_ast: T.untyped).void }
  def self.extract_default_value(default_value_str, input_value_ast); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(type: T.untyped, type_resolver: T.untyped).void }
  def self.define_type(type, type_resolver); end
  sig { params(introspection_result: Hash).returns(GraphQL::Schema) }
  def self.load(introspection_result); end
end
class Member
  extend GraphQL::Schema::Member::GraphQLTypeNames
  include GraphQL::Schema::Member::HasPath
  include GraphQL::Schema::Member::RelayShortcuts
  include GraphQL::Schema::Member::Scoped
  include GraphQL::Schema::Member::TypeSystemHelpers
  include GraphQL::Schema::Member::BaseDSLMethods
  include GraphQL::Relay::TypeExtensions
  include GraphQL::Schema::Member::CachedGraphQLDefinition
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { returns(GraphQL::TypeKinds::TypeKind) }
  def self.kind(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { returns(GraphQL::BaseType) }
  def self.to_graphql(); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
module Scoped
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def scope_items(items, context); end
end
module HasPath
  sig { returns(String) }
  def path(); end
end
module BuildType
  # sord omit - no YARD type given for "null:", using T.untyped
  sig { params(type_expr: T.any(String, Class, GraphQL::BaseType), null: T.untyped).returns(GraphQL::BaseType) }
  def parse_type(type_expr, null:); end
  # sord omit - no YARD type given for "null:", using T.untyped
  sig { params(type_expr: T.any(String, Class, GraphQL::BaseType), null: T.untyped).returns(GraphQL::BaseType) }
  def self.parse_type(type_expr, null:); end
  # sord omit - no YARD type given for "something", using T.untyped
  sig { params(something: T.untyped).void }
  def to_type_name(something); end
  # sord omit - no YARD type given for "something", using T.untyped
  sig { params(something: T.untyped).void }
  def self.to_type_name(something); end
  # sord omit - no YARD type given for "string", using T.untyped
  sig { params(string: T.untyped).void }
  def camelize(string); end
  # sord omit - no YARD type given for "string", using T.untyped
  sig { params(string: T.untyped).void }
  def self.camelize(string); end
  # sord omit - no YARD type given for "string", using T.untyped
  sig { params(string: T.untyped).void }
  def constantize(string); end
  # sord omit - no YARD type given for "string", using T.untyped
  sig { params(string: T.untyped).void }
  def self.constantize(string); end
  # sord omit - no YARD type given for "string", using T.untyped
  sig { params(string: T.untyped).void }
  def underscore(string); end
  # sord omit - no YARD type given for "string", using T.untyped
  sig { params(string: T.untyped).void }
  def self.underscore(string); end
end
module HasFields
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def field(*args, **kwargs, &block); end
  sig { returns(T::Hash[String, GraphQL::Schema::Field]) }
  def fields(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def own_fields(); end
end
module HasArguments
  # sord omit - no YARD type given for "cls", using T.untyped
  sig { params(cls: T.untyped).void }
  def self.included(cls); end
  # sord omit - no YARD type given for "cls", using T.untyped
  sig { params(cls: T.untyped).void }
  def self.extended(cls); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).returns(GraphQL::Schema::Argument) }
  def argument(*args, **kwargs, &block); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def arguments(); end
  sig { params(new_arg_class: Class).void }
  def argument_class(new_arg_class = nil); end
  sig { void }
  def own_arguments(); end
module ArgumentClassAccessor
  # sord omit - no YARD type given for "new_arg_class", using T.untyped
  sig { params(new_arg_class: T.untyped).void }
  def argument_class(new_arg_class = nil); end
end
module ArgumentObjectLoader
  sig { params(type: T.any(Class, Module), id: String, context: GraphQL::Query::Context).void }
  def object_from_id(type, id, context); end
  # sord omit - no YARD type given for "argument", using T.untyped
  # sord omit - no YARD type given for "lookup_as_type", using T.untyped
  # sord omit - no YARD type given for "id", using T.untyped
  sig { params(argument: T.untyped, lookup_as_type: T.untyped, id: T.untyped).void }
  def load_application_object(argument, lookup_as_type, id); end
  # sord omit - no YARD type given for "err", using T.untyped
  sig { params(err: T.untyped).void }
  def load_application_object_failed(err); end
end
end
module Instrumentation
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def instrument(type, field); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def self.instrument(type, field); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def before_query(query); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def self.before_query(query); end
  # sord omit - no YARD type given for "_query", using T.untyped
  sig { params(_query: T.untyped).void }
  def after_query(_query); end
  # sord omit - no YARD type given for "_query", using T.untyped
  sig { params(_query: T.untyped).void }
  def self.after_query(_query); end
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(field: T.untyped).void }
  def apply_proxy(field); end
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(field: T.untyped).void }
  def self.apply_proxy(field); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "starting_at", using T.untyped
  sig { params(type: T.untyped, starting_at: T.untyped).void }
  def list_depth(type, starting_at = 0); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "starting_at", using T.untyped
  sig { params(type: T.untyped, starting_at: T.untyped).void }
  def self.list_depth(type, starting_at = 0); end
class ProxiedResolve
  # sord omit - no YARD type given for "inner_resolve:", using T.untyped
  # sord omit - no YARD type given for "list_depth:", using T.untyped
  # sord omit - no YARD type given for "inner_return_type:", using T.untyped
  sig { params(inner_resolve: T.untyped, list_depth: T.untyped, inner_return_type: T.untyped).returns(ProxiedResolve) }
  def initialize(inner_resolve:, list_depth:, inner_return_type:); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
  # sord omit - no YARD type given for "inner_obj", using T.untyped
  # sord omit - no YARD type given for "depth", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(inner_obj: T.untyped, depth: T.untyped, ctx: T.untyped).void }
  def proxy_to_depth(inner_obj, depth, ctx); end
end
end
module RelayShortcuts
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def edge_type(); end
  sig { void }
  def connection_type(); end
end
module BaseDSLMethods
  sig { params(new_name: String).returns(String) }
  def graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def mutation(mutation_class = nil); end
  sig { returns(GraphQL::BaseType) }
  def to_graphql(); end
  sig { void }
  def unwrap(); end
  sig { void }
  def overridden_graphql_name(); end
  sig { void }
  def default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def find_inherited_method(method_name, default_value); end
end
module AcceptsDefinition
  # sord omit - no YARD type given for "child", using T.untyped
  sig { params(child: T.untyped).void }
  def self.included(child); end
  # sord omit - no YARD type given for "child", using T.untyped
  sig { params(child: T.untyped).void }
  def self.extended(child); end
module AcceptsDefinitionDefinitionMethods
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(name: T.untyped).void }
  def accepts_definition(name); end
  sig { void }
  def accepts_definition_methods(); end
  sig { void }
  def own_accepts_definition_methods(); end
end
module ToGraphQLExtension
  sig { void }
  def to_graphql(); end
end
module InitializeExtension
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def initialize(*args, **kwargs, &block); end
  sig { void }
  def accepts_definition_methods(); end
end
end
module GraphQLTypeNames
end
module TypeSystemHelpers
  sig { returns(Schema::NonNull) }
  def to_non_null_type(); end
  sig { returns(Schema::List) }
  def to_list_type(); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  sig { void }
  def to_type_signature(); end
  sig { returns(GraphQL::TypeKinds::TypeKind) }
  def kind(); end
end
module CachedGraphQLDefinition
  sig { void }
  def graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def initialize_copy(original); end
end
end
class Object < GraphQL::Schema::Member
  include GraphQL::Schema::Member::HasFields
  include GraphQL::Schema::Member::AcceptsDefinition
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { returns(GraphQL::ObjectType) }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Scalar < GraphQL::Schema::Member
  include Forwardable
  include GraphQL::Schema::Member::AcceptsDefinition
  # sord omit - no YARD type given for "val", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(val: T.untyped, ctx: T.untyped).void }
  def self.coerce_input(val, ctx); end
  # sord omit - no YARD type given for "val", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(val: T.untyped, ctx: T.untyped).void }
  def self.coerce_result(val, ctx); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "is_default", using T.untyped
  sig { params(is_default: T.untyped).void }
  def self.default_scalar(is_default = nil); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Warden
  # sord warn - "<#call(member)>" does not appear to be a type
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "schema:", using T.untyped
  sig { params(filter: SORD_ERROR_callmember, context: T.untyped, schema: T.untyped).returns(Warden) }
  def initialize(filter, context:, schema:); end
  sig { returns(T::Array[GraphQL::BaseType]) }
  def types(); end
  # sord omit - no YARD type given for "type_name", using T.untyped
  sig { params(type_name: T.untyped).returns(T.nilable(GraphQL::BaseType)) }
  def get_type(type_name); end
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(parent_type: T.untyped, field_name: T.untyped).returns(T.nilable(GraphQL::Field)) }
  def get_field(parent_type, field_name); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Array[GraphQL::BaseType]) }
  def possible_types(type_defn); end
  sig { params(type_defn: T.any(GraphQL::ObjectType, GraphQL::InterfaceType)).returns(T::Array[GraphQL::Field]) }
  def fields(type_defn); end
  sig { params(argument_owner: T.any(GraphQL::Field, GraphQL::InputObjectType)).returns(T::Array[GraphQL::Argument]) }
  def arguments(argument_owner); end
  # sord omit - no YARD type given for "enum_defn", using T.untyped
  sig { params(enum_defn: T.untyped).returns(T::Array[GraphQL::EnumType::EnumValue]) }
  def enum_values(enum_defn); end
  # sord omit - no YARD type given for "obj_type", using T.untyped
  sig { params(obj_type: T.untyped).returns(T::Array[GraphQL::InterfaceType]) }
  def interfaces(obj_type); end
  sig { void }
  def directives(); end
  # sord omit - no YARD type given for "op_name", using T.untyped
  sig { params(op_name: T.untyped).void }
  def root_type_for_operation(op_name); end
  # sord omit - no YARD type given for "obj_type", using T.untyped
  sig { params(obj_type: T.untyped).void }
  def union_memberships(obj_type); end
  # sord omit - no YARD type given for "field_defn", using T.untyped
  sig { params(field_defn: T.untyped).returns(T::Boolean) }
  def visible_field?(field_defn); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def visible_type?(type_defn); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def root_type?(type_defn); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def referenced?(type_defn); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def orphan_type?(type_defn); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def visible_abstract_type?(type_defn); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).returns(T::Boolean) }
  def visible_possible_types?(type_defn); end
  # sord omit - no YARD type given for "member", using T.untyped
  sig { params(member: T.untyped).returns(T::Boolean) }
  def visible?(member); end
  sig { void }
  def read_through(); end
end
class Printer < GraphQL::Language::Printer
  sig { void }
  def schema(); end
  sig { void }
  def warden(); end
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "only:", using T.untyped
  # sord omit - no YARD type given for "except:", using T.untyped
  # sord omit - no YARD type given for "introspection:", using T.untyped
  sig { params(schema: GraphQL::Schema, context: T.untyped, only: T.untyped, except: T.untyped, introspection: T.untyped).returns(Printer) }
  def initialize(schema, context: nil, only: nil, except: nil, introspection: false); end
  sig { void }
  def self.print_introspection_schema(); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: GraphQL::Schema, args: T.untyped).void }
  def self.print_schema(schema, **args); end
  sig { void }
  def print_schema(); end
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(type: T.untyped).void }
  def print_type(type); end
  # sord omit - no YARD type given for "directive", using T.untyped
  sig { params(directive: T.untyped).void }
  def print_directive(directive); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped).returns(String) }
  def print(node, indent: ""); end
  # sord omit - no YARD type given for "document", using T.untyped
  sig { params(document: T.untyped).void }
  def print_document(document); end
  # sord omit - no YARD type given for "argument", using T.untyped
  sig { params(argument: T.untyped).void }
  def print_argument(argument); end
  # sord omit - no YARD type given for "enum", using T.untyped
  sig { params(enum: T.untyped).void }
  def print_enum(enum); end
  sig { void }
  def print_null_value(); end
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(field: T.untyped, indent: T.untyped).void }
  def print_field(field, indent: ""); end
  # sord omit - no YARD type given for "fragment_def", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(fragment_def: T.untyped, indent: T.untyped).void }
  def print_fragment_definition(fragment_def, indent: ""); end
  # sord omit - no YARD type given for "fragment_spread", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(fragment_spread: T.untyped, indent: T.untyped).void }
  def print_fragment_spread(fragment_spread, indent: ""); end
  # sord omit - no YARD type given for "inline_fragment", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(inline_fragment: T.untyped, indent: T.untyped).void }
  def print_inline_fragment(inline_fragment, indent: ""); end
  # sord omit - no YARD type given for "input_object", using T.untyped
  sig { params(input_object: T.untyped).void }
  def print_input_object(input_object); end
  # sord omit - no YARD type given for "list_type", using T.untyped
  sig { params(list_type: T.untyped).void }
  def print_list_type(list_type); end
  # sord omit - no YARD type given for "non_null_type", using T.untyped
  sig { params(non_null_type: T.untyped).void }
  def print_non_null_type(non_null_type); end
  # sord omit - no YARD type given for "operation_definition", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(operation_definition: T.untyped, indent: T.untyped).void }
  def print_operation_definition(operation_definition, indent: ""); end
  # sord omit - no YARD type given for "type_name", using T.untyped
  sig { params(type_name: T.untyped).void }
  def print_type_name(type_name); end
  # sord omit - no YARD type given for "variable_definition", using T.untyped
  sig { params(variable_definition: T.untyped).void }
  def print_variable_definition(variable_definition); end
  # sord omit - no YARD type given for "variable_identifier", using T.untyped
  sig { params(variable_identifier: T.untyped).void }
  def print_variable_identifier(variable_identifier); end
  # sord omit - no YARD type given for "schema", using T.untyped
  sig { params(schema: T.untyped).void }
  def print_schema_definition(schema); end
  # sord omit - no YARD type given for "scalar_type", using T.untyped
  sig { params(scalar_type: T.untyped).void }
  def print_scalar_type_definition(scalar_type); end
  # sord omit - no YARD type given for "object_type", using T.untyped
  sig { params(object_type: T.untyped).void }
  def print_object_type_definition(object_type); end
  # sord omit - no YARD type given for "input_value", using T.untyped
  sig { params(input_value: T.untyped).void }
  def print_input_value_definition(input_value); end
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(arguments: T.untyped, indent: T.untyped).void }
  def print_arguments(arguments, indent: ""); end
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(field: T.untyped).void }
  def print_field_definition(field); end
  # sord omit - no YARD type given for "interface_type", using T.untyped
  sig { params(interface_type: T.untyped).void }
  def print_interface_type_definition(interface_type); end
  # sord omit - no YARD type given for "union_type", using T.untyped
  sig { params(union_type: T.untyped).void }
  def print_union_type_definition(union_type); end
  # sord omit - no YARD type given for "enum_type", using T.untyped
  sig { params(enum_type: T.untyped).void }
  def print_enum_type_definition(enum_type); end
  # sord omit - no YARD type given for "enum_value", using T.untyped
  sig { params(enum_value: T.untyped).void }
  def print_enum_value_definition(enum_value); end
  # sord omit - no YARD type given for "input_object_type", using T.untyped
  sig { params(input_object_type: T.untyped).void }
  def print_input_object_type_definition(input_object_type); end
  # sord omit - no YARD type given for "directive", using T.untyped
  sig { params(directive: T.untyped).void }
  def print_directive_definition(directive); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  # sord omit - no YARD type given for "first_in_block:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped, first_in_block: T.untyped).void }
  def print_description(node, indent: "", first_in_block: true); end
  # sord omit - no YARD type given for "fields", using T.untyped
  sig { params(fields: T.untyped).void }
  def print_field_definitions(fields); end
  # sord omit - no YARD type given for "directives", using T.untyped
  sig { params(directives: T.untyped).void }
  def print_directives(directives); end
  # sord omit - no YARD type given for "selections", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(selections: T.untyped, indent: T.untyped).void }
  def print_selections(selections, indent: ""); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped).void }
  def print_node(node, indent: ""); end
  sig { void }
  def node(); end
class IntrospectionPrinter < GraphQL::Language::Printer
  # sord omit - no YARD type given for "schema", using T.untyped
  sig { params(schema: T.untyped).void }
  def print_schema_definition(schema); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped).returns(String) }
  def print(node, indent: ""); end
  # sord omit - no YARD type given for "document", using T.untyped
  sig { params(document: T.untyped).void }
  def print_document(document); end
  # sord omit - no YARD type given for "argument", using T.untyped
  sig { params(argument: T.untyped).void }
  def print_argument(argument); end
  # sord omit - no YARD type given for "directive", using T.untyped
  sig { params(directive: T.untyped).void }
  def print_directive(directive); end
  # sord omit - no YARD type given for "enum", using T.untyped
  sig { params(enum: T.untyped).void }
  def print_enum(enum); end
  sig { void }
  def print_null_value(); end
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(field: T.untyped, indent: T.untyped).void }
  def print_field(field, indent: ""); end
  # sord omit - no YARD type given for "fragment_def", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(fragment_def: T.untyped, indent: T.untyped).void }
  def print_fragment_definition(fragment_def, indent: ""); end
  # sord omit - no YARD type given for "fragment_spread", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(fragment_spread: T.untyped, indent: T.untyped).void }
  def print_fragment_spread(fragment_spread, indent: ""); end
  # sord omit - no YARD type given for "inline_fragment", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(inline_fragment: T.untyped, indent: T.untyped).void }
  def print_inline_fragment(inline_fragment, indent: ""); end
  # sord omit - no YARD type given for "input_object", using T.untyped
  sig { params(input_object: T.untyped).void }
  def print_input_object(input_object); end
  # sord omit - no YARD type given for "list_type", using T.untyped
  sig { params(list_type: T.untyped).void }
  def print_list_type(list_type); end
  # sord omit - no YARD type given for "non_null_type", using T.untyped
  sig { params(non_null_type: T.untyped).void }
  def print_non_null_type(non_null_type); end
  # sord omit - no YARD type given for "operation_definition", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(operation_definition: T.untyped, indent: T.untyped).void }
  def print_operation_definition(operation_definition, indent: ""); end
  # sord omit - no YARD type given for "type_name", using T.untyped
  sig { params(type_name: T.untyped).void }
  def print_type_name(type_name); end
  # sord omit - no YARD type given for "variable_definition", using T.untyped
  sig { params(variable_definition: T.untyped).void }
  def print_variable_definition(variable_definition); end
  # sord omit - no YARD type given for "variable_identifier", using T.untyped
  sig { params(variable_identifier: T.untyped).void }
  def print_variable_identifier(variable_identifier); end
  # sord omit - no YARD type given for "scalar_type", using T.untyped
  sig { params(scalar_type: T.untyped).void }
  def print_scalar_type_definition(scalar_type); end
  # sord omit - no YARD type given for "object_type", using T.untyped
  sig { params(object_type: T.untyped).void }
  def print_object_type_definition(object_type); end
  # sord omit - no YARD type given for "input_value", using T.untyped
  sig { params(input_value: T.untyped).void }
  def print_input_value_definition(input_value); end
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(arguments: T.untyped, indent: T.untyped).void }
  def print_arguments(arguments, indent: ""); end
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(field: T.untyped).void }
  def print_field_definition(field); end
  # sord omit - no YARD type given for "interface_type", using T.untyped
  sig { params(interface_type: T.untyped).void }
  def print_interface_type_definition(interface_type); end
  # sord omit - no YARD type given for "union_type", using T.untyped
  sig { params(union_type: T.untyped).void }
  def print_union_type_definition(union_type); end
  # sord omit - no YARD type given for "enum_type", using T.untyped
  sig { params(enum_type: T.untyped).void }
  def print_enum_type_definition(enum_type); end
  # sord omit - no YARD type given for "enum_value", using T.untyped
  sig { params(enum_value: T.untyped).void }
  def print_enum_value_definition(enum_value); end
  # sord omit - no YARD type given for "input_object_type", using T.untyped
  sig { params(input_object_type: T.untyped).void }
  def print_input_object_type_definition(input_object_type); end
  # sord omit - no YARD type given for "directive", using T.untyped
  sig { params(directive: T.untyped).void }
  def print_directive_definition(directive); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  # sord omit - no YARD type given for "first_in_block:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped, first_in_block: T.untyped).void }
  def print_description(node, indent: "", first_in_block: true); end
  # sord omit - no YARD type given for "fields", using T.untyped
  sig { params(fields: T.untyped).void }
  def print_field_definitions(fields); end
  # sord omit - no YARD type given for "directives", using T.untyped
  sig { params(directives: T.untyped).void }
  def print_directives(directives); end
  # sord omit - no YARD type given for "selections", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(selections: T.untyped, indent: T.untyped).void }
  def print_selections(selections, indent: ""); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped).void }
  def print_node(node, indent: ""); end
  sig { void }
  def node(); end
end
end
class Wrapper
  extend GraphQL::Schema::Member::TypeSystemHelpers
  extend GraphQL::Schema::Member::CachedGraphQLDefinition
  sig { returns(T.any(Class, Module)) }
  def of_type(); end
  # sord omit - no YARD type given for "of_type", using T.untyped
  sig { params(of_type: T.untyped).returns(Wrapper) }
  def initialize(of_type); end
  sig { void }
  def to_graphql(); end
  sig { void }
  def unwrap(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def ==(other); end
  sig { returns(Schema::NonNull) }
  def to_non_null_type(); end
  sig { returns(Schema::List) }
  def to_list_type(); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  sig { void }
  def to_type_signature(); end
  sig { returns(GraphQL::TypeKinds::TypeKind) }
  def kind(); end
  sig { void }
  def graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def initialize_copy(original); end
end
class Argument
  extend GraphQL::Schema::Member::HasPath
  extend GraphQL::Schema::Member::AcceptsDefinition
  extend GraphQL::Schema::Member::CachedGraphQLDefinition
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { returns(T.any(GraphQL::Schema::Field, Class)) }
  def owner(); end
  sig { returns(Symbol) }
  def prepare(); end
  sig { returns(Symbol) }
  def keyword(); end
  # sord omit - no YARD type given for "required:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "description:", using T.untyped
  # sord omit - no YARD type given for "default_value:", using T.untyped
  # sord omit - no YARD type given for "as:", using T.untyped
  # sord omit - no YARD type given for "camelize:", using T.untyped
  # sord omit - no YARD type given for "prepare:", using T.untyped
  # sord omit - no YARD type given for "owner:", using T.untyped
  sig { params(arg_name: Symbol, type_expr: T.untyped, desc: String, required: T.untyped, type: T.untyped, name: T.untyped, description: T.untyped, default_value: T.untyped, as: T.untyped, camelize: T.untyped, prepare: T.untyped, owner: T.untyped, definition_block: T.untyped).returns(Argument) }
  def initialize(arg_name = nil, type_expr = nil, desc = nil, required:, type: nil, name: nil, description: nil, default_value: NO_DEFAULT, as: nil, camelize: true, prepare: nil, owner:, &definition_block); end
  sig { returns(Object) }
  def default_value(); end
  sig { returns(T::Boolean) }
  def default_value?(); end
  sig { params(value: T.untyped).void }
  def description=(value); end
  # sord omit - no YARD type given for "text", using T.untyped
  sig { params(text: T.untyped).returns(String) }
  def description(text = nil); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def accessible?(context); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def authorized?(obj, ctx); end
  sig { void }
  def to_graphql(); end
  sig { void }
  def type(); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(obj: T.untyped, value: T.untyped).void }
  def prepare_value(obj, value); end
  sig { returns(String) }
  def path(); end
  sig { void }
  def graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def initialize_copy(original); end
end
class Mutation < GraphQL::Schema::Resolver
  include GraphQL::Schema::Resolver::HasPayloadType
  include GraphQL::Schema::Member::HasFields
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped, block: T.untyped).void }
  def self.field(*args, &block); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  sig { void }
  def self.generate_payload_type(); end
  sig { params(new_payload_type: T.nilable(Class)).returns(Class) }
  def self.payload_type(new_payload_type = nil); end
  sig { returns(Class) }
  def self.type(); end
  sig { returns(Class) }
  def self.type_expr(); end
  # sord omit - no YARD type given for "new_class", using T.untyped
  sig { params(new_class: T.untyped).void }
  def self.field_class(new_class = nil); end
  sig { params(new_class: T.nilable(Class)).returns(Class) }
  def self.object_class(new_class = nil); end
  sig { returns(T::Hash[String, GraphQL::Schema::Field]) }
  def self.fields(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Resolver) }
  def initialize(object:, context:); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def resolve_with_support(**args); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).returns(Object) }
  def resolve(**args); end
  # sord warn - early_return_data is probably not a type, but using anyway
  sig { params(args: Hash).returns(T.any(T::Boolean, early_return_data)) }
  def ready?(**args); end
  # sord warn - early_return_data is probably not a type, but using anyway
  sig { params(args: Hash).returns(T.any(T::Boolean, early_return_data)) }
  def authorized?(**args); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def load_arguments(args); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(name: T.untyped, value: T.untyped).void }
  def load_argument(name, value); end
  # sord omit - no YARD type given for "new_method", using T.untyped
  sig { params(new_method: T.untyped).returns(Symbol) }
  def self.resolve_method(new_method = nil); end
  # sord omit - no YARD type given for "new_extras", using T.untyped
  sig { params(new_extras: T.untyped).void }
  def self.extras(new_extras = nil); end
  sig { params(allow_null: T::Boolean).void }
  def self.null(allow_null = nil); end
  # sord omit - no YARD type given for "new_complexity", using T.untyped
  sig { params(new_complexity: T.untyped).returns(T.any(Integer, Proc)) }
  def self.complexity(new_complexity = nil); end
  sig { void }
  def self.field_options(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.argument(name, type, *rest, loads: nil, **kwargs, &block); end
  sig { void }
  def self.arguments_loads_as_type(); end
  sig { void }
  def self.own_arguments_loads_as_type(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def self.argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def self.add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def self.arguments(); end
  sig { params(new_arg_class: Class).void }
  def self.argument_class(new_arg_class = nil); end
  sig { void }
  def self.own_arguments(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { returns(GraphQL::BaseType) }
  def self.to_graphql(); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  sig { returns(String) }
  def path(); end
end
class NonNull < GraphQL::Schema::Wrapper
  sig { void }
  def to_graphql(); end
  sig { returns(GraphQL::TypeKinds::NON_NULL) }
  def kind(); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  sig { void }
  def to_type_signature(); end
  sig { void }
  def inspect(); end
  sig { returns(T.any(Class, Module)) }
  def of_type(); end
  # sord omit - no YARD type given for "of_type", using T.untyped
  sig { params(of_type: T.untyped).returns(Wrapper) }
  def initialize(of_type); end
  sig { void }
  def unwrap(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def ==(other); end
  sig { returns(Schema::NonNull) }
  def to_non_null_type(); end
  sig { returns(Schema::List) }
  def to_list_type(); end
  sig { void }
  def graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def initialize_copy(original); end
end
class Resolver
  extend GraphQL::Schema::Member::HasPath
  extend GraphQL::Schema::Member::GraphQLTypeNames
  include GraphQL::Schema::Member::HasPath
  include GraphQL::Schema::Member::HasArguments
  include GraphQL::Schema::Member::BaseDSLMethods
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Resolver) }
  def initialize(object:, context:); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def resolve_with_support(**args); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).returns(Object) }
  def resolve(**args); end
  # sord warn - early_return_data is probably not a type, but using anyway
  sig { params(args: Hash).returns(T.any(T::Boolean, early_return_data)) }
  def ready?(**args); end
  # sord warn - early_return_data is probably not a type, but using anyway
  sig { params(args: Hash).returns(T.any(T::Boolean, early_return_data)) }
  def authorized?(**args); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def load_arguments(args); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(name: T.untyped, value: T.untyped).void }
  def load_argument(name, value); end
  # sord omit - no YARD type given for "new_method", using T.untyped
  sig { params(new_method: T.untyped).returns(Symbol) }
  def self.resolve_method(new_method = nil); end
  # sord omit - no YARD type given for "new_extras", using T.untyped
  sig { params(new_extras: T.untyped).void }
  def self.extras(new_extras = nil); end
  sig { params(allow_null: T::Boolean).void }
  def self.null(allow_null = nil); end
  # sord omit - no YARD type given for "null:", using T.untyped
  sig { params(new_type: T.nilable(Class), null: T.untyped).returns(Class) }
  def self.type(new_type = nil, null: nil); end
  # sord omit - no YARD type given for "new_complexity", using T.untyped
  sig { params(new_complexity: T.untyped).returns(T.any(Integer, Proc)) }
  def self.complexity(new_complexity = nil); end
  sig { void }
  def self.field_options(); end
  sig { void }
  def self.type_expr(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.argument(name, type, *rest, loads: nil, **kwargs, &block); end
  sig { void }
  def self.arguments_loads_as_type(); end
  sig { void }
  def self.own_arguments_loads_as_type(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def self.argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def self.add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def self.arguments(); end
  sig { params(new_arg_class: Class).void }
  def self.argument_class(new_arg_class = nil); end
  sig { void }
  def self.own_arguments(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { returns(GraphQL::BaseType) }
  def self.to_graphql(); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  sig { returns(String) }
  def path(); end
module HasPayloadType
  sig { params(new_payload_type: T.nilable(Class)).returns(Class) }
  def payload_type(new_payload_type = nil); end
  sig { returns(Class) }
  def type(); end
  sig { returns(Class) }
  def type_expr(); end
  # sord omit - no YARD type given for "new_class", using T.untyped
  sig { params(new_class: T.untyped).void }
  def field_class(new_class = nil); end
  sig { params(new_class: T.nilable(Class)).returns(Class) }
  def object_class(new_class = nil); end
  sig { void }
  def generate_payload_type(); end
end
end
class Directive < GraphQL::Schema::Member
  include GraphQL::Schema::Member::HasArguments
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "new_locations", using T.untyped
  sig { params(new_locations: T.untyped).void }
  def self.locations(*new_locations); end
  # sord omit - no YARD type given for "new_default_directive", using T.untyped
  sig { params(new_default_directive: T.untyped).void }
  def self.default_directive(new_default_directive = nil); end
  sig { void }
  def self.to_graphql(); end
  # sord omit - no YARD type given for "_object", using T.untyped
  # sord omit - no YARD type given for "_arguments", using T.untyped
  # sord omit - no YARD type given for "_context", using T.untyped
  sig { params(_object: T.untyped, _arguments: T.untyped, _context: T.untyped).returns(T::Boolean) }
  def self.include?(_object, _arguments, _context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped).void }
  def self.resolve(object, arguments, context); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def self.argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).returns(GraphQL::Schema::Argument) }
  def self.argument(*args, **kwargs, &block); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def self.add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def self.arguments(); end
  sig { params(new_arg_class: Class).void }
  def self.argument_class(new_arg_class = nil); end
  sig { void }
  def self.own_arguments(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { returns(GraphQL::TypeKinds::TypeKind) }
  def self.kind(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
class Skip < GraphQL::Schema::Directive
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def self.include?(obj, args, ctx); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "new_locations", using T.untyped
  sig { params(new_locations: T.untyped).void }
  def self.locations(*new_locations); end
  # sord omit - no YARD type given for "new_default_directive", using T.untyped
  sig { params(new_default_directive: T.untyped).void }
  def self.default_directive(new_default_directive = nil); end
  sig { void }
  def self.to_graphql(); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped).void }
  def self.resolve(object, arguments, context); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def self.argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).returns(GraphQL::Schema::Argument) }
  def self.argument(*args, **kwargs, &block); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def self.add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def self.arguments(); end
  sig { params(new_arg_class: Class).void }
  def self.argument_class(new_arg_class = nil); end
  sig { void }
  def self.own_arguments(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { returns(GraphQL::TypeKinds::TypeKind) }
  def self.kind(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Feature < GraphQL::Schema::Directive
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.include?(object, arguments, context); end
  sig { params(flag_name: String, object: GraphQL::Schema::Objct, context: GraphQL::Query::Context).returns(T::Boolean) }
  def self.enabled?(flag_name, object, context); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "new_locations", using T.untyped
  sig { params(new_locations: T.untyped).void }
  def self.locations(*new_locations); end
  # sord omit - no YARD type given for "new_default_directive", using T.untyped
  sig { params(new_default_directive: T.untyped).void }
  def self.default_directive(new_default_directive = nil); end
  sig { void }
  def self.to_graphql(); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped).void }
  def self.resolve(object, arguments, context); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def self.argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).returns(GraphQL::Schema::Argument) }
  def self.argument(*args, **kwargs, &block); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def self.add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def self.arguments(); end
  sig { params(new_arg_class: Class).void }
  def self.argument_class(new_arg_class = nil); end
  sig { void }
  def self.own_arguments(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { returns(GraphQL::TypeKinds::TypeKind) }
  def self.kind(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Include < GraphQL::Schema::Directive
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def self.include?(obj, args, ctx); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "new_locations", using T.untyped
  sig { params(new_locations: T.untyped).void }
  def self.locations(*new_locations); end
  # sord omit - no YARD type given for "new_default_directive", using T.untyped
  sig { params(new_default_directive: T.untyped).void }
  def self.default_directive(new_default_directive = nil); end
  sig { void }
  def self.to_graphql(); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped).void }
  def self.resolve(object, arguments, context); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def self.argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).returns(GraphQL::Schema::Argument) }
  def self.argument(*args, **kwargs, &block); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def self.add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def self.arguments(); end
  sig { params(new_arg_class: Class).void }
  def self.argument_class(new_arg_class = nil); end
  sig { void }
  def self.own_arguments(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { returns(GraphQL::TypeKinds::TypeKind) }
  def self.kind(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Transform < GraphQL::Schema::Directive
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped).void }
  def self.resolve(object, arguments, context); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "new_locations", using T.untyped
  sig { params(new_locations: T.untyped).void }
  def self.locations(*new_locations); end
  # sord omit - no YARD type given for "new_default_directive", using T.untyped
  sig { params(new_default_directive: T.untyped).void }
  def self.default_directive(new_default_directive = nil); end
  sig { void }
  def self.to_graphql(); end
  # sord omit - no YARD type given for "_object", using T.untyped
  # sord omit - no YARD type given for "_arguments", using T.untyped
  # sord omit - no YARD type given for "_context", using T.untyped
  sig { params(_object: T.untyped, _arguments: T.untyped, _context: T.untyped).returns(T::Boolean) }
  def self.include?(_object, _arguments, _context); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def self.argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).returns(GraphQL::Schema::Argument) }
  def self.argument(*args, **kwargs, &block); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def self.add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def self.arguments(); end
  sig { params(new_arg_class: Class).void }
  def self.argument_class(new_arg_class = nil); end
  sig { void }
  def self.own_arguments(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { returns(GraphQL::TypeKinds::TypeKind) }
  def self.kind(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
end
module Interface
  extend GraphQL::Schema::Member::GraphQLTypeNames
  include GraphQL::Schema::Interface::DefinitionMethods
  include GraphQL::Schema::Member::AcceptsDefinition
  sig { void }
  def unwrap(); end
  sig { params(block: T.untyped).void }
  def self.definition_methods(&block); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.included(child_class); end
  # sord omit - no YARD type given for "types", using T.untyped
  sig { params(types: T.untyped).void }
  def self.orphan_types(*types); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.interfaces(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  sig { returns(T::Hash[String, GraphQL::Schema::Field]) }
  def self.fields(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
module DefinitionMethods
  extend GraphQL::Schema::Member::Scoped
  extend GraphQL::Schema::Member::RelayShortcuts
  extend GraphQL::Schema::Member::HasPath
  extend GraphQL::Schema::Member::HasFields
  extend GraphQL::Schema::Member::TypeSystemHelpers
  extend GraphQL::Schema::Member::BaseDSLMethods
  extend GraphQL::Relay::TypeExtensions
  extend GraphQL::Schema::Member::CachedGraphQLDefinition
  sig { params(block: T.untyped).void }
  def definition_methods(&block); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def accessible?(context); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def included(child_class); end
  # sord omit - no YARD type given for "types", using T.untyped
  sig { params(types: T.untyped).void }
  def orphan_types(*types); end
  sig { void }
  def to_graphql(); end
  sig { void }
  def kind(); end
  sig { void }
  def own_interfaces(); end
  sig { void }
  def interfaces(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def scope_items(items, context); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def edge_type(); end
  sig { void }
  def connection_type(); end
  sig { returns(String) }
  def path(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def field(*args, **kwargs, &block); end
  sig { returns(T::Hash[String, GraphQL::Schema::Field]) }
  def fields(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def own_fields(); end
  sig { returns(Schema::NonNull) }
  def to_non_null_type(); end
  sig { returns(Schema::List) }
  def to_list_type(); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  sig { void }
  def to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def mutation(mutation_class = nil); end
  sig { void }
  def unwrap(); end
  sig { void }
  def overridden_graphql_name(); end
  sig { void }
  def default_graphql_name(); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
  sig { void }
  def graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def initialize_copy(original); end
end
end
module NullMask
  # sord omit - no YARD type given for "member", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(member: T.untyped, ctx: T.untyped).void }
  def self.call(member, ctx); end
end
class Traversal
  # sord warn - "Hash<String => GraphQL::BaseType]" does not appear to be a type
  sig { returns(SORD_ERROR_HashStringGraphQLBaseType) }
  def type_map(); end
  sig { returns(T::Hash[String, T::Hash[String, GraphQL::Field]]) }
  def instrumented_field_map(); end
  # sord warn - "Hash<String => Array<GraphQL::Field || GraphQL::Argument || GraphQL::Directive>]" does not appear to be a type
  sig { returns(SORD_ERROR_HashStringArrayGraphQLFieldGraphQLArgumentGraphQLDirective) }
  def type_reference_map(); end
  # sord warn - "Hash<String => Array<GraphQL::BaseType>]" does not appear to be a type
  sig { returns(SORD_ERROR_HashStringArrayGraphQLBaseType) }
  def union_memberships(); end
  # sord omit - no YARD type given for "introspection:", using T.untyped
  sig { params(schema: GraphQL::Schema, introspection: T.untyped).returns(Traversal) }
  def initialize(schema, introspection: true); end
  sig { void }
  def resolve_late_bound_fields(); end
  # sord omit - no YARD type given for "late_bound_type", using T.untyped
  # sord omit - no YARD type given for "resolved_inner_type", using T.untyped
  sig { params(late_bound_type: T.untyped, resolved_inner_type: T.untyped).void }
  def rewrap_resolved_type(late_bound_type, resolved_inner_type); end
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "member", using T.untyped
  # sord omit - no YARD type given for "context_description", using T.untyped
  sig { params(schema: T.untyped, member: T.untyped, context_description: T.untyped).void }
  def visit(schema, member, context_description); end
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(schema: T.untyped, type_defn: T.untyped).void }
  def visit_fields(schema, type_defn); end
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "type_defn", using T.untyped
  # sord omit - no YARD type given for "field_defn", using T.untyped
  # sord omit - no YARD type given for "dynamic_field:", using T.untyped
  sig { params(schema: T.untyped, type_defn: T.untyped, field_defn: T.untyped, dynamic_field: T.untyped).void }
  def visit_field_on_type(schema, type_defn, field_defn, dynamic_field: false); end
  # sord omit - no YARD type given for "member", using T.untyped
  # sord omit - no YARD type given for "context_description", using T.untyped
  sig { params(member: T.untyped, context_description: T.untyped).void }
  def validate_type(member, context_description); end
end
class EnumValue < GraphQL::Schema::Member
  extend GraphQL::Schema::Member::HasPath
  extend GraphQL::Schema::Member::AcceptsDefinition
  sig { void }
  def graphql_name(); end
  sig { returns(Class) }
  def owner(); end
  sig { returns(String) }
  def deprecation_reason(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def deprecation_reason=(value); end
  # sord omit - no YARD type given for "graphql_name", using T.untyped
  # sord omit - no YARD type given for "desc", using T.untyped
  # sord omit - no YARD type given for "owner:", using T.untyped
  # sord omit - no YARD type given for "description:", using T.untyped
  # sord omit - no YARD type given for "value:", using T.untyped
  # sord omit - no YARD type given for "deprecation_reason:", using T.untyped
  sig { params(graphql_name: T.untyped, desc: T.untyped, owner: T.untyped, description: T.untyped, value: T.untyped, deprecation_reason: T.untyped, block: T.untyped).returns(EnumValue) }
  def initialize(graphql_name, desc = nil, owner:, description: nil, value: nil, deprecation_reason: nil, &block); end
  # sord omit - no YARD type given for "new_desc", using T.untyped
  sig { params(new_desc: T.untyped).void }
  def description(new_desc = nil); end
  # sord omit - no YARD type given for "new_val", using T.untyped
  sig { params(new_val: T.untyped).void }
  def value(new_val = nil); end
  sig { returns(GraphQL::EnumType::EnumValue) }
  def to_graphql(); end
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(_ctx: T.untyped).returns(T::Boolean) }
  def visible?(_ctx); end
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(_ctx: T.untyped).returns(T::Boolean) }
  def accessible?(_ctx); end
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(_ctx: T.untyped).returns(T::Boolean) }
  def authorized?(_ctx); end
  sig { returns(String) }
  def path(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { returns(GraphQL::TypeKinds::TypeKind) }
  def self.kind(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { returns(GraphQL::BaseType) }
  def self.to_graphql(); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Validation
  sig { params(object: Object).returns(T.any(String, Nil)) }
  def self.validate(object); end
module Rules
  sig { params(property_name: Symbol, allowed_classes: Class).returns(Proc) }
  def self.assert_property(property_name, *allowed_classes); end
  sig { params(property_name: Symbol, from_class: Class, to_class: Class).returns(Proc) }
  def self.assert_property_mapping(property_name, from_class, to_class); end
  sig { params(property_name: Symbol, list_member_class: Class).returns(Proc) }
  def self.assert_property_list_of(property_name, list_member_class); end
  # sord omit - no YARD type given for "item_name", using T.untyped
  # sord omit - no YARD type given for "get_items_proc", using T.untyped
  sig { params(item_name: T.untyped, get_items_proc: T.untyped).void }
  def self.assert_named_items_are_valid(item_name, get_items_proc); end
end
end
class InputObject < GraphQL::Schema::Member
  extend GraphQL::Dig
  include GraphQL::Schema::Member::HasArguments
  include Forwardable
  include GraphQL::Schema::Member::AcceptsDefinition
  # sord omit - no YARD type given for "values", using T.untyped
  # sord omit - no YARD type given for "ruby_kwargs:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "defaults_used:", using T.untyped
  sig { params(values: T.untyped, ruby_kwargs: T.untyped, context: T.untyped, defaults_used: T.untyped).returns(InputObject) }
  def initialize(values = nil, ruby_kwargs: nil, context:, defaults_used:); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { returns(GraphQL::Query::Arguments) }
  def arguments(); end
  sig { void }
  def to_h(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def unwrap_value(value); end
  sig { params(key: T.any(Symbol, String)).void }
  def [](key); end
  # sord omit - no YARD type given for "key", using T.untyped
  sig { params(key: T.untyped).returns(T::Boolean) }
  def key?(key); end
  sig { void }
  def to_kwargs(); end
  # sord warn - unsupported generic type "Class" in "Class<GraphQL::Arguments>"
  sig { returns(SORD_ERROR_Class) }
  def self.arguments_class(); end
  # sord warn - unsupported generic type "Class" in "Class<GraphQL::Arguments>"
  # sord infer - inferred type of parameter "value" as SORD_ERROR_Class using getter's return type
  # sord warn - unsupported generic type "Class" in "Class<GraphQL::Arguments>"
  sig { params(value: SORD_ERROR_Class).returns(SORD_ERROR_Class) }
  def self.arguments_class=(value); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.argument(name, type, *rest, loads: nil, **kwargs, &block); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def self.argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def self.add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def self.arguments(); end
  sig { params(new_arg_class: Class).void }
  def self.argument_class(new_arg_class = nil); end
  sig { void }
  def self.own_arguments(); end
  # sord omit - no YARD type given for "own_key", using T.untyped
  # sord omit - no YARD type given for "rest_keys", using T.untyped
  sig { params(own_key: T.untyped, rest_keys: T.untyped).returns(Object) }
  def dig(own_key, *rest_keys); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Subscription < GraphQL::Schema::Resolver
  include GraphQL::Schema::Member::HasFields
  include GraphQL::Schema::Resolver::HasPayloadType
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Subscription) }
  def initialize(object:, context:); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def resolve(**args); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def resolve_subscribe(args); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def subscribe(args = {}); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def resolve_update(args); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def update(args = {}); end
  # sord omit - no YARD type given for "err", using T.untyped
  sig { params(err: T.untyped).void }
  def load_application_object_failed(err); end
  sig { void }
  def unsubscribe(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  sig { returns(T::Hash[String, GraphQL::Schema::Field]) }
  def self.fields(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { params(new_payload_type: T.nilable(Class)).returns(Class) }
  def self.payload_type(new_payload_type = nil); end
  sig { returns(Class) }
  def self.type(); end
  sig { returns(Class) }
  def self.type_expr(); end
  sig { params(new_class: T.nilable(Class)).returns(Class) }
  def self.object_class(new_class = nil); end
  sig { void }
  def self.generate_payload_type(); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def resolve_with_support(**args); end
  # sord warn - early_return_data is probably not a type, but using anyway
  sig { params(args: Hash).returns(T.any(T::Boolean, early_return_data)) }
  def ready?(**args); end
  # sord warn - early_return_data is probably not a type, but using anyway
  sig { params(args: Hash).returns(T.any(T::Boolean, early_return_data)) }
  def authorized?(**args); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def load_arguments(args); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(name: T.untyped, value: T.untyped).void }
  def load_argument(name, value); end
  # sord omit - no YARD type given for "new_method", using T.untyped
  sig { params(new_method: T.untyped).returns(Symbol) }
  def self.resolve_method(new_method = nil); end
  # sord omit - no YARD type given for "new_extras", using T.untyped
  sig { params(new_extras: T.untyped).void }
  def self.extras(new_extras = nil); end
  sig { params(allow_null: T::Boolean).void }
  def self.null(allow_null = nil); end
  # sord omit - no YARD type given for "new_complexity", using T.untyped
  sig { params(new_complexity: T.untyped).returns(T.any(Integer, Proc)) }
  def self.complexity(new_complexity = nil); end
  sig { void }
  def self.field_options(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.argument(name, type, *rest, loads: nil, **kwargs, &block); end
  sig { void }
  def self.arguments_loads_as_type(); end
  sig { void }
  def self.own_arguments_loads_as_type(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def self.argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def self.add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def self.arguments(); end
  sig { params(new_arg_class: Class).void }
  def self.argument_class(new_arg_class = nil); end
  sig { void }
  def self.own_arguments(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { returns(GraphQL::BaseType) }
  def self.to_graphql(); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  sig { returns(String) }
  def path(); end
class EarlyTerminationError < StandardError
end
class UnsubscribedError < GraphQL::Schema::Subscription::EarlyTerminationError
end
class NoUpdateError < GraphQL::Schema::Subscription::EarlyTerminationError
end
end
class PossibleTypes
  # sord omit - no YARD type given for "schema", using T.untyped
  sig { params(schema: T.untyped).returns(PossibleTypes) }
  def initialize(schema); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(type_defn: T.untyped).void }
  def possible_types(type_defn); end
end
module Base64Encoder
  # sord omit - no YARD type given for "unencoded_text", using T.untyped
  # sord omit - no YARD type given for "nonce:", using T.untyped
  sig { params(unencoded_text: T.untyped, nonce: T.untyped).void }
  def self.encode(unencoded_text, nonce: false); end
  # sord omit - no YARD type given for "encoded_text", using T.untyped
  # sord omit - no YARD type given for "nonce:", using T.untyped
  sig { params(encoded_text: T.untyped, nonce: T.untyped).void }
  def self.decode(encoded_text, nonce: false); end
end
class FieldExtension
  sig { returns(GraphQL::Schema::Field) }
  def field(); end
  sig { returns(Object) }
  def options(); end
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "options:", using T.untyped
  sig { params(field: T.untyped, options: T.untyped).returns(FieldExtension) }
  def initialize(field:, options:); end
  sig { void }
  def apply(); end
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped).returns(Object) }
  def resolve(object:, arguments:, context:); end
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "value:", using T.untyped
  # sord omit - no YARD type given for "memo:", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped, value: T.untyped, memo: T.untyped).returns(Object) }
  def after_resolve(object:, arguments:, context:, value:, memo:); end
end
class LateBoundType
  sig { void }
  def name(); end
  # sord omit - no YARD type given for "local_name", using T.untyped
  sig { params(local_name: T.untyped).returns(LateBoundType) }
  def initialize(local_name); end
  sig { void }
  def unwrap(); end
  sig { void }
  def to_non_null_type(); end
  sig { void }
  def to_list_type(); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_s(); end
end
module TypeExpression
  sig { params(types: GraphQL::Schema::TypeMap, ast_node: GraphQL::Language::Nodes::AbstractNode).returns(T.nilable(GraphQL::BaseType)) }
  def self.build_type(types, ast_node); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "wrapper", using T.untyped
  sig { params(type: T.untyped, wrapper: T.untyped).void }
  def self.wrap_type(type, wrapper); end
end
class MiddlewareChain
  include Forwardable
  # sord warn - "#call(*args)" does not appear to be a type
  sig { returns(T::Array[SORD_ERROR_callargs]) }
  def steps(); end
  # sord warn - "#call(*args)" does not appear to be a type
  sig { returns(T::Array[SORD_ERROR_callargs]) }
  def final_step(); end
  # sord omit - no YARD type given for "steps:", using T.untyped
  # sord omit - no YARD type given for "final_step:", using T.untyped
  sig { params(steps: T.untyped, final_step: T.untyped).returns(MiddlewareChain) }
  def initialize(steps: [], final_step: nil); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  # sord omit - no YARD type given for "callable", using T.untyped
  sig { params(callable: T.untyped).void }
  def <<(callable); end
  # sord omit - no YARD type given for "callable", using T.untyped
  sig { params(callable: T.untyped).void }
  def push(callable); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def ==(other); end
  # sord omit - no YARD type given for "arguments", using T.untyped
  sig { params(arguments: T.untyped).void }
  def invoke(arguments); end
  # sord omit - no YARD type given for "callables", using T.untyped
  sig { params(callables: T.untyped).void }
  def concat(callables); end
  # sord omit - no YARD type given for "index", using T.untyped
  # sord omit - no YARD type given for "arguments", using T.untyped
  sig { params(index: T.untyped, arguments: T.untyped).void }
  def invoke_core(index, arguments); end
  # sord omit - no YARD type given for "callable", using T.untyped
  sig { params(callable: T.untyped).void }
  def add_middleware(callable); end
  # sord omit - no YARD type given for "callable", using T.untyped
  sig { params(callable: T.untyped).void }
  def wrap(callable); end
class MiddlewareWrapper
  sig { void }
  def callable(); end
  # sord omit - no YARD type given for "callable", using T.untyped
  sig { params(callable: T.untyped).returns(MiddlewareWrapper) }
  def initialize(callable); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped, next_middleware: T.untyped).void }
  def call(*args, &next_middleware); end
end
end
class RescueMiddleware
  sig { returns(Hash) }
  def rescue_table(); end
  sig { returns(RescueMiddleware) }
  def initialize(); end
  sig { params(error_classes: Class, block: T.untyped).void }
  def rescue_from(*error_classes, &block); end
  # sord omit - no YARD type given for "error_classes", using T.untyped
  sig { params(error_classes: T.untyped).void }
  def remove_handler(*error_classes); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def call(*args); end
  # sord omit - no YARD type given for "err", using T.untyped
  sig { params(err: T.untyped).void }
  def attempt_rescue(err); end
end
module DefaultTypeError
  # sord omit - no YARD type given for "type_error", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(type_error: T.untyped, ctx: T.untyped).void }
  def self.call(type_error, ctx); end
end
class InvalidTypeError < GraphQL::Error
end
class TimeoutMiddleware
  # sord omit - no YARD type given for "max_seconds:", using T.untyped
  # sord omit - no YARD type given for "context_key:", using T.untyped
  sig { params(max_seconds: T.untyped, context_key: T.untyped, block: T.untyped).returns(TimeoutMiddleware) }
  def initialize(max_seconds:, context_key: nil, &block); end
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "parent_object", using T.untyped
  # sord omit - no YARD type given for "field_definition", using T.untyped
  # sord omit - no YARD type given for "field_args", using T.untyped
  # sord omit - no YARD type given for "query_context", using T.untyped
  sig { params(parent_type: T.untyped, parent_object: T.untyped, field_definition: T.untyped, field_args: T.untyped, query_context: T.untyped).void }
  def call(parent_type, parent_object, field_definition, field_args, query_context); end
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "parent_object", using T.untyped
  # sord omit - no YARD type given for "field_definition", using T.untyped
  # sord omit - no YARD type given for "field_args", using T.untyped
  # sord omit - no YARD type given for "field_context", using T.untyped
  sig { params(parent_type: T.untyped, parent_object: T.untyped, field_definition: T.untyped, field_args: T.untyped, field_context: T.untyped).returns(GraphQL::Schema::TimeoutMiddleware::TimeoutError) }
  def on_timeout(parent_type, parent_object, field_definition, field_args, field_context); end
class TimeoutQueryProxy < SimpleDelegator
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(query: T.untyped, ctx: T.untyped).returns(TimeoutQueryProxy) }
  def initialize(query, ctx); end
  sig { void }
  def context(); end
end
class TimeoutError < GraphQL::ExecutionError
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "field_defn", using T.untyped
  sig { params(parent_type: T.untyped, field_defn: T.untyped).returns(TimeoutError) }
  def initialize(parent_type, field_defn); end
  sig { returns(GraphQL::Language::Nodes::Field) }
  def ast_node(); end
  # sord infer - inferred type of parameter "value" as GraphQL::Language::Nodes::Field using getter's return type
  sig { params(value: GraphQL::Language::Nodes::Field).returns(GraphQL::Language::Nodes::Field) }
  def ast_node=(value); end
  sig { returns(String) }
  def path(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def path=(value); end
  sig { returns(Hash) }
  def options(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def options=(value); end
  sig { returns(Hash) }
  def extensions(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def extensions=(value); end
  sig { returns(Hash) }
  def to_h(); end
end
end
module UniqueWithinType
  sig { void }
  def self.default_id_separator(); end
  sig { params(value: T.untyped).void }
  def self.default_id_separator=(value); end
  # sord omit - no YARD type given for "separator:", using T.untyped
  sig { params(type_name: String, object_value: Any, separator: T.untyped).returns(String) }
  def encode(type_name, object_value, separator: self.default_id_separator); end
  # sord omit - no YARD type given for "separator:", using T.untyped
  sig { params(type_name: String, object_value: Any, separator: T.untyped).returns(String) }
  def self.encode(type_name, object_value, separator: self.default_id_separator); end
  # sord omit - no YARD type given for "separator:", using T.untyped
  # sord warn - "(String" does not appear to be a type
  # sord warn - "String)" does not appear to be a type
  sig { params(node_id: String, separator: T.untyped).returns(T::Array[T.any(SORD_ERROR_String, SORD_ERROR_String)]) }
  def decode(node_id, separator: self.default_id_separator); end
  # sord omit - no YARD type given for "separator:", using T.untyped
  # sord warn - "(String" does not appear to be a type
  # sord warn - "String)" does not appear to be a type
  sig { params(node_id: String, separator: T.untyped).returns(T::Array[T.any(SORD_ERROR_String, SORD_ERROR_String)]) }
  def self.decode(node_id, separator: self.default_id_separator); end
end
module CatchallMiddleware
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "parent_object", using T.untyped
  # sord omit - no YARD type given for "field_definition", using T.untyped
  # sord omit - no YARD type given for "field_args", using T.untyped
  # sord omit - no YARD type given for "query_context", using T.untyped
  sig { params(parent_type: T.untyped, parent_object: T.untyped, field_definition: T.untyped, field_args: T.untyped, query_context: T.untyped).void }
  def self.call(parent_type, parent_object, field_definition, field_args, query_context); end
end
module DefaultParseError
  # sord omit - no YARD type given for "parse_error", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(parse_error: T.untyped, ctx: T.untyped).void }
  def self.call(parse_error, ctx); end
end
class IntrospectionSystem
  sig { void }
  def schema_type(); end
  sig { void }
  def type_type(); end
  sig { void }
  def typename_field(); end
  # sord omit - no YARD type given for "schema", using T.untyped
  sig { params(schema: T.untyped).returns(IntrospectionSystem) }
  def initialize(schema); end
  sig { void }
  def object_types(); end
  sig { void }
  def entry_points(); end
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(name: T.untyped).void }
  def entry_point(name:); end
  sig { void }
  def dynamic_fields(); end
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(name: T.untyped).void }
  def dynamic_field(name:); end
  # sord omit - no YARD type given for "class_name", using T.untyped
  sig { params(class_name: T.untyped).void }
  def load_constant(class_name); end
  # sord omit - no YARD type given for "class_sym:", using T.untyped
  sig { params(class_sym: T.untyped).void }
  def get_fields_from_class(class_sym:); end
class PerFieldProxyResolve
  # sord omit - no YARD type given for "object_class:", using T.untyped
  # sord omit - no YARD type given for "inner_resolve:", using T.untyped
  sig { params(object_class: T.untyped, inner_resolve: T.untyped).returns(PerFieldProxyResolve) }
  def initialize(object_class:, inner_resolve:); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
end
end
module BuildFromDefinition
  # sord omit - no YARD type given for "definition_string", using T.untyped
  # sord omit - no YARD type given for "default_resolve:", using T.untyped
  # sord omit - no YARD type given for "parser:", using T.untyped
  sig { params(definition_string: T.untyped, default_resolve: T.untyped, parser: T.untyped).void }
  def self.from_definition(definition_string, default_resolve:, parser: DefaultParser); end
module DefaultResolve
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(type: T.untyped, field: T.untyped, obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def self.call(type, field, obj, args, ctx); end
end
module Builder
  include GraphQL::Schema::BuildFromDefinition::Builder
  # sord omit - no YARD type given for "document", using T.untyped
  # sord omit - no YARD type given for "default_resolve:", using T.untyped
  sig { params(document: T.untyped, default_resolve: T.untyped).void }
  def build(document, default_resolve: DefaultResolve); end
  # sord omit - no YARD type given for "enum_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(enum_type_definition: T.untyped, type_resolver: T.untyped).void }
  def build_enum_type(enum_type_definition, type_resolver); end
  # sord omit - no YARD type given for "directives", using T.untyped
  sig { params(directives: T.untyped).void }
  def build_deprecation_reason(directives); end
  # sord omit - no YARD type given for "scalar_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  # sord omit - no YARD type given for "default_resolve:", using T.untyped
  sig { params(scalar_type_definition: T.untyped, type_resolver: T.untyped, default_resolve: T.untyped).void }
  def build_scalar_type(scalar_type_definition, type_resolver, default_resolve:); end
  # sord omit - no YARD type given for "union_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(union_type_definition: T.untyped, type_resolver: T.untyped).void }
  def build_union_type(union_type_definition, type_resolver); end
  # sord omit - no YARD type given for "object_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  # sord omit - no YARD type given for "default_resolve:", using T.untyped
  sig { params(object_type_definition: T.untyped, type_resolver: T.untyped, default_resolve: T.untyped).void }
  def build_object_type(object_type_definition, type_resolver, default_resolve:); end
  # sord omit - no YARD type given for "input_object_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(input_object_type_definition: T.untyped, type_resolver: T.untyped).void }
  def build_input_object_type(input_object_type_definition, type_resolver); end
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(default_value: T.untyped).void }
  def build_default_value(default_value); end
  # sord omit - no YARD type given for "input_object_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(input_object_type_definition: T.untyped, type_resolver: T.untyped).void }
  def build_input_arguments(input_object_type_definition, type_resolver); end
  # sord omit - no YARD type given for "directive_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(directive_definition: T.untyped, type_resolver: T.untyped).void }
  def build_directive(directive_definition, type_resolver); end
  # sord omit - no YARD type given for "directive_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(directive_definition: T.untyped, type_resolver: T.untyped).void }
  def build_directive_arguments(directive_definition, type_resolver); end
  # sord omit - no YARD type given for "interface_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(interface_type_definition: T.untyped, type_resolver: T.untyped).void }
  def build_interface_type(interface_type_definition, type_resolver); end
  # sord omit - no YARD type given for "field_definitions", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  # sord omit - no YARD type given for "default_resolve:", using T.untyped
  sig { params(field_definitions: T.untyped, type_resolver: T.untyped, default_resolve: T.untyped).void }
  def build_fields(field_definitions, type_resolver, default_resolve:); end
  # sord omit - no YARD type given for "types", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(types: T.untyped, ast_node: T.untyped).void }
  def resolve_type(types, ast_node); end
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(type: T.untyped).void }
  def resolve_type_name(type); end
  # sord omit - no YARD type given for "document", using T.untyped
  # sord omit - no YARD type given for "default_resolve:", using T.untyped
  sig { params(document: T.untyped, default_resolve: T.untyped).void }
  def self.build(document, default_resolve: DefaultResolve); end
  # sord omit - no YARD type given for "enum_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(enum_type_definition: T.untyped, type_resolver: T.untyped).void }
  def self.build_enum_type(enum_type_definition, type_resolver); end
  # sord omit - no YARD type given for "directives", using T.untyped
  sig { params(directives: T.untyped).void }
  def self.build_deprecation_reason(directives); end
  # sord omit - no YARD type given for "scalar_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  # sord omit - no YARD type given for "default_resolve:", using T.untyped
  sig { params(scalar_type_definition: T.untyped, type_resolver: T.untyped, default_resolve: T.untyped).void }
  def self.build_scalar_type(scalar_type_definition, type_resolver, default_resolve:); end
  # sord omit - no YARD type given for "union_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(union_type_definition: T.untyped, type_resolver: T.untyped).void }
  def self.build_union_type(union_type_definition, type_resolver); end
  # sord omit - no YARD type given for "object_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  # sord omit - no YARD type given for "default_resolve:", using T.untyped
  sig { params(object_type_definition: T.untyped, type_resolver: T.untyped, default_resolve: T.untyped).void }
  def self.build_object_type(object_type_definition, type_resolver, default_resolve:); end
  # sord omit - no YARD type given for "input_object_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(input_object_type_definition: T.untyped, type_resolver: T.untyped).void }
  def self.build_input_object_type(input_object_type_definition, type_resolver); end
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(default_value: T.untyped).void }
  def self.build_default_value(default_value); end
  # sord omit - no YARD type given for "input_object_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(input_object_type_definition: T.untyped, type_resolver: T.untyped).void }
  def self.build_input_arguments(input_object_type_definition, type_resolver); end
  # sord omit - no YARD type given for "directive_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(directive_definition: T.untyped, type_resolver: T.untyped).void }
  def self.build_directive(directive_definition, type_resolver); end
  # sord omit - no YARD type given for "directive_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(directive_definition: T.untyped, type_resolver: T.untyped).void }
  def self.build_directive_arguments(directive_definition, type_resolver); end
  # sord omit - no YARD type given for "interface_type_definition", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  sig { params(interface_type_definition: T.untyped, type_resolver: T.untyped).void }
  def self.build_interface_type(interface_type_definition, type_resolver); end
  # sord omit - no YARD type given for "field_definitions", using T.untyped
  # sord omit - no YARD type given for "type_resolver", using T.untyped
  # sord omit - no YARD type given for "default_resolve:", using T.untyped
  sig { params(field_definitions: T.untyped, type_resolver: T.untyped, default_resolve: T.untyped).void }
  def self.build_fields(field_definitions, type_resolver, default_resolve:); end
  # sord omit - no YARD type given for "types", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(types: T.untyped, ast_node: T.untyped).void }
  def self.resolve_type(types, ast_node); end
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(type: T.untyped).void }
  def self.resolve_type_name(type); end
end
class ResolveMap
  # sord omit - no YARD type given for "user_resolve_hash", using T.untyped
  sig { params(user_resolve_hash: T.untyped).returns(ResolveMap) }
  def initialize(user_resolve_hash); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(type: T.untyped, field: T.untyped, obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(type, field, obj, args, ctx); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(type: T.untyped, value: T.untyped, ctx: T.untyped).void }
  def coerce_input(type, value, ctx); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(type: T.untyped, value: T.untyped, ctx: T.untyped).void }
  def coerce_result(type, value, ctx); end
class DefaultResolve
  # sord omit - no YARD type given for "field_map", using T.untyped
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_map: T.untyped, field_name: T.untyped).returns(DefaultResolve) }
  def initialize(field_map, field_name); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
end
end
end
class RelayClassicMutation < GraphQL::Schema::Mutation
  # sord omit - no YARD type given for "inputs", using T.untyped
  sig { params(inputs: T.untyped).void }
  def resolve_with_support(**inputs); end
  sig { params(new_class: Class).returns(Class) }
  def self.input_object_class(new_class = nil); end
  sig { params(new_input_type: T.nilable(Class)).returns(Class) }
  def self.input_type(new_input_type = nil); end
  sig { void }
  def self.field_options(); end
  sig { returns(Class) }
  def self.generate_input_type(); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped, block: T.untyped).void }
  def self.field(*args, &block); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  sig { void }
  def self.generate_payload_type(); end
  sig { params(new_payload_type: T.nilable(Class)).returns(Class) }
  def self.payload_type(new_payload_type = nil); end
  sig { returns(Class) }
  def self.type(); end
  sig { returns(Class) }
  def self.type_expr(); end
  # sord omit - no YARD type given for "new_class", using T.untyped
  sig { params(new_class: T.untyped).void }
  def self.field_class(new_class = nil); end
  sig { params(new_class: T.nilable(Class)).returns(Class) }
  def self.object_class(new_class = nil); end
  sig { returns(T::Hash[String, GraphQL::Schema::Field]) }
  def self.fields(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Resolver) }
  def initialize(object:, context:); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).returns(Object) }
  def resolve(**args); end
  # sord warn - early_return_data is probably not a type, but using anyway
  sig { params(args: Hash).returns(T.any(T::Boolean, early_return_data)) }
  def ready?(**args); end
  # sord warn - early_return_data is probably not a type, but using anyway
  sig { params(args: Hash).returns(T.any(T::Boolean, early_return_data)) }
  def authorized?(**args); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def load_arguments(args); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(name: T.untyped, value: T.untyped).void }
  def load_argument(name, value); end
  # sord omit - no YARD type given for "new_method", using T.untyped
  sig { params(new_method: T.untyped).returns(Symbol) }
  def self.resolve_method(new_method = nil); end
  # sord omit - no YARD type given for "new_extras", using T.untyped
  sig { params(new_extras: T.untyped).void }
  def self.extras(new_extras = nil); end
  sig { params(allow_null: T::Boolean).void }
  def self.null(allow_null = nil); end
  # sord omit - no YARD type given for "new_complexity", using T.untyped
  sig { params(new_complexity: T.untyped).returns(T.any(Integer, Proc)) }
  def self.complexity(new_complexity = nil); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.argument(name, type, *rest, loads: nil, **kwargs, &block); end
  sig { void }
  def self.arguments_loads_as_type(); end
  sig { void }
  def self.own_arguments_loads_as_type(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def self.argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def self.add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def self.arguments(); end
  sig { params(new_arg_class: Class).void }
  def self.argument_class(new_arg_class = nil); end
  sig { void }
  def self.own_arguments(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { returns(GraphQL::BaseType) }
  def self.to_graphql(); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  sig { returns(String) }
  def path(); end
end
end
class Railtie < Rails::Railtie
end
module Tracing
  # sord warn - "<#trace(key, metadata)>" does not appear to be a type
  sig { params(tracer: SORD_ERROR_tracekeymetadata).void }
  def self.install(tracer); end
  # sord omit - no YARD type given for "tracer", using T.untyped
  sig { params(tracer: T.untyped).void }
  def self.uninstall(tracer); end
  sig { void }
  def self.tracers(); end
module Traceable
  sig { params(key: String, metadata: Hash).returns(Object) }
  def trace(key, metadata); end
  sig { params(idx: Integer, key: String, metadata: Object).returns(T.untyped) }
  def call_tracers(idx, key, metadata); end
end
module NullTracer
  # sord omit - no YARD type given for "k", using T.untyped
  # sord omit - no YARD type given for "v", using T.untyped
  sig { params(k: T.untyped, v: T.untyped).void }
  def trace(k, v); end
  # sord omit - no YARD type given for "k", using T.untyped
  # sord omit - no YARD type given for "v", using T.untyped
  sig { params(k: T.untyped, v: T.untyped).void }
  def self.trace(k, v); end
end
class ScoutTracing < GraphQL::Tracing::PlatformTracing
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(options: T.untyped).returns(ScoutTracing) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "platform_key", using T.untyped
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(platform_key: T.untyped, key: T.untyped, data: T.untyped).void }
  def platform_trace(platform_key, key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def platform_field_key(type, field); end
  sig { void }
  def self.platform_keys(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def self.platform_keys=(value); end
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(key: T.untyped, data: T.untyped).void }
  def trace(key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def instrument(type, field); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def trace_field(type, field); end
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(schema_defn: T.untyped, options: T.untyped).void }
  def self.use(schema_defn, options = {}); end
  sig { void }
  def options(); end
end
class DataDogTracing < GraphQL::Tracing::PlatformTracing
  # sord omit - no YARD type given for "platform_key", using T.untyped
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(platform_key: T.untyped, key: T.untyped, data: T.untyped).void }
  def platform_trace(platform_key, key, data); end
  sig { void }
  def service_name(); end
  sig { void }
  def tracer(); end
  sig { returns(T::Boolean) }
  def analytics_available?(); end
  sig { returns(T::Boolean) }
  def analytics_enabled?(); end
  sig { void }
  def analytics_sample_rate(); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def platform_field_key(type, field); end
  sig { void }
  def self.platform_keys(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def self.platform_keys=(value); end
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(options: T.untyped).returns(PlatformTracing) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(key: T.untyped, data: T.untyped).void }
  def trace(key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def instrument(type, field); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def trace_field(type, field); end
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(schema_defn: T.untyped, options: T.untyped).void }
  def self.use(schema_defn, options = {}); end
  sig { void }
  def options(); end
end
class PlatformTracing
  sig { void }
  def self.platform_keys(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def self.platform_keys=(value); end
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(options: T.untyped).returns(PlatformTracing) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(key: T.untyped, data: T.untyped).void }
  def trace(key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def instrument(type, field); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def trace_field(type, field); end
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(schema_defn: T.untyped, options: T.untyped).void }
  def self.use(schema_defn, options = {}); end
  sig { void }
  def options(); end
end
class SkylightTracing < GraphQL::Tracing::PlatformTracing
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(options: T.untyped).returns(SkylightTracing) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "platform_key", using T.untyped
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(platform_key: T.untyped, key: T.untyped, data: T.untyped).void }
  def platform_trace(platform_key, key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def platform_field_key(type, field); end
  sig { void }
  def self.platform_keys(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def self.platform_keys=(value); end
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(key: T.untyped, data: T.untyped).void }
  def trace(key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def instrument(type, field); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def trace_field(type, field); end
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(schema_defn: T.untyped, options: T.untyped).void }
  def self.use(schema_defn, options = {}); end
  sig { void }
  def options(); end
end
class AppsignalTracing < GraphQL::Tracing::PlatformTracing
  # sord omit - no YARD type given for "platform_key", using T.untyped
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(platform_key: T.untyped, key: T.untyped, data: T.untyped).void }
  def platform_trace(platform_key, key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def platform_field_key(type, field); end
  sig { void }
  def self.platform_keys(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def self.platform_keys=(value); end
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(options: T.untyped).returns(PlatformTracing) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(key: T.untyped, data: T.untyped).void }
  def trace(key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def instrument(type, field); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def trace_field(type, field); end
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(schema_defn: T.untyped, options: T.untyped).void }
  def self.use(schema_defn, options = {}); end
  sig { void }
  def options(); end
end
class NewRelicTracing < GraphQL::Tracing::PlatformTracing
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(options: T.untyped).returns(NewRelicTracing) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "platform_key", using T.untyped
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(platform_key: T.untyped, key: T.untyped, data: T.untyped).void }
  def platform_trace(platform_key, key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def platform_field_key(type, field); end
  sig { void }
  def self.platform_keys(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def self.platform_keys=(value); end
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(key: T.untyped, data: T.untyped).void }
  def trace(key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def instrument(type, field); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def trace_field(type, field); end
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(schema_defn: T.untyped, options: T.untyped).void }
  def self.use(schema_defn, options = {}); end
  sig { void }
  def options(); end
end
class PrometheusTracing < GraphQL::Tracing::PlatformTracing
  # sord omit - no YARD type given for "opts", using T.untyped
  sig { params(opts: T.untyped).returns(PrometheusTracing) }
  def initialize(opts = {}); end
  # sord omit - no YARD type given for "platform_key", using T.untyped
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(platform_key: T.untyped, key: T.untyped, data: T.untyped, block: T.untyped).void }
  def platform_trace(platform_key, key, data, &block); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def platform_field_key(type, field); end
  # sord omit - no YARD type given for "platform_key", using T.untyped
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(platform_key: T.untyped, key: T.untyped, data: T.untyped, block: T.untyped).void }
  def instrument_execution(platform_key, key, data, &block); end
  # sord omit - no YARD type given for "platform_key", using T.untyped
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "duration", using T.untyped
  sig { params(platform_key: T.untyped, key: T.untyped, duration: T.untyped).void }
  def observe(platform_key, key, duration); end
  sig { void }
  def self.platform_keys(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def self.platform_keys=(value); end
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(key: T.untyped, data: T.untyped).void }
  def trace(key, data); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def instrument(type, field); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def trace_field(type, field); end
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(schema_defn: T.untyped, options: T.untyped).void }
  def self.use(schema_defn, options = {}); end
  sig { void }
  def options(); end
class GraphQLCollector < PrometheusExporter::Server::TypeCollector
  sig { returns(GraphQLCollector) }
  def initialize(); end
  sig { void }
  def type(); end
  # sord omit - no YARD type given for "object", using T.untyped
  sig { params(object: T.untyped).void }
  def collect(object); end
  sig { void }
  def metrics(); end
end
end
module ActiveSupportNotificationsTracing
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "metadata", using T.untyped
  sig { params(key: T.untyped, metadata: T.untyped).void }
  def self.trace(key, metadata); end
end
end
class Argument
  extend GraphQL::Define::InstanceDefinable
  sig { void }
  def default_value(); end
  sig { void }
  def description(); end
  sig { params(value: T.untyped).void }
  def description=(value); end
  sig { returns(String) }
  def name(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def name=(value); end
  sig { void }
  def as(); end
  sig { params(value: T.untyped).void }
  def as=(value); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  sig { void }
  def graphql_name(); end
  sig { returns(Argument) }
  def initialize(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(T::Boolean) }
  def default_value?(); end
  # sord infer - inferred type of parameter "new_default_value" as T.any() using getter's return type
  sig { params(new_default_value: T.any()).void }
  def default_value=(new_default_value); end
  sig { params(new_input_type: T.any(GraphQL::BaseType, Proc)).void }
  def type=(new_input_type); end
  sig { returns(GraphQL::BaseType) }
  def type(); end
  sig { returns(String) }
  def expose_as(); end
  sig { void }
  def keyword(); end
  sig { params(value: Object, ctx: GraphQL::Query::Context).returns(Object) }
  def prepare(value, ctx); end
  # sord warn - "#<call(value, ctx)" does not appear to be a type
  sig { params(prepare_proc: SORD_ERROR_callvaluectx).void }
  def prepare=(prepare_proc); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type_or_argument", using T.untyped
  # sord omit - no YARD type given for "description", using T.untyped
  # sord omit - no YARD type given for "default_value:", using T.untyped
  # sord omit - no YARD type given for "as:", using T.untyped
  # sord omit - no YARD type given for "prepare:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type_or_argument: T.untyped, description: T.untyped, default_value: T.untyped, as: T.untyped, prepare: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.from_dsl(name, type_or_argument = nil, description = nil, default_value: NO_DEFAULT_VALUE, as: nil, prepare: DefaultPrepare, **kwargs, &block); end
  # sord omit - no YARD type given for "val", using T.untyped
  sig { params(val: T.untyped).void }
  def self.deep_stringify(val); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
module DefaultPrepare
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def self.call(value, ctx); end
end
end
class Function
  sig { returns(T::Hash[String, GraphQL::Argument]) }
  def arguments(); end
  sig { returns(GraphQL::BaseType) }
  def type(); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).returns(Object) }
  def call(obj, args, ctx); end
  sig { returns(T.nilable(String)) }
  def description(); end
  sig { returns(T.nilable(String)) }
  def deprecation_reason(); end
  sig { returns(T.any(Integer, Proc)) }
  def complexity(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.argument(*args, **kwargs, &block); end
  sig { returns(T::Hash[String, GraphQL::Argument]) }
  def self.arguments(); end
  sig { void }
  def self.types(); end
  # sord omit - no YARD type given for "premade_type", using T.untyped
  sig { params(premade_type: T.untyped, block: T.untyped).returns(GraphQL::BaseType) }
  def self.type(premade_type = nil, &block); end
  # sord omit - no YARD type given for "function", using T.untyped
  sig { params(function: T.untyped).void }
  def self.build_field(function); end
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(name: T.untyped).void }
  def self.inherited_value(name); end
  # sord omit - no YARD type given for "new_value", using T.untyped
  sig { params(new_value: T.untyped).void }
  def self.description(new_value = nil); end
  # sord omit - no YARD type given for "new_value", using T.untyped
  sig { params(new_value: T.untyped).void }
  def self.deprecation_reason(new_value = nil); end
  # sord omit - no YARD type given for "new_value", using T.untyped
  sig { params(new_value: T.untyped).void }
  def self.complexity(new_value = nil); end
  sig { returns(T::Boolean) }
  def self.parent_function?(); end
  sig { void }
  def self.own_arguments(); end
end
module Language
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def self.serialize(value); end
module Lexer
  # sord omit - no YARD type given for "query_string", using T.untyped
  sig { params(query_string: T.untyped).void }
  def self.tokenize(query_string); end
  # sord omit - no YARD type given for "raw_string", using T.untyped
  sig { params(raw_string: T.untyped).void }
  def self.replace_escaped_characters_in_place(raw_string); end
  sig { void }
  def self._graphql_lexer_trans_keys(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_trans_keys=(value); end
  sig { void }
  def self._graphql_lexer_char_class(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_char_class=(value); end
  sig { void }
  def self._graphql_lexer_index_offsets(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_index_offsets=(value); end
  sig { void }
  def self._graphql_lexer_indicies(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_indicies=(value); end
  sig { void }
  def self._graphql_lexer_index_defaults(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_index_defaults=(value); end
  sig { void }
  def self._graphql_lexer_trans_cond_spaces(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_trans_cond_spaces=(value); end
  sig { void }
  def self._graphql_lexer_cond_targs(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_cond_targs=(value); end
  sig { void }
  def self._graphql_lexer_cond_actions(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_cond_actions=(value); end
  sig { void }
  def self._graphql_lexer_to_state_actions(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_to_state_actions=(value); end
  sig { void }
  def self._graphql_lexer_from_state_actions(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_from_state_actions=(value); end
  sig { void }
  def self._graphql_lexer_eof_trans(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_eof_trans=(value); end
  sig { void }
  def self._graphql_lexer_nfa_targs(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_nfa_targs=(value); end
  sig { void }
  def self._graphql_lexer_nfa_offsets(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_nfa_offsets=(value); end
  sig { void }
  def self._graphql_lexer_nfa_push_actions(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_nfa_push_actions=(value); end
  sig { void }
  def self._graphql_lexer_nfa_pop_trans(); end
  sig { params(value: T.untyped).void }
  def self._graphql_lexer_nfa_pop_trans=(value); end
  sig { void }
  def self.graphql_lexer_start(); end
  sig { params(value: T.untyped).void }
  def self.graphql_lexer_start=(value); end
  sig { void }
  def self.graphql_lexer_first_final(); end
  sig { params(value: T.untyped).void }
  def self.graphql_lexer_first_final=(value); end
  sig { void }
  def self.graphql_lexer_error(); end
  sig { params(value: T.untyped).void }
  def self.graphql_lexer_error=(value); end
  sig { void }
  def self.graphql_lexer_en_main(); end
  sig { params(value: T.untyped).void }
  def self.graphql_lexer_en_main=(value); end
  # sord omit - no YARD type given for "query_string", using T.untyped
  sig { params(query_string: T.untyped).void }
  def self.run_lexer(query_string); end
  # sord omit - no YARD type given for "ts", using T.untyped
  # sord omit - no YARD type given for "te", using T.untyped
  # sord omit - no YARD type given for "meta", using T.untyped
  sig { params(ts: T.untyped, te: T.untyped, meta: T.untyped).void }
  def self.record_comment(ts, te, meta); end
  # sord omit - no YARD type given for "token_name", using T.untyped
  # sord omit - no YARD type given for "ts", using T.untyped
  # sord omit - no YARD type given for "te", using T.untyped
  # sord omit - no YARD type given for "meta", using T.untyped
  sig { params(token_name: T.untyped, ts: T.untyped, te: T.untyped, meta: T.untyped).void }
  def self.emit(token_name, ts, te, meta); end
  # sord omit - no YARD type given for "ts", using T.untyped
  # sord omit - no YARD type given for "te", using T.untyped
  # sord omit - no YARD type given for "meta", using T.untyped
  # sord omit - no YARD type given for "block:", using T.untyped
  sig { params(ts: T.untyped, te: T.untyped, meta: T.untyped, block: T.untyped).void }
  def self.emit_string(ts, te, meta, block:); end
end
module Nodes
  sig { returns(String) }
  def name(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def name=(value); end
  sig { returns(T.any(TypeName, NonNullType, ListType)) }
  def type(); end
  # sord infer - inferred type of parameter "value" as T.any(TypeName, NonNullType, ListType) using getter's return type
  sig { params(value: T.any(TypeName, NonNullType, ListType)).returns(T.any(TypeName, NonNullType, ListType)) }
  def type=(value); end
  sig { returns(T.any(String, Integer, Float, T::Boolean, Array, NullValue)) }
  def default_value(); end
  # sord infer - inferred type of parameter "value" as T.any(String, Integer, Float, T::Boolean, Array, NullValue) using getter's return type
  sig { params(value: T.any(String, Integer, Float, T::Boolean, Array, NullValue)).returns(T.any(String, Integer, Float, T::Boolean, Array, NullValue)) }
  def default_value=(value); end
class AbstractNode
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
module DefinitionNode
  sig { returns(Integer) }
  def definition_line(); end
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(options: T.untyped).void }
  def initialize(options = {}); end
end
end
class WrapperType < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class NameOnlyNode < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class Argument < GraphQL::Language::Nodes::AbstractNode
  sig { returns(String) }
  def name(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def name=(value); end
  sig { void }
  def children(); end
  sig { returns(T.any(String, Float, Integer, T::Boolean, Array, InputObject)) }
  def value(); end
  # sord infer - inferred type of parameter "value" as T.any(String, Float, Integer, T::Boolean, Array, InputObject) using getter's return type
  sig { params(value: T.any(String, Float, Integer, T::Boolean, Array, InputObject)).returns(T.any(String, Float, Integer, T::Boolean, Array, InputObject)) }
  def value=(value); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class Directive < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class DirectiveLocation < GraphQL::Language::Nodes::NameOnlyNode
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class DirectiveDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def description(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class Document < GraphQL::Language::Nodes::AbstractNode
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(name: T.untyped).void }
  def slice_definition(name); end
  sig { returns(T::Array[T.any(OperationDefinition, FragmentDefinition)]) }
  def definitions(); end
  # sord infer - inferred type of parameter "value" as T::Array[T.any(OperationDefinition, FragmentDefinition)] using getter's return type
  sig { params(value: T::Array[T.any(OperationDefinition, FragmentDefinition)]).returns(T::Array[T.any(OperationDefinition, FragmentDefinition)]) }
  def definitions=(value); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class Enum < GraphQL::Language::Nodes::NameOnlyNode
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class NullValue < GraphQL::Language::Nodes::NameOnlyNode
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class Field < GraphQL::Language::Nodes::AbstractNode
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "directives:", using T.untyped
  # sord omit - no YARD type given for "selections:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, arguments: T.untyped, directives: T.untyped, selections: T.untyped, kwargs: T.untyped).void }
  def initialize_node(name: nil, arguments: [], directives: [], selections: [], **kwargs); end
  sig { returns(T::Array[Nodes::Field]) }
  def selections(); end
  # sord infer - inferred type of parameter "value" as T::Array[Nodes::Field] using getter's return type
  sig { params(value: T::Array[Nodes::Field]).returns(T::Array[Nodes::Field]) }
  def selections=(value); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class FragmentDefinition < GraphQL::Language::Nodes::AbstractNode
  sig { returns(String) }
  def name(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def name=(value); end
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "directives:", using T.untyped
  # sord omit - no YARD type given for "selections:", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, directives: T.untyped, selections: T.untyped).void }
  def initialize_node(name: nil, type: nil, directives: [], selections: []); end
  sig { returns(String) }
  def type(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def type=(value); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class FragmentSpread < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class InlineFragment < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class InputObject < GraphQL::Language::Nodes::AbstractNode
  sig { returns(T::Array[Nodes::Argument]) }
  def arguments(); end
  # sord infer - inferred type of parameter "value" as T::Array[Nodes::Argument] using getter's return type
  sig { params(value: T::Array[Nodes::Argument]).returns(T::Array[Nodes::Argument]) }
  def arguments=(value); end
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(options: T.untyped).returns(T::Hash[String, Any]) }
  def to_h(options = {}); end
  sig { void }
  def children_method_name(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def serialize_value_for_hash(value); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class ListType < GraphQL::Language::Nodes::WrapperType
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class NonNullType < GraphQL::Language::Nodes::WrapperType
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class VariableDefinition < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class OperationDefinition < GraphQL::Language::Nodes::AbstractNode
  sig { returns(T::Array[VariableDefinition]) }
  def variables(); end
  # sord infer - inferred type of parameter "value" as T::Array[VariableDefinition] using getter's return type
  sig { params(value: T::Array[VariableDefinition]).returns(T::Array[VariableDefinition]) }
  def variables=(value); end
  sig { returns(T::Array[Field]) }
  def selections(); end
  # sord infer - inferred type of parameter "value" as T::Array[Field] using getter's return type
  sig { params(value: T::Array[Field]).returns(T::Array[Field]) }
  def selections=(value); end
  sig { returns(T.nilable(String)) }
  def operation_type(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def operation_type=(value); end
  sig { void }
  def children_method_name(); end
  sig { returns(T.nilable(String)) }
  def name(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def name=(value); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class TypeName < GraphQL::Language::Nodes::NameOnlyNode
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class VariableIdentifier < GraphQL::Language::Nodes::NameOnlyNode
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class SchemaDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class SchemaExtension < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class ScalarTypeDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def description(); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class ScalarTypeExtension < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class InputValueDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def description(); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class FieldDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def description(); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def fields(); end
  # sord omit - no YARD type given for "new_options", using T.untyped
  sig { params(new_options: T.untyped).void }
  def merge(new_options); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class ObjectTypeDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def description(); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class ObjectTypeExtension < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class InterfaceTypeDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def description(); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class InterfaceTypeExtension < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class UnionTypeDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def description(); end
  sig { void }
  def types(); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class UnionTypeExtension < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def types(); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class EnumValueDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def description(); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class EnumTypeDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def description(); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class EnumTypeExtension < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class InputObjectTypeDefinition < GraphQL::Language::Nodes::AbstractNode
  extend DefinitionNode
  sig { void }
  def description(); end
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
class InputObjectTypeExtension < GraphQL::Language::Nodes::AbstractNode
  sig { void }
  def children_method_name(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def filename(); end
  sig { params(options: Hash).returns(AbstractNode) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).returns(T::Boolean) }
  def eql?(other); end
  sig { returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def children(); end
  sig { returns(T::Array[T.any(Integer, Float, String, T::Boolean, Array)]) }
  def scalars(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(Symbol) }
  def visit_method(); end
  sig { void }
  def position(); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(printer: T.untyped).void }
  def to_query_string(printer: GraphQL::Language::Printer.new); end
  sig { params(new_options: Hash).returns(AbstractNode) }
  def merge(new_options); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  # sord omit - no YARD type given for "new_child", using T.untyped
  sig { params(previous_child: T.untyped, new_child: T.untyped).void }
  def replace_child(previous_child, new_child); end
  # sord omit - no YARD type given for "previous_child", using T.untyped
  sig { params(previous_child: T.untyped).void }
  def delete_child(previous_child); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  # sord omit - no YARD type given for "children_of_type", using T.untyped
  sig { params(children_of_type: T.untyped).void }
  def self.children_methods(children_of_type); end
  # sord omit - no YARD type given for "method_names", using T.untyped
  sig { params(method_names: T.untyped).void }
  def self.scalar_methods(*method_names); end
  sig { void }
  def self.generate_initialize_node(); end
end
end
class Token
  sig { returns(Symbol) }
  def name(); end
  sig { returns(String) }
  def value(); end
  sig { void }
  def prev_token(); end
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  # sord omit - no YARD type given for "value:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "line:", using T.untyped
  # sord omit - no YARD type given for "col:", using T.untyped
  # sord omit - no YARD type given for "prev_token:", using T.untyped
  sig { params(value: T.untyped, name: T.untyped, line: T.untyped, col: T.untyped, prev_token: T.untyped).returns(Token) }
  def initialize(value:, name:, line:, col:, prev_token:); end
  sig { returns(String) }
  def to_s(); end
  sig { void }
  def to_i(); end
  sig { void }
  def to_f(); end
  sig { void }
  def line_and_column(); end
  sig { void }
  def inspect(); end
end
class Parser < Racc::Parser
  # sord omit - no YARD type given for "val", using T.untyped
  # sord omit - no YARD type given for "_values", using T.untyped
  # sord omit - no YARD type given for "result", using T.untyped
  sig { params(val: T.untyped, _values: T.untyped, result: T.untyped).void }
  def _reduce_none(val, _values, result); end
end
class Printer
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped).returns(String) }
  def print(node, indent: ""); end
  # sord omit - no YARD type given for "document", using T.untyped
  sig { params(document: T.untyped).void }
  def print_document(document); end
  # sord omit - no YARD type given for "argument", using T.untyped
  sig { params(argument: T.untyped).void }
  def print_argument(argument); end
  # sord omit - no YARD type given for "directive", using T.untyped
  sig { params(directive: T.untyped).void }
  def print_directive(directive); end
  # sord omit - no YARD type given for "enum", using T.untyped
  sig { params(enum: T.untyped).void }
  def print_enum(enum); end
  sig { void }
  def print_null_value(); end
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(field: T.untyped, indent: T.untyped).void }
  def print_field(field, indent: ""); end
  # sord omit - no YARD type given for "fragment_def", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(fragment_def: T.untyped, indent: T.untyped).void }
  def print_fragment_definition(fragment_def, indent: ""); end
  # sord omit - no YARD type given for "fragment_spread", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(fragment_spread: T.untyped, indent: T.untyped).void }
  def print_fragment_spread(fragment_spread, indent: ""); end
  # sord omit - no YARD type given for "inline_fragment", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(inline_fragment: T.untyped, indent: T.untyped).void }
  def print_inline_fragment(inline_fragment, indent: ""); end
  # sord omit - no YARD type given for "input_object", using T.untyped
  sig { params(input_object: T.untyped).void }
  def print_input_object(input_object); end
  # sord omit - no YARD type given for "list_type", using T.untyped
  sig { params(list_type: T.untyped).void }
  def print_list_type(list_type); end
  # sord omit - no YARD type given for "non_null_type", using T.untyped
  sig { params(non_null_type: T.untyped).void }
  def print_non_null_type(non_null_type); end
  # sord omit - no YARD type given for "operation_definition", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(operation_definition: T.untyped, indent: T.untyped).void }
  def print_operation_definition(operation_definition, indent: ""); end
  # sord omit - no YARD type given for "type_name", using T.untyped
  sig { params(type_name: T.untyped).void }
  def print_type_name(type_name); end
  # sord omit - no YARD type given for "variable_definition", using T.untyped
  sig { params(variable_definition: T.untyped).void }
  def print_variable_definition(variable_definition); end
  # sord omit - no YARD type given for "variable_identifier", using T.untyped
  sig { params(variable_identifier: T.untyped).void }
  def print_variable_identifier(variable_identifier); end
  # sord omit - no YARD type given for "schema", using T.untyped
  sig { params(schema: T.untyped).void }
  def print_schema_definition(schema); end
  # sord omit - no YARD type given for "scalar_type", using T.untyped
  sig { params(scalar_type: T.untyped).void }
  def print_scalar_type_definition(scalar_type); end
  # sord omit - no YARD type given for "object_type", using T.untyped
  sig { params(object_type: T.untyped).void }
  def print_object_type_definition(object_type); end
  # sord omit - no YARD type given for "input_value", using T.untyped
  sig { params(input_value: T.untyped).void }
  def print_input_value_definition(input_value); end
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(arguments: T.untyped, indent: T.untyped).void }
  def print_arguments(arguments, indent: ""); end
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(field: T.untyped).void }
  def print_field_definition(field); end
  # sord omit - no YARD type given for "interface_type", using T.untyped
  sig { params(interface_type: T.untyped).void }
  def print_interface_type_definition(interface_type); end
  # sord omit - no YARD type given for "union_type", using T.untyped
  sig { params(union_type: T.untyped).void }
  def print_union_type_definition(union_type); end
  # sord omit - no YARD type given for "enum_type", using T.untyped
  sig { params(enum_type: T.untyped).void }
  def print_enum_type_definition(enum_type); end
  # sord omit - no YARD type given for "enum_value", using T.untyped
  sig { params(enum_value: T.untyped).void }
  def print_enum_value_definition(enum_value); end
  # sord omit - no YARD type given for "input_object_type", using T.untyped
  sig { params(input_object_type: T.untyped).void }
  def print_input_object_type_definition(input_object_type); end
  # sord omit - no YARD type given for "directive", using T.untyped
  sig { params(directive: T.untyped).void }
  def print_directive_definition(directive); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  # sord omit - no YARD type given for "first_in_block:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped, first_in_block: T.untyped).void }
  def print_description(node, indent: "", first_in_block: true); end
  # sord omit - no YARD type given for "fields", using T.untyped
  sig { params(fields: T.untyped).void }
  def print_field_definitions(fields); end
  # sord omit - no YARD type given for "directives", using T.untyped
  sig { params(directives: T.untyped).void }
  def print_directives(directives); end
  # sord omit - no YARD type given for "selections", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(selections: T.untyped, indent: T.untyped).void }
  def print_selections(selections, indent: ""); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped).void }
  def print_node(node, indent: ""); end
  sig { void }
  def node(); end
end
class Visitor
  # sord omit - no YARD type given for "document", using T.untyped
  sig { params(document: T.untyped).returns(Visitor) }
  def initialize(document); end
  sig { returns(GraphQL::Language::Nodes::Document) }
  def result(); end
  sig { params(node_class: Class).returns(NodeVisitor) }
  def [](node_class); end
  sig { void }
  def visit(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def visit_node(node, parent); end
  sig { params(node: GraphQL::Language::Nodes::AbstractNode, parent: T.nilable(GraphQL::Language::Nodes::AbstractNode)).returns(T.nilable(Array)) }
  def on_abstract_node(node, parent); end
  # sord omit - no YARD type given for "node_method", using T.untyped
  sig { params(node_method: T.untyped).void }
  def self.make_visit_method(node_method); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_node_with_modifications(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def begin_visit(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def end_visit(node, parent); end
  # sord omit - no YARD type given for "hooks", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(hooks: T.untyped, node: T.untyped, parent: T.untyped).void }
  def self.apply_hooks(hooks, node, parent); end
class DeleteNode
end
class NodeVisitor
  sig { returns(T::Array[Proc]) }
  def enter(); end
  sig { returns(T::Array[Proc]) }
  def leave(); end
  sig { returns(NodeVisitor) }
  def initialize(); end
  sig { params(hook: Proc).void }
  def <<(hook); end
end
end
module Generation
  include GraphQL::Language::Generation
  # sord omit - no YARD type given for "indent:", using T.untyped
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(node: GraphQL::Language::Nodes::AbstractNode, indent: T.untyped, printer: T.untyped).returns(String) }
  def generate(node, indent: "", printer: GraphQL::Language::Printer.new); end
  # sord omit - no YARD type given for "indent:", using T.untyped
  # sord omit - no YARD type given for "printer:", using T.untyped
  sig { params(node: GraphQL::Language::Nodes::AbstractNode, indent: T.untyped, printer: T.untyped).returns(String) }
  def self.generate(node, indent: "", printer: GraphQL::Language::Printer.new); end
end
module BlockString
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def self.trim_whitespace(str); end
  # sord omit - no YARD type given for "str", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(str: T.untyped, indent: T.untyped).void }
  def self.print(str, indent: ''); end
  # sord omit - no YARD type given for "line", using T.untyped
  # sord omit - no YARD type given for "length", using T.untyped
  sig { params(line: T.untyped, length: T.untyped).void }
  def self.break_line(line, length); end
end
module DefinitionSlice
  include GraphQL::Language::DefinitionSlice
  # sord omit - no YARD type given for "document", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(document: T.untyped, name: T.untyped).void }
  def slice(document, name); end
  # sord omit - no YARD type given for "definitions", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(definitions: T.untyped, name: T.untyped).void }
  def find_definition_dependencies(definitions, name); end
  # sord omit - no YARD type given for "document", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(document: T.untyped, name: T.untyped).void }
  def self.slice(document, name); end
  # sord omit - no YARD type given for "definitions", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(definitions: T.untyped, name: T.untyped).void }
  def self.find_definition_dependencies(definitions, name); end
end
class DocumentFromSchemaDefinition
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "only:", using T.untyped
  # sord omit - no YARD type given for "except:", using T.untyped
  # sord omit - no YARD type given for "include_introspection_types:", using T.untyped
  # sord omit - no YARD type given for "include_built_in_directives:", using T.untyped
  # sord omit - no YARD type given for "include_built_in_scalars:", using T.untyped
  # sord omit - no YARD type given for "always_include_schema:", using T.untyped
  sig { params(schema: T.untyped, context: T.untyped, only: T.untyped, except: T.untyped, include_introspection_types: T.untyped, include_built_in_directives: T.untyped, include_built_in_scalars: T.untyped, always_include_schema: T.untyped).returns(DocumentFromSchemaDefinition) }
  def initialize(schema, context: nil, only: nil, except: nil, include_introspection_types: false, include_built_in_directives: false, include_built_in_scalars: false, always_include_schema: false); end
  sig { void }
  def document(); end
  sig { void }
  def build_schema_node(); end
  # sord omit - no YARD type given for "object_type", using T.untyped
  sig { params(object_type: T.untyped).void }
  def build_object_type_node(object_type); end
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(field: T.untyped).void }
  def build_field_node(field); end
  # sord omit - no YARD type given for "union_type", using T.untyped
  sig { params(union_type: T.untyped).void }
  def build_union_type_node(union_type); end
  # sord omit - no YARD type given for "interface_type", using T.untyped
  sig { params(interface_type: T.untyped).void }
  def build_interface_type_node(interface_type); end
  # sord omit - no YARD type given for "enum_type", using T.untyped
  sig { params(enum_type: T.untyped).void }
  def build_enum_type_node(enum_type); end
  # sord omit - no YARD type given for "enum_value", using T.untyped
  sig { params(enum_value: T.untyped).void }
  def build_enum_value_node(enum_value); end
  # sord omit - no YARD type given for "scalar_type", using T.untyped
  sig { params(scalar_type: T.untyped).void }
  def build_scalar_type_node(scalar_type); end
  # sord omit - no YARD type given for "argument", using T.untyped
  sig { params(argument: T.untyped).void }
  def build_argument_node(argument); end
  # sord omit - no YARD type given for "input_object", using T.untyped
  sig { params(input_object: T.untyped).void }
  def build_input_object_node(input_object); end
  # sord omit - no YARD type given for "directive", using T.untyped
  sig { params(directive: T.untyped).void }
  def build_directive_node(directive); end
  # sord omit - no YARD type given for "locations", using T.untyped
  sig { params(locations: T.untyped).void }
  def build_directive_location_nodes(locations); end
  # sord omit - no YARD type given for "location", using T.untyped
  sig { params(location: T.untyped).void }
  def build_directive_location_node(location); end
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(type: T.untyped).void }
  def build_type_name_node(type); end
  # sord omit - no YARD type given for "default_value", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(default_value: T.untyped, type: T.untyped).void }
  def build_default_value(default_value, type); end
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(type: T.untyped).void }
  def build_type_definition_node(type); end
  # sord omit - no YARD type given for "arguments", using T.untyped
  sig { params(arguments: T.untyped).void }
  def build_argument_nodes(arguments); end
  # sord omit - no YARD type given for "directives", using T.untyped
  sig { params(directives: T.untyped).void }
  def build_directive_nodes(directives); end
  sig { void }
  def build_definition_nodes(); end
  # sord omit - no YARD type given for "types", using T.untyped
  sig { params(types: T.untyped).void }
  def build_type_definition_nodes(types); end
  # sord omit - no YARD type given for "fields", using T.untyped
  sig { params(fields: T.untyped).void }
  def build_field_nodes(fields); end
  sig { returns(T::Boolean) }
  def include_schema_node?(); end
  # sord omit - no YARD type given for "schema", using T.untyped
  sig { params(schema: T.untyped).returns(T::Boolean) }
  def schema_respects_root_name_conventions?(schema); end
  sig { void }
  def schema(); end
  sig { void }
  def warden(); end
  sig { void }
  def always_include_schema(); end
  sig { void }
  def include_introspection_types(); end
  sig { void }
  def include_built_in_directives(); end
  sig { void }
  def include_built_in_scalars(); end
end
end
module Types
class ID < GraphQL::Schema::Scalar
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: T.untyped, _ctx: T.untyped).void }
  def self.coerce_result(value, _ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: T.untyped, _ctx: T.untyped).void }
  def self.coerce_input(value, _ctx); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "is_default", using T.untyped
  sig { params(is_default: T.untyped).void }
  def self.default_scalar(is_default = nil); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Int < GraphQL::Schema::Scalar
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: T.untyped, _ctx: T.untyped).void }
  def self.coerce_input(value, _ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def self.coerce_result(value, ctx); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "is_default", using T.untyped
  sig { params(is_default: T.untyped).void }
  def self.default_scalar(is_default = nil); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class JSON < GraphQL::Schema::Scalar
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_context", using T.untyped
  sig { params(value: T.untyped, _context: T.untyped).void }
  def self.coerce_input(value, _context); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_context", using T.untyped
  sig { params(value: T.untyped, _context: T.untyped).void }
  def self.coerce_result(value, _context); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "is_default", using T.untyped
  sig { params(is_default: T.untyped).void }
  def self.default_scalar(is_default = nil); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Float < GraphQL::Schema::Scalar
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: T.untyped, _ctx: T.untyped).void }
  def self.coerce_input(value, _ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: T.untyped, _ctx: T.untyped).void }
  def self.coerce_result(value, _ctx); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "is_default", using T.untyped
  sig { params(is_default: T.untyped).void }
  def self.default_scalar(is_default = nil); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
module Relay
module Node
  extend GraphQL::Types::Relay::BaseInterface
  sig { void }
  def unwrap(); end
end
class BaseEdge < GraphQL::Types::Relay::BaseObject
  # sord omit - no YARD type given for "null:", using T.untyped
  sig { params(node_type: Class, null: T.untyped).void }
  def self.node_type(node_type = nil, null: true); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def self.authorized?(obj, ctx); end
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(ctx: T.untyped).returns(T::Boolean) }
  def self.accessible?(ctx); end
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(ctx: T.untyped).returns(T::Boolean) }
  def self.visible?(ctx); end
  # sord omit - no YARD type given for "new_value", using T.untyped
  sig { params(new_value: T.untyped).void }
  def self.default_relay(new_value); end
  sig { returns(T::Boolean) }
  def self.default_relay?(); end
  sig { void }
  def self.to_graphql(); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class PageInfo < GraphQL::Types::Relay::BaseObject
  # sord omit - no YARD type given for "new_value", using T.untyped
  sig { params(new_value: T.untyped).void }
  def self.default_relay(new_value); end
  sig { returns(T::Boolean) }
  def self.default_relay?(); end
  sig { void }
  def self.to_graphql(); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class BaseField < GraphQL::Schema::Field
  # sord omit - no YARD type given for "edge_class:", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  sig { params(edge_class: T.untyped, rest: T.untyped, block: T.untyped).returns(BaseField) }
  def initialize(edge_class: nil, **rest, &block); end
  sig { void }
  def to_graphql(); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { params(value: T.untyped).void }
  def description=(value); end
  sig { returns(T.nilable(String)) }
  def deprecation_reason(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def deprecation_reason=(value); end
  sig { returns(Symbol) }
  def method_sym(); end
  sig { returns(String) }
  def method_str(); end
  sig { returns(Symbol) }
  def resolver_method(); end
  sig { returns(Class) }
  def owner(); end
  sig { returns(Symobol) }
  def original_name(); end
  sig { returns(T.nilable(Class)) }
  def resolver(); end
  sig { returns(T.nilable(Class)) }
  def mutation(); end
  sig { returns(T::Array[Symbol]) }
  def extras(); end
  sig { returns(T::Boolean) }
  def trace(); end
  sig { returns(T.nilable(String)) }
  def subscription_scope(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "desc", using T.untyped
  # sord omit - no YARD type given for "resolver:", using T.untyped
  # sord omit - no YARD type given for "mutation:", using T.untyped
  # sord omit - no YARD type given for "subscription:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  # sord warn - "GraphQL::Schema:Field" does not appear to be a type
  sig { params(name: T.untyped, type: T.untyped, desc: T.untyped, resolver: T.untyped, mutation: T.untyped, subscription: T.untyped, kwargs: T.untyped, block: T.untyped).returns(SORD_ERROR_GraphQLSchemaField) }
  def self.from_options(name = nil, type = nil, desc = nil, resolver: nil, mutation: nil, subscription: nil, **kwargs, &block); end
  sig { returns(T::Boolean) }
  def connection?(); end
  sig { returns(T::Boolean) }
  def scoped?(); end
  sig { params(text: String).returns(String) }
  def description(text = nil); end
  # sord omit - no YARD type given for "new_extensions", using T.untyped
  sig { params(new_extensions: T.untyped).returns(T::Array[GraphQL::Schema::FieldExtension]) }
  def extensions(new_extensions = nil); end
  sig { params(extension: Class, options: Object).void }
  def extension(extension, options = nil); end
  # sord omit - no YARD type given for "new_complexity", using T.untyped
  sig { params(new_complexity: T.untyped).void }
  def complexity(new_complexity); end
  sig { returns(T.nilable(Integer)) }
  def max_page_size(); end
  sig { void }
  def type(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def authorized?(object, context); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def resolve_field(obj, args, ctx); end
  sig { params(object: GraphQL::Schema::Object, args: Hash, ctx: GraphQL::Query::Context).void }
  def resolve(object, args, ctx); end
  sig { params(obj: GraphQL::Schema::Object, ruby_kwargs: T::Hash[Symbol, Object], ctx: GraphQL::Query::Context).void }
  def resolve_field_method(obj, ruby_kwargs, ctx); end
  # sord omit - no YARD type given for "extra_name", using T.untyped
  sig { params(extra_name: T.untyped, ctx: GraphQL::Query::Context::FieldResolutionContext).void }
  def fetch_extra(extra_name, ctx); end
  sig { params(obj: GraphQL::Schema::Object, graphql_args: GraphQL::Query::Arguments, field_ctx: GraphQL::Query::Context::FieldResolutionContext).returns(T::Hash[Symbol, Any]) }
  def to_ruby_args(obj, graphql_args, field_ctx); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "ruby_kwargs", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(obj: T.untyped, ruby_kwargs: T.untyped, field_ctx: T.untyped).void }
  def public_send_field(obj, ruby_kwargs, field_ctx); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).returns(Object) }
  def with_extensions(obj, args, ctx); end
  # sord omit - no YARD type given for "memos", using T.untyped
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  # sord omit - no YARD type given for "idx:", using T.untyped
  sig { params(memos: T.untyped, obj: T.untyped, args: T.untyped, ctx: T.untyped, idx: T.untyped).void }
  def run_extensions_before_resolve(memos, obj, args, ctx, idx: 0); end
  sig { returns(String) }
  def path(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  # sord omit - no YARD type given for "loads:", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(name: T.untyped, type: T.untyped, rest: T.untyped, loads: T.untyped, kwargs: T.untyped).void }
  def argument_with_loads(name, type, *rest, loads: nil, **kwargs); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).returns(GraphQL::Schema::Argument) }
  def argument(*args, **kwargs, &block); end
  sig { params(arg_defn: GraphQL::Schema::Argument).returns(GraphQL::Schema::Argument) }
  def add_argument(arg_defn); end
  # sord warn - "Hash<String => GraphQL::Schema::Argument] Arguments defined on this thing" does not appear to be a type
  # sord warn - "keyed by name. Includes inherited definitions" does not appear to be a type
  sig { returns(T.any(SORD_ERROR_HashStringGraphQLSchemaArgumentArgumentsdefinedonthisthing, SORD_ERROR_keyedbynameIncludesinheriteddefinitions)) }
  def arguments(); end
  sig { params(new_arg_class: Class).void }
  def argument_class(new_arg_class = nil); end
  sig { void }
  def own_arguments(); end
  sig { void }
  def graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def initialize_copy(original); end
end
class BaseObject < GraphQL::Schema::Object
  # sord omit - no YARD type given for "new_value", using T.untyped
  sig { params(new_value: T.untyped).void }
  def self.default_relay(new_value); end
  sig { returns(T::Boolean) }
  def self.default_relay?(); end
  sig { void }
  def self.to_graphql(); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
module BaseInterface
  extend GraphQL::Schema::Interface
  sig { void }
  def unwrap(); end
end
class BaseConnection < GraphQL::Types::Relay::BaseObject
  include Forwardable
  sig { returns(Class) }
  def self.node_type(); end
  sig { returns(Class) }
  def self.edge_class(); end
  # sord omit - no YARD type given for "edge_type_class", using T.untyped
  # sord omit - no YARD type given for "edge_class:", using T.untyped
  # sord omit - no YARD type given for "node_type:", using T.untyped
  # sord omit - no YARD type given for "nodes_field:", using T.untyped
  sig { params(edge_type_class: T.untyped, edge_class: T.untyped, node_type: T.untyped, nodes_field: T.untyped).void }
  def self.edge_type(edge_type_class, edge_class: GraphQL::Relay::Edge, node_type: edge_type_class.node_type, nodes_field: true); end
  # sord omit - no YARD type given for "items", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(items: T.untyped, context: T.untyped).void }
  def self.scope_items(items, context); end
  sig { void }
  def self.nodes_field(); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def self.authorized?(obj, ctx); end
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(ctx: T.untyped).returns(T::Boolean) }
  def self.accessible?(ctx); end
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(ctx: T.untyped).returns(T::Boolean) }
  def self.visible?(ctx); end
  sig { void }
  def self.define_nodes_field(); end
  sig { void }
  def nodes(); end
  sig { void }
  def edges(); end
  # sord omit - no YARD type given for "new_value", using T.untyped
  sig { params(new_value: T.untyped).void }
  def self.default_relay(new_value); end
  sig { returns(T::Boolean) }
  def self.default_relay?(); end
  sig { void }
  def self.to_graphql(); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.connection_type(); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
end
class String < GraphQL::Schema::Scalar
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def self.coerce_result(value, ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: T.untyped, _ctx: T.untyped).void }
  def self.coerce_input(value, _ctx); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "is_default", using T.untyped
  sig { params(is_default: T.untyped).void }
  def self.default_scalar(is_default = nil); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class BigInt < GraphQL::Schema::Scalar
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: T.untyped, _ctx: T.untyped).void }
  def self.coerce_input(value, _ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: T.untyped, _ctx: T.untyped).void }
  def self.coerce_result(value, _ctx); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "is_default", using T.untyped
  sig { params(is_default: T.untyped).void }
  def self.default_scalar(is_default = nil); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class Boolean < GraphQL::Schema::Scalar
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: T.untyped, _ctx: T.untyped).void }
  def self.coerce_input(value, _ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: T.untyped, _ctx: T.untyped).void }
  def self.coerce_result(value, _ctx); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "is_default", using T.untyped
  sig { params(is_default: T.untyped).void }
  def self.default_scalar(is_default = nil); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class ISO8601DateTime < GraphQL::Schema::Scalar
  sig { returns(Integer) }
  def self.time_precision(); end
  sig { params(value: Integer).void }
  def self.time_precision=(value); end
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(value: DateTime, _ctx: T.untyped).returns(String) }
  def self.coerce_result(value, _ctx); end
  # sord omit - no YARD type given for "_ctx", using T.untyped
  sig { params(str_value: String, _ctx: T.untyped).returns(DateTime) }
  def self.coerce_input(str_value, _ctx); end
  sig { void }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "is_default", using T.untyped
  sig { params(is_default: T.untyped).void }
  def self.default_scalar(is_default = nil); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
end
class Backtrace
  extend Enumerable
  include Forwardable
  sig { void }
  def self.enable(); end
  sig { void }
  def self.disable(); end
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  sig { params(schema_defn: T.untyped).void }
  def self.use(schema_defn); end
  # sord omit - no YARD type given for "context", using T.untyped
  # sord omit - no YARD type given for "value:", using T.untyped
  sig { params(context: T.untyped, value: T.untyped).returns(Backtrace) }
  def initialize(context, value: nil); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_s(); end
  sig { void }
  def to_a(); end
class Table
  # sord omit - no YARD type given for "context", using T.untyped
  # sord omit - no YARD type given for "value:", using T.untyped
  sig { params(context: T.untyped, value: T.untyped).returns(Table) }
  def initialize(context, value:); end
  sig { returns(String) }
  def to_table(); end
  sig { returns(T::Array[String]) }
  def to_backtrace(); end
  sig { void }
  def rows(); end
  # sord omit - no YARD type given for "rows", using T.untyped
  sig { params(rows: T.untyped).returns(String) }
  def render_table(rows); end
  # sord omit - no YARD type given for "context_entry", using T.untyped
  # sord omit - no YARD type given for "rows:", using T.untyped
  # sord omit - no YARD type given for "top:", using T.untyped
  sig { params(context_entry: T.untyped, rows: T.untyped, top: T.untyped).returns(Array) }
  def build_rows(context_entry, rows:, top: false); end
end
module Tracer
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "metadata", using T.untyped
  sig { params(key: T.untyped, metadata: T.untyped).void }
  def trace(key, metadata); end
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "metadata", using T.untyped
  sig { params(key: T.untyped, metadata: T.untyped).void }
  def self.trace(key, metadata); end
end
class TracedError < GraphQL::Error
  sig { returns(T::Array[String]) }
  def graphql_backtrace(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  # sord omit - no YARD type given for "err", using T.untyped
  # sord omit - no YARD type given for "current_ctx", using T.untyped
  sig { params(err: T.untyped, current_ctx: T.untyped).returns(TracedError) }
  def initialize(err, current_ctx); end
end
module InspectResult
  # sord omit - no YARD type given for "obj", using T.untyped
  sig { params(obj: T.untyped).void }
  def inspect_result(obj); end
  # sord omit - no YARD type given for "obj", using T.untyped
  sig { params(obj: T.untyped).void }
  def self.inspect_result(obj); end
  # sord omit - no YARD type given for "obj", using T.untyped
  sig { params(obj: T.untyped).void }
  def inspect_truncated(obj); end
  # sord omit - no YARD type given for "obj", using T.untyped
  sig { params(obj: T.untyped).void }
  def self.inspect_truncated(obj); end
end
end
class BaseType
  extend GraphQL::Relay::TypeExtensions
  extend GraphQL::Define::InstanceDefinable
  extend GraphQL::Define::NonNullWithBang
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  sig { returns(BaseType) }
  def initialize(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { void }
  def graphql_definition(); end
  # sord infer - inferred type of parameter "name" as String using getter's return type
  sig { params(name: String).void }
  def name=(name); end
  sig { returns(T.nilable(String)) }
  def description(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def description=(value); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  sig { returns(T::Boolean) }
  def default_scalar?(); end
  sig { returns(T::Boolean) }
  def default_relay?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def introspection=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_scalar=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_relay=(value); end
  sig { params(other: GraphQL::BaseType).returns(T::Boolean) }
  def ==(other); end
  sig { void }
  def unwrap(); end
  sig { returns(GraphQL::NonNullType) }
  def to_non_null_type(); end
  sig { returns(GraphQL::ListType) }
  def to_list_type(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def resolve_type(value, ctx); end
  sig { void }
  def to_s(); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_type_signature(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(T::Boolean) }
  def valid_isolated_input?(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def validate_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_result(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def valid_input?(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_result(value, ctx); end
  sig { params(name: String).returns(T.nilable(GraphQL::Field)) }
  def get_field(name); end
  # sord omit - no YARD type given for "type_arg", using T.untyped
  sig { params(type_arg: T.untyped).returns(GraphQL::BaseType) }
  def self.resolve_related_type(type_arg); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: GraphQL::Schema, printer: T.untyped, args: T.untyped).returns(String) }
  def to_definition(schema, printer: nil, **args); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  # sord omit - no YARD type given for "alt_method_name", using T.untyped
  sig { params(alt_method_name: T.untyped).void }
  def warn_deprecated_coerce(alt_method_name); end
  sig { returns(GraphQL::ObjectType) }
  def connection_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  sig { returns(GraphQL::ObjectType) }
  def edge_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
  sig { returns(GraphQL::NonNullType) }
  def !(); end
module ModifiesAnotherType
  sig { void }
  def unwrap(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def ==(other); end
end
end
class Directive
  extend GraphQL::Define::InstanceDefinable
  sig { void }
  def locations(); end
  sig { params(value: T.untyped).void }
  def locations=(value); end
  sig { void }
  def arguments(); end
  sig { params(value: T.untyped).void }
  def arguments=(value); end
  sig { void }
  def name(); end
  sig { params(value: T.untyped).void }
  def name=(value); end
  sig { void }
  def description(); end
  sig { params(value: T.untyped).void }
  def description=(value); end
  sig { void }
  def arguments_class(); end
  sig { params(value: T.untyped).void }
  def arguments_class=(value); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_directive=(value); end
  sig { void }
  def graphql_name(); end
  sig { void }
  def graphql_definition(); end
  sig { returns(Directive) }
  def initialize(); end
  sig { void }
  def to_s(); end
  sig { returns(T::Boolean) }
  def on_field?(); end
  sig { returns(T::Boolean) }
  def on_fragment?(); end
  sig { returns(T::Boolean) }
  def on_operation?(); end
  sig { returns(T::Boolean) }
  def default_directive?(); end
  sig { void }
  def inspect(); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
end
class EnumType < GraphQL::BaseType
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  sig { returns(EnumType) }
  def initialize(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { params(new_values: T::Array[EnumValue]).void }
  def values=(new_values); end
  sig { params(enum_value: EnumValue).void }
  def add_value(enum_value); end
  sig { returns(T::Hash[String, EnumValue]) }
  def values(); end
  sig { void }
  def kind(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_result(value, ctx = nil); end
  sig { void }
  def to_s(); end
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value_name: String, ctx: T.untyped).returns(Object) }
  def coerce_non_null_input(value_name, ctx); end
  # sord omit - no YARD type given for "value_name", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value_name: T.untyped, ctx: T.untyped).void }
  def validate_non_null_input(value_name, ctx); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { void }
  def graphql_definition(); end
  # sord infer - inferred type of parameter "name" as String using getter's return type
  sig { params(name: String).void }
  def name=(name); end
  sig { returns(T.nilable(String)) }
  def description(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def description=(value); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  sig { returns(T::Boolean) }
  def default_scalar?(); end
  sig { returns(T::Boolean) }
  def default_relay?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def introspection=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_scalar=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_relay=(value); end
  sig { params(other: GraphQL::BaseType).returns(T::Boolean) }
  def ==(other); end
  sig { void }
  def unwrap(); end
  sig { returns(GraphQL::NonNullType) }
  def to_non_null_type(); end
  sig { returns(GraphQL::ListType) }
  def to_list_type(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def resolve_type(value, ctx); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_type_signature(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(T::Boolean) }
  def valid_isolated_input?(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def validate_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_result(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def valid_input?(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_input(value, ctx = nil); end
  sig { params(name: String).returns(T.nilable(GraphQL::Field)) }
  def get_field(name); end
  # sord omit - no YARD type given for "type_arg", using T.untyped
  sig { params(type_arg: T.untyped).returns(GraphQL::BaseType) }
  def self.resolve_related_type(type_arg); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: GraphQL::Schema, printer: T.untyped, args: T.untyped).returns(String) }
  def to_definition(schema, printer: nil, **args); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  # sord omit - no YARD type given for "alt_method_name", using T.untyped
  sig { params(alt_method_name: T.untyped).void }
  def warn_deprecated_coerce(alt_method_name); end
  sig { returns(GraphQL::ObjectType) }
  def connection_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  sig { returns(GraphQL::ObjectType) }
  def edge_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
  sig { returns(GraphQL::NonNullType) }
  def !(); end
class EnumValue
  extend GraphQL::Define::InstanceDefinable
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def name=(new_name); end
  sig { void }
  def graphql_name(); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
end
class UnresolvedValueError < GraphQL::Error
end
end
class ListType < GraphQL::BaseType
  extend GraphQL::BaseType::ModifiesAnotherType
  sig { void }
  def of_type(); end
  # sord omit - no YARD type given for "of_type:", using T.untyped
  sig { params(of_type: T.untyped).returns(ListType) }
  def initialize(of_type:); end
  sig { void }
  def kind(); end
  sig { void }
  def to_s(); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_type_signature(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_result(value, ctx = nil); end
  sig { returns(T::Boolean) }
  def list?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_non_null_input(value, ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_non_null_input(value, ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def ensure_array(value); end
  sig { void }
  def unwrap(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def ==(other); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { void }
  def graphql_definition(); end
  # sord infer - inferred type of parameter "name" as String using getter's return type
  sig { params(name: String).void }
  def name=(name); end
  sig { returns(T.nilable(String)) }
  def description(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def description=(value); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  sig { returns(T::Boolean) }
  def default_scalar?(); end
  sig { returns(T::Boolean) }
  def default_relay?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def introspection=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_scalar=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_relay=(value); end
  sig { returns(GraphQL::NonNullType) }
  def to_non_null_type(); end
  sig { returns(GraphQL::ListType) }
  def to_list_type(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def resolve_type(value, ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(T::Boolean) }
  def valid_isolated_input?(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def validate_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_result(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def valid_input?(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_input(value, ctx = nil); end
  sig { params(name: String).returns(T.nilable(GraphQL::Field)) }
  def get_field(name); end
  # sord omit - no YARD type given for "type_arg", using T.untyped
  sig { params(type_arg: T.untyped).returns(GraphQL::BaseType) }
  def self.resolve_related_type(type_arg); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: GraphQL::Schema, printer: T.untyped, args: T.untyped).returns(String) }
  def to_definition(schema, printer: nil, **args); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  # sord omit - no YARD type given for "alt_method_name", using T.untyped
  sig { params(alt_method_name: T.untyped).void }
  def warn_deprecated_coerce(alt_method_name); end
  sig { returns(GraphQL::ObjectType) }
  def connection_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  sig { returns(GraphQL::ObjectType) }
  def edge_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
  sig { returns(GraphQL::NonNullType) }
  def !(); end
end
class RakeTask
  extend Rake::DSL
  include Rake::DSL
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(String) }
  def namespace=(value); end
  sig { void }
  def rake_namespace(); end
  sig { returns(T::Array[String]) }
  def dependencies(); end
  # sord infer - inferred type of parameter "value" as T::Array[String] using getter's return type
  sig { params(value: T::Array[String]).returns(T::Array[String]) }
  def dependencies=(value); end
  sig { returns(String) }
  def schema_name(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def schema_name=(value); end
  # sord warn - "<#call(task)>" does not appear to be a type
  sig { returns(SORD_ERROR_calltask) }
  def load_schema(); end
  # sord warn - "<#call(task)>" does not appear to be a type
  # sord infer - inferred type of parameter "value" as SORD_ERROR_calltask using getter's return type
  # sord warn - "<#call(task)>" does not appear to be a type
  sig { params(value: SORD_ERROR_calltask).returns(SORD_ERROR_calltask) }
  def load_schema=(value); end
  # sord warn - "<#call(task)>" does not appear to be a type
  sig { returns(SORD_ERROR_calltask) }
  def load_context(); end
  # sord warn - "<#call(task)>" does not appear to be a type
  # sord infer - inferred type of parameter "value" as SORD_ERROR_calltask using getter's return type
  # sord warn - "<#call(task)>" does not appear to be a type
  sig { params(value: SORD_ERROR_calltask).returns(SORD_ERROR_calltask) }
  def load_context=(value); end
  # sord warn - "<#call(member, ctx)>" does not appear to be a type
  sig { returns(T.nilable(SORD_ERROR_callmemberctx)) }
  def only(); end
  # sord warn - "<#call(member, ctx)>" does not appear to be a type
  # sord infer - inferred type of parameter "value" as T.nilable(SORD_ERROR_callmemberctx) using getter's return type
  # sord warn - "<#call(member, ctx)>" does not appear to be a type
  sig { params(value: T.nilable(SORD_ERROR_callmemberctx)).returns(T.nilable(SORD_ERROR_callmemberctx)) }
  def only=(value); end
  # sord warn - "<#call(member, ctx)>" does not appear to be a type
  sig { returns(T.nilable(SORD_ERROR_callmemberctx)) }
  def except(); end
  # sord warn - "<#call(member, ctx)>" does not appear to be a type
  # sord infer - inferred type of parameter "value" as T.nilable(SORD_ERROR_callmemberctx) using getter's return type
  # sord warn - "<#call(member, ctx)>" does not appear to be a type
  sig { params(value: T.nilable(SORD_ERROR_callmemberctx)).returns(T.nilable(SORD_ERROR_callmemberctx)) }
  def except=(value); end
  sig { returns(String) }
  def idl_outfile(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def idl_outfile=(value); end
  sig { returns(String) }
  def json_outfile(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def json_outfile=(value); end
  sig { returns(String) }
  def directory(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def directory=(value); end
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(options: T.untyped).returns(RakeTask) }
  def initialize(options = {}); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "file", using T.untyped
  sig { params(method_name: T.untyped, file: T.untyped).void }
  def write_outfile(method_name, file); end
  sig { void }
  def idl_path(); end
  sig { void }
  def json_path(); end
  sig { void }
  def define_task(); end
end
module Relay
class Edge
  sig { void }
  def node(); end
  sig { void }
  def connection(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "connection", using T.untyped
  sig { params(node: T.untyped, connection: T.untyped).returns(Edge) }
  def initialize(node, connection); end
  sig { void }
  def cursor(); end
  sig { void }
  def parent(); end
  sig { void }
  def inspect(); end
end
module Node
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::Field) }
  def self.field(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def self.plural_field(**kwargs, &block); end
  sig { returns(GraphQL::InterfaceType) }
  def self.interface(); end
end
class Mutation
  extend GraphQL::Define::InstanceDefinable
  sig { void }
  def name(); end
  sig { params(value: T.untyped).void }
  def name=(value); end
  sig { void }
  def description(); end
  sig { params(value: T.untyped).void }
  def description=(value); end
  sig { void }
  def fields(); end
  sig { params(value: T.untyped).void }
  def fields=(value); end
  sig { void }
  def arguments(); end
  sig { params(value: T.untyped).void }
  def arguments=(value); end
  sig { params(value: T.untyped).void }
  def return_type=(value); end
  sig { params(value: T.untyped).void }
  def return_interfaces=(value); end
  sig { void }
  def return_fields(); end
  sig { void }
  def input_fields(); end
  sig { returns(Mutation) }
  def initialize(); end
  sig { returns(T::Boolean) }
  def has_generated_return_type?(); end
  # sord omit - no YARD type given for "new_resolve_proc", using T.untyped
  sig { params(new_resolve_proc: T.untyped).void }
  def resolve=(new_resolve_proc); end
  sig { void }
  def field(); end
  sig { void }
  def return_interfaces(); end
  sig { void }
  def return_type(); end
  sig { void }
  def input_type(); end
  sig { void }
  def result_class(); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
class Result
  sig { void }
  def client_mutation_id(); end
  # sord omit - no YARD type given for "client_mutation_id:", using T.untyped
  # sord omit - no YARD type given for "result:", using T.untyped
  sig { params(client_mutation_id: T.untyped, result: T.untyped).returns(Result) }
  def initialize(client_mutation_id:, result:); end
  sig { void }
  def self.mutation(); end
  # sord infer - inferred type of parameter "value" as T.any() using getter's return type
  sig { params(value: T.any()).void }
  def self.mutation=(value); end
  sig { params(mutation_defn: GraphQL::Relay::Mutation).returns(Class) }
  def self.define_subclass(mutation_defn); end
end
class Resolve
  # sord omit - no YARD type given for "mutation", using T.untyped
  # sord omit - no YARD type given for "resolve", using T.untyped
  sig { params(mutation: T.untyped, resolve: T.untyped).returns(Resolve) }
  def initialize(mutation, resolve); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
  # sord omit - no YARD type given for "mutation_result", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(mutation_result: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def build_result(mutation_result, args, ctx); end
end
module Instrumentation
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def self.instrument(type, field); end
end
end
module EdgeType
  # sord omit - no YARD type given for "wrapped_type", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(wrapped_type: T.untyped, name: T.untyped, block: T.untyped).void }
  def self.create_type(wrapped_type, name: nil, &block); end
end
class RangeAdd
  sig { void }
  def edge(); end
  sig { void }
  def connection(); end
  sig { void }
  def parent(); end
  # sord omit - no YARD type given for "collection:", using T.untyped
  # sord omit - no YARD type given for "item:", using T.untyped
  # sord omit - no YARD type given for "parent:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "edge_class:", using T.untyped
  sig { params(collection: T.untyped, item: T.untyped, parent: T.untyped, context: T.untyped, edge_class: T.untyped).returns(RangeAdd) }
  def initialize(collection:, item:, parent: nil, context: nil, edge_class: Relay::Edge); end
end
class BaseConnection
  # sord warn - "subclass of BaseConnection" does not appear to be a type
  sig { params(nodes: Object).returns(SORD_ERROR_subclassofBaseConnection) }
  def self.connection_for_nodes(nodes); end
  sig { params(nodes_class: Class, connection_class: Class).void }
  def self.register_connection_implementation(nodes_class, connection_class); end
  sig { void }
  def nodes(); end
  sig { void }
  def arguments(); end
  sig { void }
  def max_page_size(); end
  sig { void }
  def parent(); end
  sig { void }
  def field(); end
  sig { void }
  def context(); end
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "max_page_size:", using T.untyped
  # sord omit - no YARD type given for "parent:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(nodes: Object, arguments: GraphQL::Query::Arguments, field: T.untyped, max_page_size: T.untyped, parent: T.untyped, context: T.untyped).returns(BaseConnection) }
  def initialize(nodes, arguments, field: nil, max_page_size: nil, parent: nil, context: nil); end
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(data: T.untyped).void }
  def encode(data); end
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(data: T.untyped).void }
  def decode(data); end
  sig { returns(T.nilable(Integer)) }
  def first(); end
  sig { returns(T.nilable(String)) }
  def after(); end
  sig { returns(T.nilable(Integer)) }
  def last(); end
  sig { returns(T.nilable(String)) }
  def before(); end
  sig { void }
  def edge_nodes(); end
  sig { void }
  def page_info(); end
  sig { void }
  def has_next_page(); end
  sig { void }
  def has_previous_page(); end
  sig { void }
  def start_cursor(); end
  sig { void }
  def end_cursor(); end
  # sord omit - no YARD type given for "object", using T.untyped
  sig { params(object: T.untyped).void }
  def cursor_from_node(object); end
  sig { void }
  def inspect(); end
  # sord omit - no YARD type given for "arg_name", using T.untyped
  sig { params(arg_name: T.untyped).void }
  def get_limited_arg(arg_name); end
  sig { void }
  def paged_nodes(); end
  sig { void }
  def sliced_nodes(); end
end
module ConnectionType
  sig { returns(T::Boolean) }
  def self.default_nodes_field(); end
  # sord infer - inferred type of parameter "value" as T::Boolean using getter's return type
  sig { params(value: T::Boolean).returns(T::Boolean) }
  def self.default_nodes_field=(value); end
  sig { returns(T::Boolean) }
  def self.bidirectional_pagination(); end
  # sord infer - inferred type of parameter "value" as T::Boolean using getter's return type
  sig { params(value: T::Boolean).returns(T::Boolean) }
  def self.bidirectional_pagination=(value); end
  # sord omit - no YARD type given for "wrapped_type", using T.untyped
  # sord omit - no YARD type given for "edge_type:", using T.untyped
  # sord omit - no YARD type given for "edge_class:", using T.untyped
  # sord omit - no YARD type given for "nodes_field:", using T.untyped
  sig { params(wrapped_type: T.untyped, edge_type: T.untyped, edge_class: T.untyped, nodes_field: T.untyped, block: T.untyped).void }
  def self.create_type(wrapped_type, edge_type: nil, edge_class: GraphQL::Relay::Edge, nodes_field: ConnectionType.default_nodes_field, &block); end
end
module TypeExtensions
  sig { returns(GraphQL::ObjectType) }
  def connection_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  sig { returns(GraphQL::ObjectType) }
  def edge_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
end
class ArrayConnection < GraphQL::Relay::BaseConnection
  # sord omit - no YARD type given for "item", using T.untyped
  sig { params(item: T.untyped).void }
  def cursor_from_node(item); end
  sig { void }
  def has_next_page(); end
  sig { void }
  def has_previous_page(); end
  sig { void }
  def first(); end
  sig { void }
  def last(); end
  sig { void }
  def paged_nodes(); end
  sig { void }
  def sliced_nodes(); end
  # sord omit - no YARD type given for "cursor", using T.untyped
  sig { params(cursor: T.untyped).void }
  def index_from_cursor(cursor); end
  # sord warn - "subclass of BaseConnection" does not appear to be a type
  sig { params(nodes: Object).returns(SORD_ERROR_subclassofBaseConnection) }
  def self.connection_for_nodes(nodes); end
  sig { params(nodes_class: Class, connection_class: Class).void }
  def self.register_connection_implementation(nodes_class, connection_class); end
  sig { void }
  def nodes(); end
  sig { void }
  def arguments(); end
  sig { void }
  def max_page_size(); end
  sig { void }
  def parent(); end
  sig { void }
  def field(); end
  sig { void }
  def context(); end
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "max_page_size:", using T.untyped
  # sord omit - no YARD type given for "parent:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(nodes: Object, arguments: GraphQL::Query::Arguments, field: T.untyped, max_page_size: T.untyped, parent: T.untyped, context: T.untyped).returns(BaseConnection) }
  def initialize(nodes, arguments, field: nil, max_page_size: nil, parent: nil, context: nil); end
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(data: T.untyped).void }
  def encode(data); end
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(data: T.untyped).void }
  def decode(data); end
  sig { returns(T.nilable(String)) }
  def after(); end
  sig { returns(T.nilable(String)) }
  def before(); end
  sig { void }
  def edge_nodes(); end
  sig { void }
  def page_info(); end
  sig { void }
  def start_cursor(); end
  sig { void }
  def end_cursor(); end
  sig { void }
  def inspect(); end
  # sord omit - no YARD type given for "arg_name", using T.untyped
  sig { params(arg_name: T.untyped).void }
  def get_limited_arg(arg_name); end
end
class GlobalIdResolve
  # sord omit - no YARD type given for "type:", using T.untyped
  sig { params(type: T.untyped).returns(GlobalIdResolve) }
  def initialize(type:); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
end
class ConnectionResolve
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "underlying_resolve", using T.untyped
  sig { params(field: T.untyped, underlying_resolve: T.untyped).returns(ConnectionResolve) }
  def initialize(field, underlying_resolve); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
  # sord omit - no YARD type given for "nodes", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(nodes: T.untyped, args: T.untyped, parent: T.untyped, ctx: T.untyped).void }
  def build_connection(nodes, args, parent, ctx); end
end
class RelationConnection < GraphQL::Relay::BaseConnection
  # sord omit - no YARD type given for "item", using T.untyped
  sig { params(item: T.untyped).void }
  def cursor_from_node(item); end
  sig { void }
  def has_next_page(); end
  sig { void }
  def has_previous_page(); end
  sig { void }
  def first(); end
  sig { void }
  def last(); end
  sig { returns(Array) }
  def paged_nodes(); end
  sig { void }
  def paged_nodes_offset(); end
  # sord omit - no YARD type given for "relation", using T.untyped
  sig { params(relation: T.untyped).void }
  def relation_offset(relation); end
  # sord omit - no YARD type given for "relation", using T.untyped
  sig { params(relation: T.untyped).void }
  def relation_limit(relation); end
  # sord omit - no YARD type given for "relation", using T.untyped
  sig { params(relation: T.untyped).void }
  def relation_count(relation); end
  sig { void }
  def sliced_nodes(); end
  # sord omit - no YARD type given for "sliced_nodes", using T.untyped
  # sord omit - no YARD type given for "limit", using T.untyped
  sig { params(sliced_nodes: T.untyped, limit: T.untyped).void }
  def limit_nodes(sliced_nodes, limit); end
  sig { void }
  def sliced_nodes_count(); end
  # sord omit - no YARD type given for "cursor", using T.untyped
  sig { params(cursor: T.untyped).void }
  def offset_from_cursor(cursor); end
  # sord warn - "subclass of BaseConnection" does not appear to be a type
  sig { params(nodes: Object).returns(SORD_ERROR_subclassofBaseConnection) }
  def self.connection_for_nodes(nodes); end
  sig { params(nodes_class: Class, connection_class: Class).void }
  def self.register_connection_implementation(nodes_class, connection_class); end
  sig { void }
  def nodes(); end
  sig { void }
  def arguments(); end
  sig { void }
  def max_page_size(); end
  sig { void }
  def parent(); end
  sig { void }
  def field(); end
  sig { void }
  def context(); end
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "max_page_size:", using T.untyped
  # sord omit - no YARD type given for "parent:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(nodes: Object, arguments: GraphQL::Query::Arguments, field: T.untyped, max_page_size: T.untyped, parent: T.untyped, context: T.untyped).returns(BaseConnection) }
  def initialize(nodes, arguments, field: nil, max_page_size: nil, parent: nil, context: nil); end
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(data: T.untyped).void }
  def encode(data); end
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(data: T.untyped).void }
  def decode(data); end
  sig { returns(T.nilable(String)) }
  def after(); end
  sig { returns(T.nilable(String)) }
  def before(); end
  sig { void }
  def edge_nodes(); end
  sig { void }
  def page_info(); end
  sig { void }
  def start_cursor(); end
  sig { void }
  def end_cursor(); end
  sig { void }
  def inspect(); end
  # sord omit - no YARD type given for "arg_name", using T.untyped
  sig { params(arg_name: T.untyped).void }
  def get_limited_arg(arg_name); end
end
module EdgesInstrumentation
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def self.instrument(type, field); end
class EdgesResolve
  # sord omit - no YARD type given for "edge_class:", using T.untyped
  # sord omit - no YARD type given for "resolve:", using T.untyped
  sig { params(edge_class: T.untyped, resolve: T.untyped).returns(EdgesResolve) }
  def initialize(edge_class:, resolve:); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
end
end
class MongoRelationConnection < GraphQL::Relay::RelationConnection
  # sord omit - no YARD type given for "relation", using T.untyped
  sig { params(relation: T.untyped).void }
  def relation_offset(relation); end
  # sord omit - no YARD type given for "relation", using T.untyped
  sig { params(relation: T.untyped).void }
  def relation_limit(relation); end
  # sord omit - no YARD type given for "relation", using T.untyped
  sig { params(relation: T.untyped).void }
  def relation_count(relation); end
  # sord omit - no YARD type given for "sliced_nodes", using T.untyped
  # sord omit - no YARD type given for "limit", using T.untyped
  sig { params(sliced_nodes: T.untyped, limit: T.untyped).void }
  def limit_nodes(sliced_nodes, limit); end
  # sord omit - no YARD type given for "item", using T.untyped
  sig { params(item: T.untyped).void }
  def cursor_from_node(item); end
  sig { void }
  def has_next_page(); end
  sig { void }
  def has_previous_page(); end
  sig { void }
  def first(); end
  sig { void }
  def last(); end
  sig { returns(Array) }
  def paged_nodes(); end
  sig { void }
  def paged_nodes_offset(); end
  sig { void }
  def sliced_nodes(); end
  sig { void }
  def sliced_nodes_count(); end
  # sord omit - no YARD type given for "cursor", using T.untyped
  sig { params(cursor: T.untyped).void }
  def offset_from_cursor(cursor); end
  # sord warn - "subclass of BaseConnection" does not appear to be a type
  sig { params(nodes: Object).returns(SORD_ERROR_subclassofBaseConnection) }
  def self.connection_for_nodes(nodes); end
  sig { params(nodes_class: Class, connection_class: Class).void }
  def self.register_connection_implementation(nodes_class, connection_class); end
  sig { void }
  def nodes(); end
  sig { void }
  def arguments(); end
  sig { void }
  def max_page_size(); end
  sig { void }
  def parent(); end
  sig { void }
  def field(); end
  sig { void }
  def context(); end
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "max_page_size:", using T.untyped
  # sord omit - no YARD type given for "parent:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(nodes: Object, arguments: GraphQL::Query::Arguments, field: T.untyped, max_page_size: T.untyped, parent: T.untyped, context: T.untyped).returns(BaseConnection) }
  def initialize(nodes, arguments, field: nil, max_page_size: nil, parent: nil, context: nil); end
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(data: T.untyped).void }
  def encode(data); end
  # sord omit - no YARD type given for "data", using T.untyped
  sig { params(data: T.untyped).void }
  def decode(data); end
  sig { returns(T.nilable(String)) }
  def after(); end
  sig { returns(T.nilable(String)) }
  def before(); end
  sig { void }
  def edge_nodes(); end
  sig { void }
  def page_info(); end
  sig { void }
  def start_cursor(); end
  sig { void }
  def end_cursor(); end
  sig { void }
  def inspect(); end
  # sord omit - no YARD type given for "arg_name", using T.untyped
  sig { params(arg_name: T.untyped).void }
  def get_limited_arg(arg_name); end
end
module ConnectionInstrumentation
  sig { void }
  def self.default_arguments(); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def self.instrument(type, field); end
end
end
module TypeKinds
class TypeKind
  sig { void }
  def name(); end
  sig { void }
  def description(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "abstract:", using T.untyped
  # sord omit - no YARD type given for "fields:", using T.untyped
  # sord omit - no YARD type given for "wraps:", using T.untyped
  # sord omit - no YARD type given for "input:", using T.untyped
  # sord omit - no YARD type given for "description:", using T.untyped
  sig { params(name: T.untyped, abstract: T.untyped, fields: T.untyped, wraps: T.untyped, input: T.untyped, description: T.untyped).returns(TypeKind) }
  def initialize(name, abstract: false, fields: false, wraps: false, input: false, description: nil); end
  sig { returns(T::Boolean) }
  def resolves?(); end
  sig { returns(T::Boolean) }
  def abstract?(); end
  sig { returns(T::Boolean) }
  def fields?(); end
  sig { returns(T::Boolean) }
  def wraps?(); end
  sig { returns(T::Boolean) }
  def input?(); end
  sig { void }
  def to_s(); end
  sig { returns(T::Boolean) }
  def composite?(); end
  sig { returns(T::Boolean) }
  def scalar?(); end
  sig { returns(T::Boolean) }
  def object?(); end
  sig { returns(T::Boolean) }
  def interface?(); end
  sig { returns(T::Boolean) }
  def union?(); end
  sig { returns(T::Boolean) }
  def enum?(); end
  sig { returns(T::Boolean) }
  def input_object?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  sig { returns(T::Boolean) }
  def non_null?(); end
end
end
class UnionType < GraphQL::BaseType
  sig { void }
  def resolve_type_proc(); end
  sig { params(value: T.untyped).void }
  def resolve_type_proc=(value); end
  sig { returns(UnionType) }
  def initialize(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { void }
  def kind(); end
  # sord omit - no YARD type given for "child_type_defn", using T.untyped
  sig { params(child_type_defn: T.untyped).returns(T::Boolean) }
  def include?(child_type_defn); end
  # sord infer - inferred type of parameter "new_possible_types" as T::Array[GraphQL::ObjectType] using getter's return type
  sig { params(new_possible_types: T::Array[GraphQL::ObjectType]).void }
  def possible_types=(new_possible_types); end
  sig { returns(T::Array[GraphQL::ObjectType]) }
  def possible_types(); end
  sig { params(type_name: String, ctx: GraphQL::Query::Context).returns(T.nilable(GraphQL::ObjectType)) }
  def get_possible_type(type_name, ctx); end
  sig { params(type: T.any(String, GraphQL::BaseType), ctx: GraphQL::Query::Context).returns(T::Boolean) }
  def possible_type?(type, ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def resolve_type(value, ctx); end
  # sord infer - inferred type of parameter "new_resolve_type_proc" as T.any() using getter's return type
  sig { params(new_resolve_type_proc: T.any()).void }
  def resolve_type=(new_resolve_type_proc); end
  sig { void }
  def dirty_possible_types(); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { void }
  def graphql_definition(); end
  # sord infer - inferred type of parameter "name" as String using getter's return type
  sig { params(name: String).void }
  def name=(name); end
  sig { returns(T.nilable(String)) }
  def description(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def description=(value); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  sig { returns(T::Boolean) }
  def default_scalar?(); end
  sig { returns(T::Boolean) }
  def default_relay?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def introspection=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_scalar=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_relay=(value); end
  sig { params(other: GraphQL::BaseType).returns(T::Boolean) }
  def ==(other); end
  sig { void }
  def unwrap(); end
  sig { returns(GraphQL::NonNullType) }
  def to_non_null_type(); end
  sig { returns(GraphQL::ListType) }
  def to_list_type(); end
  sig { void }
  def to_s(); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_type_signature(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(T::Boolean) }
  def valid_isolated_input?(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def validate_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_result(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def valid_input?(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_result(value, ctx); end
  sig { params(name: String).returns(T.nilable(GraphQL::Field)) }
  def get_field(name); end
  # sord omit - no YARD type given for "type_arg", using T.untyped
  sig { params(type_arg: T.untyped).returns(GraphQL::BaseType) }
  def self.resolve_related_type(type_arg); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: GraphQL::Schema, printer: T.untyped, args: T.untyped).returns(String) }
  def to_definition(schema, printer: nil, **args); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  # sord omit - no YARD type given for "alt_method_name", using T.untyped
  sig { params(alt_method_name: T.untyped).void }
  def warn_deprecated_coerce(alt_method_name); end
  sig { returns(GraphQL::ObjectType) }
  def connection_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  sig { returns(GraphQL::ObjectType) }
  def edge_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
  sig { returns(GraphQL::NonNullType) }
  def !(); end
end
class ObjectType < GraphQL::BaseType
  sig { returns(T::Hash[String, GraphQL::Field]) }
  def fields(); end
  # sord infer - inferred type of parameter "value" as T::Hash[String, GraphQL::Field] using getter's return type
  sig { params(value: T::Hash[String, GraphQL::Field]).returns(T::Hash[String, GraphQL::Field]) }
  def fields=(value); end
  sig { returns(T.nilable(GraphQL::Relay::Mutation)) }
  def mutation(); end
  # sord infer - inferred type of parameter "value" as T.nilable(GraphQL::Relay::Mutation) using getter's return type
  sig { params(value: T.nilable(GraphQL::Relay::Mutation)).returns(T.nilable(GraphQL::Relay::Mutation)) }
  def mutation=(value); end
  sig { void }
  def relay_node_type(); end
  sig { params(value: T.untyped).void }
  def relay_node_type=(value); end
  sig { returns(ObjectType) }
  def initialize(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { params(new_interfaces: T::Array[GraphQL::Interface]).void }
  def interfaces=(new_interfaces); end
  sig { void }
  def interfaces(); end
  sig { void }
  def kind(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).returns(GraphQL::Field) }
  def get_field(field_name); end
  sig { returns(T::Array[GraphQL::Field]) }
  def all_fields(); end
  # sord omit - no YARD type given for "inherit:", using T.untyped
  sig { params(interfaces: T::Array[GraphQL::Interface], inherit: T.untyped).void }
  def implements(interfaces, inherit: false); end
  sig { void }
  def resolve_type_proc(); end
  sig { void }
  def dirty_interfaces(); end
  sig { void }
  def dirty_inherited_interfaces(); end
  # sord omit - no YARD type given for "ifaces", using T.untyped
  sig { params(ifaces: T.untyped).void }
  def normalize_interfaces(ifaces); end
  sig { void }
  def interface_fields(); end
  sig { void }
  def load_interfaces(); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { void }
  def graphql_definition(); end
  # sord infer - inferred type of parameter "name" as String using getter's return type
  sig { params(name: String).void }
  def name=(name); end
  sig { returns(T.nilable(String)) }
  def description(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def description=(value); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  sig { returns(T::Boolean) }
  def default_scalar?(); end
  sig { returns(T::Boolean) }
  def default_relay?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def introspection=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_scalar=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_relay=(value); end
  sig { params(other: GraphQL::BaseType).returns(T::Boolean) }
  def ==(other); end
  sig { void }
  def unwrap(); end
  sig { returns(GraphQL::NonNullType) }
  def to_non_null_type(); end
  sig { returns(GraphQL::ListType) }
  def to_list_type(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def resolve_type(value, ctx); end
  sig { void }
  def to_s(); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_type_signature(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(T::Boolean) }
  def valid_isolated_input?(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def validate_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_result(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def valid_input?(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_result(value, ctx); end
  # sord omit - no YARD type given for "type_arg", using T.untyped
  sig { params(type_arg: T.untyped).returns(GraphQL::BaseType) }
  def self.resolve_related_type(type_arg); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: GraphQL::Schema, printer: T.untyped, args: T.untyped).returns(String) }
  def to_definition(schema, printer: nil, **args); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  # sord omit - no YARD type given for "alt_method_name", using T.untyped
  sig { params(alt_method_name: T.untyped).void }
  def warn_deprecated_coerce(alt_method_name); end
  sig { returns(GraphQL::ObjectType) }
  def connection_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  sig { returns(GraphQL::ObjectType) }
  def edge_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
  sig { returns(GraphQL::NonNullType) }
  def !(); end
end
class ParseError < GraphQL::Error
  sig { void }
  def line(); end
  sig { void }
  def col(); end
  sig { void }
  def query(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "line", using T.untyped
  # sord omit - no YARD type given for "col", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "filename:", using T.untyped
  sig { params(message: T.untyped, line: T.untyped, col: T.untyped, query: T.untyped, filename: T.untyped).returns(ParseError) }
  def initialize(message, line, col, query, filename: nil); end
  sig { void }
  def to_h(); end
end
class ScalarType < GraphQL::BaseType
  sig { returns(ScalarType) }
  def initialize(); end
  # sord omit - no YARD type given for "proc", using T.untyped
  sig { params(proc: T.untyped).void }
  def coerce=(proc); end
  # sord omit - no YARD type given for "coerce_input_fn", using T.untyped
  sig { params(coerce_input_fn: T.untyped).void }
  def coerce_input=(coerce_input_fn); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_result(value, ctx = nil); end
  # sord infer - inferred type of parameter "coerce_result_fn" as T.any() using getter's return type
  sig { params(coerce_result_fn: T.any()).void }
  def coerce_result=(coerce_result_fn); end
  sig { void }
  def kind(); end
  # sord omit - no YARD type given for "callable", using T.untyped
  # sord omit - no YARD type given for "method_name", using T.untyped
  sig { params(callable: T.untyped, method_name: T.untyped).void }
  def ensure_two_arg(callable, method_name); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_non_null_input(value, ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def raw_coercion_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_non_null_input(value, ctx); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { void }
  def graphql_definition(); end
  # sord infer - inferred type of parameter "name" as String using getter's return type
  sig { params(name: String).void }
  def name=(name); end
  sig { returns(T.nilable(String)) }
  def description(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def description=(value); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  sig { returns(T::Boolean) }
  def default_scalar?(); end
  sig { returns(T::Boolean) }
  def default_relay?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def introspection=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_scalar=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_relay=(value); end
  sig { params(other: GraphQL::BaseType).returns(T::Boolean) }
  def ==(other); end
  sig { void }
  def unwrap(); end
  sig { returns(GraphQL::NonNullType) }
  def to_non_null_type(); end
  sig { returns(GraphQL::ListType) }
  def to_list_type(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def resolve_type(value, ctx); end
  sig { void }
  def to_s(); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_type_signature(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(T::Boolean) }
  def valid_isolated_input?(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def validate_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_result(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def valid_input?(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_input(value, ctx = nil); end
  sig { params(name: String).returns(T.nilable(GraphQL::Field)) }
  def get_field(name); end
  # sord omit - no YARD type given for "type_arg", using T.untyped
  sig { params(type_arg: T.untyped).returns(GraphQL::BaseType) }
  def self.resolve_related_type(type_arg); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: GraphQL::Schema, printer: T.untyped, args: T.untyped).returns(String) }
  def to_definition(schema, printer: nil, **args); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  # sord omit - no YARD type given for "alt_method_name", using T.untyped
  sig { params(alt_method_name: T.untyped).void }
  def warn_deprecated_coerce(alt_method_name); end
  sig { returns(GraphQL::ObjectType) }
  def connection_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  sig { returns(GraphQL::ObjectType) }
  def edge_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
  sig { returns(GraphQL::NonNullType) }
  def !(); end
module NoOpCoerce
  # sord omit - no YARD type given for "val", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(val: T.untyped, ctx: T.untyped).void }
  def self.call(val, ctx); end
end
end
module Analysis
  # sord omit - no YARD type given for "multiplex", using T.untyped
  # sord omit - no YARD type given for "analyzers", using T.untyped
  sig { params(multiplex: T.untyped, analyzers: T.untyped).void }
  def analyze_multiplex(multiplex, analyzers); end
  # sord omit - no YARD type given for "multiplex", using T.untyped
  # sord omit - no YARD type given for "analyzers", using T.untyped
  sig { params(multiplex: T.untyped, analyzers: T.untyped).void }
  def self.analyze_multiplex(multiplex, analyzers); end
  # sord duck - #call looks like a duck type, replacing with T.untyped
  # sord omit - no YARD type given for "multiplex_states:", using T.untyped
  sig { params(query: GraphQL::Query, analyzers: T::Array[T.untyped], multiplex_states: T.untyped).returns(T::Array[Any]) }
  def analyze_query(query, analyzers, multiplex_states: []); end
  # sord duck - #call looks like a duck type, replacing with T.untyped
  # sord omit - no YARD type given for "multiplex_states:", using T.untyped
  sig { params(query: GraphQL::Query, analyzers: T::Array[T.untyped], multiplex_states: T.untyped).returns(T::Array[Any]) }
  def self.analyze_query(query, analyzers, multiplex_states: []); end
  # sord omit - no YARD type given for "irep_node", using T.untyped
  # sord omit - no YARD type given for "reducer_states", using T.untyped
  sig { params(irep_node: T.untyped, reducer_states: T.untyped).void }
  def reduce_node(irep_node, reducer_states); end
  # sord omit - no YARD type given for "irep_node", using T.untyped
  # sord omit - no YARD type given for "reducer_states", using T.untyped
  sig { params(irep_node: T.untyped, reducer_states: T.untyped).void }
  def self.reduce_node(irep_node, reducer_states); end
  # sord omit - no YARD type given for "visit_type", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  # sord omit - no YARD type given for "reducer_states", using T.untyped
  sig { params(visit_type: T.untyped, irep_node: T.untyped, reducer_states: T.untyped).void }
  def visit_analyzers(visit_type, irep_node, reducer_states); end
  # sord omit - no YARD type given for "visit_type", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  # sord omit - no YARD type given for "reducer_states", using T.untyped
  sig { params(visit_type: T.untyped, irep_node: T.untyped, reducer_states: T.untyped).void }
  def self.visit_analyzers(visit_type, irep_node, reducer_states); end
  # sord omit - no YARD type given for "results", using T.untyped
  sig { params(results: T.untyped).void }
  def analysis_errors(results); end
  # sord omit - no YARD type given for "results", using T.untyped
  sig { params(results: T.untyped).void }
  def self.analysis_errors(results); end
module AST
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  sig { params(schema_defn: T.untyped).void }
  def use(schema_defn); end
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  sig { params(schema_defn: T.untyped).void }
  def self.use(schema_defn); end
  sig { params(multiplex: GraphQL::Execution::Multiplex, analyzers: T::Array[GraphQL::Analysis::AST::Analyzer]).void }
  def analyze_multiplex(multiplex, analyzers); end
  sig { params(multiplex: GraphQL::Execution::Multiplex, analyzers: T::Array[GraphQL::Analysis::AST::Analyzer]).void }
  def self.analyze_multiplex(multiplex, analyzers); end
  # sord omit - no YARD type given for "multiplex_analyzers:", using T.untyped
  sig { params(query: GraphQL::Query, analyzers: T::Array[GraphQL::Analysis::AST::Analyzer], multiplex_analyzers: T.untyped).returns(T::Array[Any]) }
  def analyze_query(query, analyzers, multiplex_analyzers: []); end
  # sord omit - no YARD type given for "multiplex_analyzers:", using T.untyped
  sig { params(query: GraphQL::Query, analyzers: T::Array[GraphQL::Analysis::AST::Analyzer], multiplex_analyzers: T.untyped).returns(T::Array[Any]) }
  def self.analyze_query(query, analyzers, multiplex_analyzers: []); end
  # sord omit - no YARD type given for "results", using T.untyped
  sig { params(results: T.untyped).void }
  def analysis_errors(results); end
  # sord omit - no YARD type given for "results", using T.untyped
  sig { params(results: T.untyped).void }
  def self.analysis_errors(results); end
class Visitor < GraphQL::Language::Visitor
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "analyzers:", using T.untyped
  sig { params(query: T.untyped, analyzers: T.untyped).returns(Visitor) }
  def initialize(query:, analyzers:); end
  sig { returns(GraphQL::Query) }
  def query(); end
  sig { returns(T::Array[GraphQL::ObjectType]) }
  def object_types(); end
  sig { void }
  def visit(); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "field_definition", using T.untyped
  sig { params(ast_node: T.untyped, field_definition: T.untyped).returns(GraphQL::Query::Arguments) }
  def arguments_for(ast_node, field_definition); end
  sig { returns(T::Boolean) }
  def visiting_fragment_definition?(); end
  sig { returns(T::Boolean) }
  def skipping?(); end
  sig { returns(T::Array[String]) }
  def response_path(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_operation_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_inline_fragment(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_field(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_directive(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_argument(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_spread(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_abstract_node(node, parent); end
  # sord omit - no YARD type given for "fragment_spread", using T.untyped
  sig { params(fragment_spread: T.untyped).void }
  def enter_fragment_spread_inline(fragment_spread); end
  # sord omit - no YARD type given for "_fragment_spread", using T.untyped
  sig { params(_fragment_spread: T.untyped).void }
  def leave_fragment_spread_inline(_fragment_spread); end
  sig { returns(GraphQL::BaseType) }
  def type_definition(); end
  sig { returns(GraphQL::BaseType) }
  def parent_type_definition(); end
  sig { returns(T.nilable(GraphQL::Field)) }
  def field_definition(); end
  sig { returns(T.nilable(GraphQL::Field)) }
  def previous_field_definition(); end
  sig { returns(T.nilable(GraphQL::Directive)) }
  def directive_definition(); end
  sig { returns(T.nilable(GraphQL::Argument)) }
  def argument_definition(); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(ast_node: T.untyped).returns(T::Boolean) }
  def skip?(ast_node); end
  # sord omit - no YARD type given for "method", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(method: T.untyped, node: T.untyped, parent: T.untyped).void }
  def call_analyzers(method, node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def on_fragment_with_type(node); end
  sig { returns(GraphQL::Language::Nodes::Document) }
  def result(); end
  sig { params(node_class: Class).returns(NodeVisitor) }
  def [](node_class); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def visit_node(node, parent); end
  # sord omit - no YARD type given for "node_method", using T.untyped
  sig { params(node_method: T.untyped).void }
  def self.make_visit_method(node_method); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_node_with_modifications(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def begin_visit(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def end_visit(node, parent); end
  # sord omit - no YARD type given for "hooks", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(hooks: T.untyped, node: T.untyped, parent: T.untyped).void }
  def self.apply_hooks(hooks, node, parent); end
end
class Analyzer
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).returns(Analyzer) }
  def initialize(query); end
  sig { returns(T::Boolean) }
  def analyze?(); end
  sig { returns(Any) }
  def result(); end
  # sord omit - no YARD type given for "member_name", using T.untyped
  sig { params(member_name: T.untyped).void }
  def self.build_visitor_hooks(member_name); end
  sig { void }
  def query(); end
end
class FieldUsage < GraphQL::Analysis::AST::Analyzer
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).returns(FieldUsage) }
  def initialize(query); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped, visitor: T.untyped).void }
  def on_leave_field(node, parent, visitor); end
  sig { void }
  def result(); end
  sig { returns(T::Boolean) }
  def analyze?(); end
  # sord omit - no YARD type given for "member_name", using T.untyped
  sig { params(member_name: T.untyped).void }
  def self.build_visitor_hooks(member_name); end
  sig { void }
  def query(); end
end
class QueryDepth < GraphQL::Analysis::AST::Analyzer
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).returns(QueryDepth) }
  def initialize(query); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped, visitor: T.untyped).void }
  def on_enter_field(node, parent, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped, visitor: T.untyped).void }
  def on_leave_field(node, parent, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, _: T.untyped, visitor: T.untyped).void }
  def on_enter_fragment_spread(node, _, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, _: T.untyped, visitor: T.untyped).void }
  def on_leave_fragment_spread(node, _, visitor); end
  sig { void }
  def result(); end
  sig { returns(T::Boolean) }
  def analyze?(); end
  # sord omit - no YARD type given for "member_name", using T.untyped
  sig { params(member_name: T.untyped).void }
  def self.build_visitor_hooks(member_name); end
  sig { void }
  def query(); end
end
class MaxQueryDepth < GraphQL::Analysis::AST::QueryDepth
  sig { void }
  def result(); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).returns(QueryDepth) }
  def initialize(query); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped, visitor: T.untyped).void }
  def on_enter_field(node, parent, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped, visitor: T.untyped).void }
  def on_leave_field(node, parent, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, _: T.untyped, visitor: T.untyped).void }
  def on_enter_fragment_spread(node, _, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, _: T.untyped, visitor: T.untyped).void }
  def on_leave_fragment_spread(node, _, visitor); end
  sig { returns(T::Boolean) }
  def analyze?(); end
  # sord omit - no YARD type given for "member_name", using T.untyped
  sig { params(member_name: T.untyped).void }
  def self.build_visitor_hooks(member_name); end
  sig { void }
  def query(); end
end
class QueryComplexity < GraphQL::Analysis::AST::Analyzer
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).returns(QueryComplexity) }
  def initialize(query); end
  sig { void }
  def result(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped, visitor: T.untyped).void }
  def on_enter_field(node, parent, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped, visitor: T.untyped).void }
  def on_leave_field(node, parent, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, _: T.untyped, visitor: T.untyped).void }
  def on_enter_fragment_spread(node, _, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, _: T.untyped, visitor: T.untyped).void }
  def on_leave_fragment_spread(node, _, visitor); end
  sig { returns(Integer) }
  def max_possible_complexity(); end
  # sord omit - no YARD type given for "response_path", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(response_path: T.untyped, query: T.untyped).void }
  def selection_key(response_path, query); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "field_defn", using T.untyped
  # sord omit - no YARD type given for "child_complexity", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(ast_node: T.untyped, field_defn: T.untyped, child_complexity: T.untyped, visitor: T.untyped).void }
  def get_complexity(ast_node, field_defn, child_complexity, visitor); end
  sig { returns(T::Boolean) }
  def analyze?(); end
  # sord omit - no YARD type given for "member_name", using T.untyped
  sig { params(member_name: T.untyped).void }
  def self.build_visitor_hooks(member_name); end
  sig { void }
  def query(); end
class TypeComplexity
  sig { returns(TypeComplexity) }
  def initialize(); end
  sig { void }
  def max_possible_complexity(); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "complexity", using T.untyped
  sig { params(type_defn: T.untyped, key: T.untyped, complexity: T.untyped).void }
  def merge(type_defn, key, complexity); end
end
end
class MaxQueryComplexity < GraphQL::Analysis::AST::QueryComplexity
  sig { void }
  def result(); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).returns(QueryComplexity) }
  def initialize(query); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped, visitor: T.untyped).void }
  def on_enter_field(node, parent, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped, visitor: T.untyped).void }
  def on_leave_field(node, parent, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, _: T.untyped, visitor: T.untyped).void }
  def on_enter_fragment_spread(node, _, visitor); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(node: T.untyped, _: T.untyped, visitor: T.untyped).void }
  def on_leave_fragment_spread(node, _, visitor); end
  sig { returns(Integer) }
  def max_possible_complexity(); end
  # sord omit - no YARD type given for "response_path", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(response_path: T.untyped, query: T.untyped).void }
  def selection_key(response_path, query); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "field_defn", using T.untyped
  # sord omit - no YARD type given for "child_complexity", using T.untyped
  # sord omit - no YARD type given for "visitor", using T.untyped
  sig { params(ast_node: T.untyped, field_defn: T.untyped, child_complexity: T.untyped, visitor: T.untyped).void }
  def get_complexity(ast_node, field_defn, child_complexity, visitor); end
  sig { returns(T::Boolean) }
  def analyze?(); end
  # sord omit - no YARD type given for "member_name", using T.untyped
  sig { params(member_name: T.untyped).void }
  def self.build_visitor_hooks(member_name); end
  sig { void }
  def query(); end
end
end
class FieldUsage
  sig { params(block: T.untyped).returns(FieldUsage) }
  def initialize(&block); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def initial_value(query); end
  # sord omit - no YARD type given for "memo", using T.untyped
  # sord omit - no YARD type given for "visit_type", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  sig { params(memo: T.untyped, visit_type: T.untyped, irep_node: T.untyped).void }
  def call(memo, visit_type, irep_node); end
  # sord omit - no YARD type given for "memo", using T.untyped
  sig { params(memo: T.untyped).void }
  def final_value(memo); end
end
class QueryDepth
  sig { params(block: T.untyped).returns(QueryDepth) }
  def initialize(&block); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def initial_value(query); end
  # sord omit - no YARD type given for "memo", using T.untyped
  # sord omit - no YARD type given for "visit_type", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  sig { params(memo: T.untyped, visit_type: T.untyped, irep_node: T.untyped).void }
  def call(memo, visit_type, irep_node); end
  # sord omit - no YARD type given for "memo", using T.untyped
  sig { params(memo: T.untyped).void }
  def final_value(memo); end
end
class ReducerState
  sig { void }
  def reducer(); end
  sig { void }
  def memo(); end
  sig { params(value: T.untyped).void }
  def memo=(value); end
  sig { void }
  def errors(); end
  sig { params(value: T.untyped).void }
  def errors=(value); end
  # sord omit - no YARD type given for "reducer", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(reducer: T.untyped, query: T.untyped).returns(ReducerState) }
  def initialize(reducer, query); end
  # sord omit - no YARD type given for "visit_type", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  sig { params(visit_type: T.untyped, irep_node: T.untyped).void }
  def call(visit_type, irep_node); end
  sig { returns(Any) }
  def finalize_reducer(); end
  # sord omit - no YARD type given for "reducer", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(reducer: T.untyped, query: T.untyped).returns(Any) }
  def initialize_reducer(reducer, query); end
end
class MaxQueryDepth < GraphQL::Analysis::QueryDepth
  # sord omit - no YARD type given for "max_depth", using T.untyped
  sig { params(max_depth: T.untyped).returns(MaxQueryDepth) }
  def initialize(max_depth); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def initial_value(query); end
  # sord omit - no YARD type given for "memo", using T.untyped
  # sord omit - no YARD type given for "visit_type", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  sig { params(memo: T.untyped, visit_type: T.untyped, irep_node: T.untyped).void }
  def call(memo, visit_type, irep_node); end
  # sord omit - no YARD type given for "memo", using T.untyped
  sig { params(memo: T.untyped).void }
  def final_value(memo); end
end
class QueryComplexity
  sig { params(block: T.untyped).returns(QueryComplexity) }
  def initialize(&block); end
  # sord omit - no YARD type given for "target", using T.untyped
  sig { params(target: T.untyped).void }
  def initial_value(target); end
  # sord omit - no YARD type given for "memo", using T.untyped
  # sord omit - no YARD type given for "visit_type", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  sig { params(memo: T.untyped, visit_type: T.untyped, irep_node: T.untyped).void }
  def call(memo, visit_type, irep_node); end
  # sord omit - no YARD type given for "reduced_value", using T.untyped
  sig { params(reduced_value: T.untyped).returns(T.any(Object, GraphQL::AnalysisError)) }
  def final_value(reduced_value); end
  # sord omit - no YARD type given for "irep_node", using T.untyped
  # sord omit - no YARD type given for "child_complexity", using T.untyped
  sig { params(irep_node: T.untyped, child_complexity: T.untyped).void }
  def get_complexity(irep_node, child_complexity); end
class TypeComplexity
  sig { returns(TypeComplexity) }
  def initialize(); end
  sig { void }
  def max_possible_complexity(); end
  # sord omit - no YARD type given for "type_defn", using T.untyped
  # sord omit - no YARD type given for "complexity", using T.untyped
  sig { params(type_defn: T.untyped, complexity: T.untyped).void }
  def merge(type_defn, complexity); end
end
end
class MaxQueryComplexity < GraphQL::Analysis::QueryComplexity
  # sord omit - no YARD type given for "max_complexity", using T.untyped
  sig { params(max_complexity: T.untyped).returns(MaxQueryComplexity) }
  def initialize(max_complexity); end
  # sord omit - no YARD type given for "target", using T.untyped
  sig { params(target: T.untyped).void }
  def initial_value(target); end
  # sord omit - no YARD type given for "memo", using T.untyped
  # sord omit - no YARD type given for "visit_type", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  sig { params(memo: T.untyped, visit_type: T.untyped, irep_node: T.untyped).void }
  def call(memo, visit_type, irep_node); end
  # sord omit - no YARD type given for "reduced_value", using T.untyped
  sig { params(reduced_value: T.untyped).returns(T.any(Object, GraphQL::AnalysisError)) }
  def final_value(reduced_value); end
  # sord omit - no YARD type given for "irep_node", using T.untyped
  # sord omit - no YARD type given for "child_complexity", using T.untyped
  sig { params(irep_node: T.untyped, child_complexity: T.untyped).void }
  def get_complexity(irep_node, child_complexity); end
end
end
module Authorization
class InaccessibleFieldsError < GraphQL::AnalysisError
  sig { returns(T::Array[T.any(Schema::Field, GraphQL::Field)]) }
  def fields(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { returns(T::Array[GraphQL::InternalRepresentation::Node]) }
  def irep_nodes(); end
  # sord omit - no YARD type given for "fields:", using T.untyped
  # sord omit - no YARD type given for "irep_nodes:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(fields: T.untyped, irep_nodes: T.untyped, context: T.untyped).returns(InaccessibleFieldsError) }
  def initialize(fields:, irep_nodes:, context:); end
  sig { returns(GraphQL::Language::Nodes::Field) }
  def ast_node(); end
  # sord infer - inferred type of parameter "value" as GraphQL::Language::Nodes::Field using getter's return type
  sig { params(value: GraphQL::Language::Nodes::Field).returns(GraphQL::Language::Nodes::Field) }
  def ast_node=(value); end
  sig { returns(String) }
  def path(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def path=(value); end
  sig { returns(Hash) }
  def options(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def options=(value); end
  sig { returns(Hash) }
  def extensions(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def extensions=(value); end
  sig { returns(Hash) }
  def to_h(); end
end
module Analyzer
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def initial_value(query); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def self.initial_value(query); end
  # sord omit - no YARD type given for "memo", using T.untyped
  # sord omit - no YARD type given for "visit_type", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  sig { params(memo: T.untyped, visit_type: T.untyped, irep_node: T.untyped).void }
  def call(memo, visit_type, irep_node); end
  # sord omit - no YARD type given for "memo", using T.untyped
  # sord omit - no YARD type given for "visit_type", using T.untyped
  # sord omit - no YARD type given for "irep_node", using T.untyped
  sig { params(memo: T.untyped, visit_type: T.untyped, irep_node: T.untyped).void }
  def self.call(memo, visit_type, irep_node); end
  # sord omit - no YARD type given for "memo", using T.untyped
  sig { params(memo: T.untyped).void }
  def final_value(memo); end
  # sord omit - no YARD type given for "memo", using T.untyped
  sig { params(memo: T.untyped).void }
  def self.final_value(memo); end
end
end
module Introspection
class TypeType < GraphQL::Introspection::BaseObject
  sig { void }
  def name(); end
  sig { void }
  def kind(); end
  # sord omit - no YARD type given for "include_deprecated:", using T.untyped
  sig { params(include_deprecated: T.untyped).void }
  def enum_values(include_deprecated:); end
  sig { void }
  def interfaces(); end
  sig { void }
  def input_fields(); end
  sig { void }
  def possible_types(); end
  # sord omit - no YARD type given for "include_deprecated:", using T.untyped
  sig { params(include_deprecated: T.untyped).void }
  def fields(include_deprecated:); end
  sig { void }
  def of_type(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { returns(GraphQL::ObjectType) }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class FieldType < GraphQL::Introspection::BaseObject
  sig { void }
  def is_deprecated(); end
  sig { void }
  def args(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { returns(GraphQL::ObjectType) }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class BaseObject < GraphQL::Schema::Object
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { returns(GraphQL::ObjectType) }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class SchemaType < GraphQL::Introspection::BaseObject
  sig { void }
  def types(); end
  sig { void }
  def query_type(); end
  sig { void }
  def mutation_type(); end
  sig { void }
  def subscription_type(); end
  sig { void }
  def directives(); end
  # sord omit - no YARD type given for "op_type", using T.untyped
  sig { params(op_type: T.untyped).void }
  def permitted_root_type(op_type); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { returns(GraphQL::ObjectType) }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class EntryPoints < GraphQL::Introspection::BaseObject
  sig { void }
  def __schema(); end
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(name: T.untyped).void }
  def __type(name:); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { returns(GraphQL::ObjectType) }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class DirectiveType < GraphQL::Introspection::BaseObject
  sig { void }
  def args(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { returns(GraphQL::ObjectType) }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class DynamicFields < GraphQL::Introspection::BaseObject
  # sord omit - no YARD type given for "irep_node:", using T.untyped
  sig { params(irep_node: T.untyped).void }
  def __typename(irep_node: nil); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { returns(GraphQL::ObjectType) }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class TypeKindEnum < GraphQL::Schema::Enum
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.value(*args, **kwargs, &block); end
  sig { returns(T::Hash[String, GraphQL::Schema::Enum::Value]) }
  def self.values(); end
  sig { returns(GraphQL::EnumType) }
  def self.to_graphql(); end
  # sord omit - no YARD type given for "new_enum_value_class", using T.untyped
  sig { params(new_enum_value_class: T.untyped).returns(Class) }
  def self.enum_value_class(new_enum_value_class = nil); end
  sig { void }
  def self.kind(); end
  sig { void }
  def self.own_values(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class EnumValueType < GraphQL::Introspection::BaseObject
  sig { void }
  def name(); end
  sig { void }
  def is_deprecated(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { returns(GraphQL::ObjectType) }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class InputValueType < GraphQL::Introspection::BaseObject
  sig { void }
  def default_value(); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.field(*args, **kwargs, &block); end
  # sord omit - no YARD type given for "child_class", using T.untyped
  sig { params(child_class: T.untyped).void }
  def self.inherited(child_class); end
  sig { returns(Object) }
  def object(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { params(object: Object, context: GraphQL::Query::Context).returns(T.any(GraphQL::Schema::Object, GraphQL::Execution::Lazy)) }
  def self.authorized_new(object, context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(Object) }
  def initialize(object, context); end
  # sord omit - no YARD type given for "new_interfaces", using T.untyped
  sig { params(new_interfaces: T.untyped).void }
  def self.implements(*new_interfaces); end
  sig { void }
  def self.interfaces(); end
  sig { void }
  def self.own_interfaces(); end
  sig { void }
  def self.fields(); end
  sig { returns(GraphQL::ObjectType) }
  def self.to_graphql(); end
  sig { void }
  def self.kind(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.get_field(field_name); end
  sig { params(field_defn: GraphQL::Schema::Field).void }
  def self.add_field(field_defn); end
  # sord omit - no YARD type given for "new_field_class", using T.untyped
  sig { params(new_field_class: T.untyped).returns(Class) }
  def self.field_class(new_field_class = nil); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).void }
  def self.global_id_field(field_name); end
  sig { returns(T::Array[GraphQL::Schema::Field]) }
  def self.own_fields(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
class DirectiveLocationEnum < GraphQL::Schema::Enum
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(args: T.untyped, kwargs: T.untyped, block: T.untyped).void }
  def self.value(*args, **kwargs, &block); end
  sig { returns(T::Hash[String, GraphQL::Schema::Enum::Value]) }
  def self.values(); end
  sig { returns(GraphQL::EnumType) }
  def self.to_graphql(); end
  # sord omit - no YARD type given for "new_enum_value_class", using T.untyped
  sig { params(new_enum_value_class: T.untyped).returns(Class) }
  def self.enum_value_class(new_enum_value_class = nil); end
  sig { void }
  def self.kind(); end
  sig { void }
  def self.own_values(); end
  sig { returns(String) }
  def self.path(); end
  # sord omit - no YARD type given for "new_edge_type_class", using T.untyped
  sig { params(new_edge_type_class: T.untyped).void }
  def self.edge_type_class(new_edge_type_class = nil); end
  # sord omit - no YARD type given for "new_connection_type_class", using T.untyped
  sig { params(new_connection_type_class: T.untyped).void }
  def self.connection_type_class(new_connection_type_class = nil); end
  sig { void }
  def self.edge_type(); end
  sig { void }
  def self.connection_type(); end
  sig { params(items: Object, context: GraphQL::Query::Context).returns(Object) }
  def self.scope_items(items, context); end
  sig { returns(Schema::NonNull) }
  def self.to_non_null_type(); end
  sig { returns(Schema::List) }
  def self.to_list_type(); end
  sig { returns(T::Boolean) }
  def self.non_null?(); end
  sig { returns(T::Boolean) }
  def self.list?(); end
  sig { void }
  def self.to_type_signature(); end
  sig { params(new_name: String).returns(String) }
  def self.graphql_name(new_name = nil); end
  # sord omit - no YARD type given for "new_name", using T.untyped
  sig { params(new_name: T.untyped).void }
  def self.name(new_name = nil); end
  sig { params(new_description: String).returns(String) }
  def self.description(new_description = nil); end
  # sord omit - no YARD type given for "new_introspection", using T.untyped
  sig { params(new_introspection: T.untyped).returns(T::Boolean) }
  def self.introspection(new_introspection = nil); end
  sig { returns(T::Boolean) }
  def self.introspection?(); end
  # sord omit - no YARD type given for "mutation_class", using T.untyped
  sig { params(mutation_class: T.untyped).returns(Class) }
  def self.mutation(mutation_class = nil); end
  sig { void }
  def self.unwrap(); end
  sig { void }
  def self.overridden_graphql_name(); end
  sig { void }
  def self.default_graphql_name(); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.visible?(context); end
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(context: T.untyped).returns(T::Boolean) }
  def self.accessible?(context); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(object: T.untyped, context: T.untyped).returns(T::Boolean) }
  def self.authorized?(object, context); end
  # sord omit - no YARD type given for "method_name", using T.untyped
  # sord omit - no YARD type given for "default_value", using T.untyped
  sig { params(method_name: T.untyped, default_value: T.untyped).void }
  def self.find_inherited_method(method_name, default_value); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_connection(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def self.define_edge(**kwargs, &block); end
  sig { void }
  def self.graphql_definition(); end
  # sord omit - no YARD type given for "original", using T.untyped
  sig { params(original: T.untyped).void }
  def self.initialize_copy(original); end
end
end
class DoubleNonNullTypeError < GraphQL::Error
end
class NonNullType < GraphQL::BaseType
  extend GraphQL::BaseType::ModifiesAnotherType
  include Forwardable
  sig { void }
  def of_type(); end
  # sord omit - no YARD type given for "of_type:", using T.untyped
  sig { params(of_type: T.untyped).returns(NonNullType) }
  def initialize(of_type:); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def valid_input?(value, ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_input(value, ctx); end
  sig { void }
  def kind(); end
  sig { void }
  def to_s(); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_type_signature(); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { void }
  def unwrap(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def ==(other); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { void }
  def graphql_definition(); end
  # sord infer - inferred type of parameter "name" as String using getter's return type
  sig { params(name: String).void }
  def name=(name); end
  sig { returns(T.nilable(String)) }
  def description(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def description=(value); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  sig { returns(T::Boolean) }
  def default_scalar?(); end
  sig { returns(T::Boolean) }
  def default_relay?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def introspection=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_scalar=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_relay=(value); end
  sig { returns(GraphQL::NonNullType) }
  def to_non_null_type(); end
  sig { returns(GraphQL::ListType) }
  def to_list_type(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def resolve_type(value, ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(T::Boolean) }
  def valid_isolated_input?(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def validate_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_result(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_result(value, ctx); end
  sig { params(name: String).returns(T.nilable(GraphQL::Field)) }
  def get_field(name); end
  # sord omit - no YARD type given for "type_arg", using T.untyped
  sig { params(type_arg: T.untyped).returns(GraphQL::BaseType) }
  def self.resolve_related_type(type_arg); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: GraphQL::Schema, printer: T.untyped, args: T.untyped).returns(String) }
  def to_definition(schema, printer: nil, **args); end
  sig { returns(T::Boolean) }
  def list?(); end
  # sord omit - no YARD type given for "alt_method_name", using T.untyped
  sig { params(alt_method_name: T.untyped).void }
  def warn_deprecated_coerce(alt_method_name); end
  sig { returns(GraphQL::ObjectType) }
  def connection_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  sig { returns(GraphQL::ObjectType) }
  def edge_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
  sig { returns(GraphQL::NonNullType) }
  def !(); end
end
class Subscriptions
  # sord omit - no YARD type given for "defn", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(defn: T.untyped, options: T.untyped).void }
  def self.use(defn, options = {}); end
  # sord omit - no YARD type given for "schema:", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  sig { params(schema: T.untyped, rest: T.untyped).returns(Subscriptions) }
  def initialize(schema:, **rest); end
  # sord warn - "Hash<String, Symbol => Object]" does not appear to be a type
  # sord omit - no YARD type given for "scope:", using T.untyped
  sig { params(event_name: String, args: SORD_ERROR_HashStringSymbolObject, object: Object, scope: T.untyped).void }
  def trigger(event_name, args, object, scope: nil); end
  sig { params(subscription_id: String, event: GraphQL::Subscriptions::Event, object: Object).void }
  def execute(subscription_id, event, object); end
  sig { params(event: Subscriptions::Event, object: Object).void }
  def execute_all(event, object); end
  sig { params(event: GraphQL::Subscriptions::Event).void }
  def each_subscription_id(event); end
  sig { params(subscription_id: String).returns(Hash) }
  def read_subscription(subscription_id); end
  sig { params(subscription_id: String, result: Hash).void }
  def deliver(subscription_id, result); end
  sig { params(query: GraphQL::Query, events: T::Array[GraphQL::Subscriptions::Event]).void }
  def write_subscription(query, events); end
  sig { params(subscription_id: String).returns(T.untyped) }
  def delete_subscription(subscription_id); end
  sig { returns(String) }
  def build_id(); end
  sig { params(event_or_arg_name: T.any(String, Symbol)).returns(String) }
  def normalize_name(event_or_arg_name); end
  # sord omit - no YARD type given for "event_name", using T.untyped
  sig { params(event_name: T.untyped, arg_owner: T.any(GraphQL::Field, GraphQL::BaseType), args: T.any(Hash, Array, Any)).returns(Any) }
  def normalize_arguments(event_name, arg_owner, args); end
class InvalidTriggerError < GraphQL::Error
end
class Event
  sig { returns(String) }
  def name(); end
  sig { returns(GraphQL::Query::Arguments) }
  def arguments(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  sig { returns(String) }
  def topic(); end
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "scope:", using T.untyped
  sig { params(name: T.untyped, arguments: T.untyped, field: T.untyped, context: T.untyped, scope: T.untyped).returns(Event) }
  def initialize(name:, arguments:, field: nil, context: nil, scope: nil); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "scope:", using T.untyped
  sig { params(name: T.untyped, arguments: T.untyped, field: T.untyped, scope: T.untyped).returns(String) }
  def self.serialize(name, arguments, field, scope:); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def self.stringify_args(args); end
end
module Serialize
  sig { params(str: String).returns(Object) }
  def load(str); end
  sig { params(str: String).returns(Object) }
  def self.load(str); end
  sig { params(obj: Object).returns(String) }
  def dump(obj); end
  sig { params(obj: Object).returns(String) }
  def self.dump(obj); end
  sig { params(obj: Object).returns(String) }
  def dump_recursive(obj); end
  sig { params(obj: Object).returns(String) }
  def self.dump_recursive(obj); end
  sig { params(value: Object).returns(Object) }
  def self.load_value(value); end
  sig { params(obj: Object).returns(Object) }
  def self.dump_value(obj); end
end
class Instrumentation
  # sord omit - no YARD type given for "schema:", using T.untyped
  sig { params(schema: T.untyped).returns(Instrumentation) }
  def initialize(schema:); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def instrument(type, field); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def before_query(query); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def after_query(query); end
class SubscriptionRegistrationResolve
  # sord omit - no YARD type given for "inner_proc", using T.untyped
  sig { params(inner_proc: T.untyped).returns(SubscriptionRegistrationResolve) }
  def initialize(inner_proc); end
  # sord omit - no YARD type given for "obj", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(obj: T.untyped, args: T.untyped, ctx: T.untyped).void }
  def call(obj, args, ctx); end
end
end
module SubscriptionRoot
  # sord omit - no YARD type given for "child_cls", using T.untyped
  sig { params(child_cls: T.untyped).void }
  def self.extended(child_cls); end
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "extensions:", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  sig { params(args: T.untyped, extensions: T.untyped, rest: T.untyped, block: T.untyped).void }
  def field(*args, extensions: [], **rest, &block); end
module InstanceMethods
  sig { void }
  def skip_subscription_root(); end
end
class Extension < GraphQL::Schema::FieldExtension
  # sord omit - no YARD type given for "value:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  sig { params(value: T.untyped, context: T.untyped, object: T.untyped, arguments: T.untyped, rest: T.untyped).void }
  def after_resolve(value:, context:, object:, arguments:, **rest); end
  sig { returns(GraphQL::Schema::Field) }
  def field(); end
  sig { returns(Object) }
  def options(); end
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "options:", using T.untyped
  sig { params(field: T.untyped, options: T.untyped).returns(FieldExtension) }
  def initialize(field:, options:); end
  sig { void }
  def apply(); end
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(object: T.untyped, arguments: T.untyped, context: T.untyped).returns(Object) }
  def resolve(object:, arguments:, context:); end
end
end
class ActionCableSubscriptions < GraphQL::Subscriptions
  # sord omit - no YARD type given for "serializer:", using T.untyped
  # sord omit - no YARD type given for "rest", using T.untyped
  sig { params(serializer: T.untyped, rest: T.untyped).returns(ActionCableSubscriptions) }
  def initialize(serializer: Serialize, **rest); end
  # sord omit - no YARD type given for "event", using T.untyped
  # sord omit - no YARD type given for "object", using T.untyped
  sig { params(event: T.untyped, object: T.untyped).void }
  def execute_all(event, object); end
  # sord omit - no YARD type given for "subscription_id", using T.untyped
  # sord omit - no YARD type given for "result", using T.untyped
  sig { params(subscription_id: T.untyped, result: T.untyped).void }
  def deliver(subscription_id, result); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "events", using T.untyped
  sig { params(query: T.untyped, events: T.untyped).void }
  def write_subscription(query, events); end
  # sord omit - no YARD type given for "subscription_id", using T.untyped
  sig { params(subscription_id: T.untyped).void }
  def read_subscription(subscription_id); end
  # sord omit - no YARD type given for "subscription_id", using T.untyped
  sig { params(subscription_id: T.untyped).void }
  def delete_subscription(subscription_id); end
  # sord omit - no YARD type given for "defn", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(defn: T.untyped, options: T.untyped).void }
  def self.use(defn, options = {}); end
  # sord warn - "Hash<String, Symbol => Object]" does not appear to be a type
  # sord omit - no YARD type given for "scope:", using T.untyped
  sig { params(event_name: String, args: SORD_ERROR_HashStringSymbolObject, object: Object, scope: T.untyped).void }
  def trigger(event_name, args, object, scope: nil); end
  sig { params(subscription_id: String, event: GraphQL::Subscriptions::Event, object: Object).void }
  def execute(subscription_id, event, object); end
  sig { params(event: GraphQL::Subscriptions::Event).void }
  def each_subscription_id(event); end
  sig { returns(String) }
  def build_id(); end
  sig { params(event_or_arg_name: T.any(String, Symbol)).returns(String) }
  def normalize_name(event_or_arg_name); end
  # sord omit - no YARD type given for "event_name", using T.untyped
  sig { params(event_name: T.untyped, arg_owner: T.any(GraphQL::Field, GraphQL::BaseType), args: T.any(Hash, Array, Any)).returns(Any) }
  def normalize_arguments(event_name, arg_owner, args); end
end
end
class AnalysisError < GraphQL::ExecutionError
  sig { returns(GraphQL::Language::Nodes::Field) }
  def ast_node(); end
  # sord infer - inferred type of parameter "value" as GraphQL::Language::Nodes::Field using getter's return type
  sig { params(value: GraphQL::Language::Nodes::Field).returns(GraphQL::Language::Nodes::Field) }
  def ast_node=(value); end
  sig { returns(String) }
  def path(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def path=(value); end
  sig { returns(Hash) }
  def options(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def options=(value); end
  sig { returns(Hash) }
  def extensions(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def extensions=(value); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "ast_node:", using T.untyped
  # sord omit - no YARD type given for "options:", using T.untyped
  # sord omit - no YARD type given for "extensions:", using T.untyped
  sig { params(message: T.untyped, ast_node: T.untyped, options: T.untyped, extensions: T.untyped).returns(ExecutionError) }
  def initialize(message, ast_node: nil, options: nil, extensions: nil); end
  sig { returns(Hash) }
  def to_h(); end
end
class CoercionError < GraphQL::Error
end
module DeprecatedDSL
  sig { void }
  def self.activate(); end
module Methods
  sig { void }
  def !(); end
end
end
module Execution
class Lazy
  sig { params(val: Object).returns(T.untyped) }
  def self.resolve(val); end
  sig { void }
  def path(); end
  sig { void }
  def field(); end
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "field:", using T.untyped
  sig { params(path: T.untyped, field: T.untyped, get_value_func: T.untyped).returns(Lazy) }
  def initialize(path: nil, field: nil, &get_value_func); end
  sig { returns(Object) }
  def value(); end
  sig { returns(Lazy) }
  def then(); end
  sig { params(lazies: T::Array[Object]).returns(Lazy) }
  def self.all(lazies); end
module Resolve
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def self.resolve(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def self.resolve_in_place(value); end
  # sord omit - no YARD type given for "acc", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(acc: T.untyped, value: T.untyped).void }
  def self.each_lazy(acc, value); end
  # sord omit - no YARD type given for "val", using T.untyped
  sig { params(val: T.untyped).void }
  def self.deep_sync(val); end
module NullAccumulator
  # sord omit - no YARD type given for "item", using T.untyped
  sig { params(item: T.untyped).void }
  def self.<<(item); end
  sig { returns(T::Boolean) }
  def self.empty?(); end
end
end
class LazyMethodMap
  # sord omit - no YARD type given for "use_concurrent:", using T.untyped
  sig { params(use_concurrent: T.untyped).returns(LazyMethodMap) }
  def initialize(use_concurrent: defined?(Concurrent::Map)); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { params(lazy_class: Class, lazy_value_method: Symbol).void }
  def set(lazy_class, lazy_value_method); end
  sig { params(value: Object).returns(T.nilable(Symbol)) }
  def get(value); end
  sig { void }
  def storage(); end
  # sord omit - no YARD type given for "value_class", using T.untyped
  sig { params(value_class: T.untyped).void }
  def find_superclass_method(value_class); end
class ConcurrentishMap
  include Forwardable
  sig { returns(ConcurrentishMap) }
  def initialize(); end
  # sord omit - no YARD type given for "key", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(key: T.untyped, value: T.untyped).void }
  def []=(key, value); end
  # sord omit - no YARD type given for "key", using T.untyped
  sig { params(key: T.untyped).void }
  def compute_if_absent(key); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { void }
  def copy_storage(); end
end
end
end
class Execute
  extend GraphQL::Execution::Execute::ExecutionFunctions
  # sord omit - no YARD type given for "ast_operation", using T.untyped
  # sord omit - no YARD type given for "root_type", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(ast_operation: T.untyped, root_type: T.untyped, query: T.untyped).void }
  def execute(ast_operation, root_type, query); end
  # sord omit - no YARD type given for "_multiplex", using T.untyped
  sig { params(_multiplex: T.untyped).void }
  def self.begin_multiplex(_multiplex); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "_multiplex", using T.untyped
  sig { params(query: T.untyped, _multiplex: T.untyped).void }
  def self.begin_query(query, _multiplex); end
  # sord omit - no YARD type given for "results", using T.untyped
  # sord omit - no YARD type given for "multiplex", using T.untyped
  sig { params(results: T.untyped, multiplex: T.untyped).void }
  def self.finish_multiplex(results, multiplex); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "_multiplex", using T.untyped
  sig { params(query: T.untyped, _multiplex: T.untyped).void }
  def self.finish_query(query, _multiplex); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def resolve_root_selection(query); end
  # sord omit - no YARD type given for "result", using T.untyped
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "multiplex:", using T.untyped
  sig { params(result: T.untyped, query: T.untyped, multiplex: T.untyped).void }
  def lazy_resolve_root_selection(result, query: nil, multiplex: nil); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "current_type", using T.untyped
  # sord omit - no YARD type given for "current_ctx", using T.untyped
  # sord omit - no YARD type given for "mutation:", using T.untyped
  sig { params(object: T.untyped, current_type: T.untyped, current_ctx: T.untyped, mutation: T.untyped).void }
  def resolve_selection(object, current_type, current_ctx, mutation: false); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(object: T.untyped, field_ctx: T.untyped).void }
  def resolve_field(object, field_ctx); end
  # sord omit - no YARD type given for "raw_value", using T.untyped
  # sord omit - no YARD type given for "field_type", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(raw_value: T.untyped, field_type: T.untyped, field_ctx: T.untyped).void }
  def continue_or_wait(raw_value, field_type, field_ctx); end
  # sord omit - no YARD type given for "raw_value", using T.untyped
  # sord omit - no YARD type given for "field_type", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(raw_value: T.untyped, field_type: T.untyped, field_ctx: T.untyped).void }
  def continue_resolve_field(raw_value, field_type, field_ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "field_type", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(value: T.untyped, field_type: T.untyped, field_ctx: T.untyped).void }
  def resolve_value(value, field_type, field_ctx); end
class Skip
end
class PropagateNull
end
module ExecutionFunctions
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def resolve_root_selection(query); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def self.resolve_root_selection(query); end
  # sord omit - no YARD type given for "result", using T.untyped
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "multiplex:", using T.untyped
  sig { params(result: T.untyped, query: T.untyped, multiplex: T.untyped).void }
  def lazy_resolve_root_selection(result, query: nil, multiplex: nil); end
  # sord omit - no YARD type given for "result", using T.untyped
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "multiplex:", using T.untyped
  sig { params(result: T.untyped, query: T.untyped, multiplex: T.untyped).void }
  def self.lazy_resolve_root_selection(result, query: nil, multiplex: nil); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "current_type", using T.untyped
  # sord omit - no YARD type given for "current_ctx", using T.untyped
  # sord omit - no YARD type given for "mutation:", using T.untyped
  sig { params(object: T.untyped, current_type: T.untyped, current_ctx: T.untyped, mutation: T.untyped).void }
  def resolve_selection(object, current_type, current_ctx, mutation: false); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "current_type", using T.untyped
  # sord omit - no YARD type given for "current_ctx", using T.untyped
  # sord omit - no YARD type given for "mutation:", using T.untyped
  sig { params(object: T.untyped, current_type: T.untyped, current_ctx: T.untyped, mutation: T.untyped).void }
  def self.resolve_selection(object, current_type, current_ctx, mutation: false); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(object: T.untyped, field_ctx: T.untyped).void }
  def resolve_field(object, field_ctx); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(object: T.untyped, field_ctx: T.untyped).void }
  def self.resolve_field(object, field_ctx); end
  # sord omit - no YARD type given for "raw_value", using T.untyped
  # sord omit - no YARD type given for "field_type", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(raw_value: T.untyped, field_type: T.untyped, field_ctx: T.untyped).void }
  def continue_or_wait(raw_value, field_type, field_ctx); end
  # sord omit - no YARD type given for "raw_value", using T.untyped
  # sord omit - no YARD type given for "field_type", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(raw_value: T.untyped, field_type: T.untyped, field_ctx: T.untyped).void }
  def self.continue_or_wait(raw_value, field_type, field_ctx); end
  # sord omit - no YARD type given for "raw_value", using T.untyped
  # sord omit - no YARD type given for "field_type", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(raw_value: T.untyped, field_type: T.untyped, field_ctx: T.untyped).void }
  def continue_resolve_field(raw_value, field_type, field_ctx); end
  # sord omit - no YARD type given for "raw_value", using T.untyped
  # sord omit - no YARD type given for "field_type", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(raw_value: T.untyped, field_type: T.untyped, field_ctx: T.untyped).void }
  def self.continue_resolve_field(raw_value, field_type, field_ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "field_type", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(value: T.untyped, field_type: T.untyped, field_ctx: T.untyped).void }
  def resolve_value(value, field_type, field_ctx); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "field_type", using T.untyped
  # sord omit - no YARD type given for "field_ctx", using T.untyped
  sig { params(value: T.untyped, field_type: T.untyped, field_ctx: T.untyped).void }
  def self.resolve_value(value, field_type, field_ctx); end
end
module FieldResolveStep
  # sord omit - no YARD type given for "_parent_type", using T.untyped
  # sord omit - no YARD type given for "parent_object", using T.untyped
  # sord omit - no YARD type given for "field_definition", using T.untyped
  # sord omit - no YARD type given for "field_args", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  # sord omit - no YARD type given for "_next", using T.untyped
  sig { params(_parent_type: T.untyped, parent_object: T.untyped, field_definition: T.untyped, field_args: T.untyped, context: T.untyped, _next: T.untyped).void }
  def self.call(_parent_type, parent_object, field_definition, field_args, context, _next = nil); end
end
end
module Flatten
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(ctx: T.untyped).void }
  def self.call(ctx); end
  # sord omit - no YARD type given for "obj", using T.untyped
  sig { params(obj: T.untyped).void }
  def self.flatten(obj); end
end
module Typecast
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "child_type", using T.untyped
  sig { params(parent_type: T.untyped, child_type: T.untyped).returns(T::Boolean) }
  def self.subtype?(parent_type, child_type); end
end
class Lookahead
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "ast_nodes:", using T.untyped
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "root_type:", using T.untyped
  # sord omit - no YARD type given for "owner_type:", using T.untyped
  sig { params(query: T.untyped, ast_nodes: T.untyped, field: T.untyped, root_type: T.untyped, owner_type: T.untyped).returns(Lookahead) }
  def initialize(query:, ast_nodes:, field: nil, root_type: nil, owner_type: nil); end
  sig { returns(T::Array[GraphQL::Language::Nodes::Field]) }
  def ast_nodes(); end
  sig { returns(GraphQL::Schema::Field) }
  def field(); end
  sig { returns(T.any(GraphQL::Schema::Object, GraphQL::Schema::Union, GraphQL::Schema::Interface)) }
  def owner_type(); end
  sig { returns(T::Hash[Symbol, Object]) }
  def arguments(); end
  # sord omit - no YARD type given for "arguments:", using T.untyped
  sig { params(field_name: T.any(String, Symbol), arguments: T.untyped).returns(T::Boolean) }
  def selects?(field_name, arguments: nil); end
  sig { returns(T::Boolean) }
  def selected?(); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  # sord omit - no YARD type given for "selected_type:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  sig { params(field_name: T.untyped, selected_type: T.untyped, arguments: T.untyped).returns(GraphQL::Execution::Lookahead) }
  def selection(field_name, selected_type: @selected_type, arguments: nil); end
  # sord omit - no YARD type given for "arguments:", using T.untyped
  sig { params(arguments: T.untyped).returns(T::Array[GraphQL::Execution::Lookahead]) }
  def selections(arguments: nil); end
  sig { returns(Symbol) }
  def name(); end
  sig { void }
  def inspect(); end
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(name: T.untyped).void }
  def normalize_name(name); end
  # sord omit - no YARD type given for "keyword", using T.untyped
  sig { params(keyword: T.untyped).void }
  def normalize_keyword(keyword); end
  # sord omit - no YARD type given for "subselections_by_type", using T.untyped
  # sord omit - no YARD type given for "selections_on_type", using T.untyped
  # sord omit - no YARD type given for "selected_type", using T.untyped
  # sord omit - no YARD type given for "ast_selections", using T.untyped
  # sord omit - no YARD type given for "arguments", using T.untyped
  sig { params(subselections_by_type: T.untyped, selections_on_type: T.untyped, selected_type: T.untyped, ast_selections: T.untyped, arguments: T.untyped).void }
  def find_selections(subselections_by_type, selections_on_type, selected_type, ast_selections, arguments); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "field_name", using T.untyped
  # sord omit - no YARD type given for "field_defn", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "matches:", using T.untyped
  sig { params(node: T.untyped, field_name: T.untyped, field_defn: T.untyped, arguments: T.untyped, matches: T.untyped).void }
  def find_selected_nodes(node, field_name, field_defn, arguments:, matches:); end
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "field_defn", using T.untyped
  # sord omit - no YARD type given for "field_node", using T.untyped
  sig { params(arguments: T.untyped, field_defn: T.untyped, field_node: T.untyped).returns(T::Boolean) }
  def arguments_match?(arguments, field_defn, field_node); end
class NullLookahead < GraphQL::Execution::Lookahead
  sig { returns(NullLookahead) }
  def initialize(); end
  sig { returns(T::Boolean) }
  def selected?(); end
  sig { returns(T::Boolean) }
  def selects?(); end
  sig { void }
  def selection(); end
  sig { void }
  def selections(); end
  sig { void }
  def inspect(); end
  sig { returns(T::Array[GraphQL::Language::Nodes::Field]) }
  def ast_nodes(); end
  sig { returns(GraphQL::Schema::Field) }
  def field(); end
  sig { returns(T.any(GraphQL::Schema::Object, GraphQL::Schema::Union, GraphQL::Schema::Interface)) }
  def owner_type(); end
  sig { returns(T::Hash[Symbol, Object]) }
  def arguments(); end
  sig { returns(Symbol) }
  def name(); end
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(name: T.untyped).void }
  def normalize_name(name); end
  # sord omit - no YARD type given for "keyword", using T.untyped
  sig { params(keyword: T.untyped).void }
  def normalize_keyword(keyword); end
  # sord omit - no YARD type given for "subselections_by_type", using T.untyped
  # sord omit - no YARD type given for "selections_on_type", using T.untyped
  # sord omit - no YARD type given for "selected_type", using T.untyped
  # sord omit - no YARD type given for "ast_selections", using T.untyped
  # sord omit - no YARD type given for "arguments", using T.untyped
  sig { params(subselections_by_type: T.untyped, selections_on_type: T.untyped, selected_type: T.untyped, ast_selections: T.untyped, arguments: T.untyped).void }
  def find_selections(subselections_by_type, selections_on_type, selected_type, ast_selections, arguments); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "field_name", using T.untyped
  # sord omit - no YARD type given for "field_defn", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  # sord omit - no YARD type given for "matches:", using T.untyped
  sig { params(node: T.untyped, field_name: T.untyped, field_defn: T.untyped, arguments: T.untyped, matches: T.untyped).void }
  def find_selected_nodes(node, field_name, field_defn, arguments:, matches:); end
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "field_defn", using T.untyped
  # sord omit - no YARD type given for "field_node", using T.untyped
  sig { params(arguments: T.untyped, field_defn: T.untyped, field_node: T.untyped).returns(T::Boolean) }
  def arguments_match?(arguments, field_defn, field_node); end
end
module ArgumentHelpers
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "graphql_object", using T.untyped
  # sord omit - no YARD type given for "arg_owner", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(query: T.untyped, graphql_object: T.untyped, arg_owner: T.untyped, ast_node: T.untyped).void }
  def arguments(query, graphql_object, arg_owner, ast_node); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "graphql_object", using T.untyped
  # sord omit - no YARD type given for "arg_owner", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(query: T.untyped, graphql_object: T.untyped, arg_owner: T.untyped, ast_node: T.untyped).void }
  def self.arguments(query, graphql_object, arg_owner, ast_node); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord warn - "Array(is_present, value)" does not appear to be a type
  sig { params(query: T.untyped, graphql_object: Object, arg_type: T.any(Class, GraphQL::Schema::NonNull, GraphQL::Schema::List), ast_value: T.any(GraphQL::Language::Nodes::VariableIdentifier, String, Integer, Float, T::Boolean)).returns(SORD_ERROR_Arrayis_presentvalue) }
  def arg_to_value(query, graphql_object, arg_type, ast_value); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord warn - "Array(is_present, value)" does not appear to be a type
  sig { params(query: T.untyped, graphql_object: Object, arg_type: T.any(Class, GraphQL::Schema::NonNull, GraphQL::Schema::List), ast_value: T.any(GraphQL::Language::Nodes::VariableIdentifier, String, Integer, Float, T::Boolean)).returns(SORD_ERROR_Arrayis_presentvalue) }
  def self.arg_to_value(query, graphql_object, arg_type, ast_value); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "v", using T.untyped
  sig { params(query: T.untyped, v: T.untyped).void }
  def flatten_ast_value(query, v); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "v", using T.untyped
  sig { params(query: T.untyped, v: T.untyped).void }
  def self.flatten_ast_value(query, v); end
end
module FieldHelpers
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "owner_type", using T.untyped
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(schema: T.untyped, owner_type: T.untyped, field_name: T.untyped).void }
  def get_field(schema, owner_type, field_name); end
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "owner_type", using T.untyped
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(schema: T.untyped, owner_type: T.untyped, field_name: T.untyped).void }
  def self.get_field(schema, owner_type, field_name); end
end
end
class Multiplex
  extend GraphQL::Tracing::Traceable
  sig { void }
  def context(); end
  sig { void }
  def queries(); end
  sig { void }
  def schema(); end
  sig { void }
  def max_complexity(); end
  # sord omit - no YARD type given for "schema:", using T.untyped
  # sord omit - no YARD type given for "queries:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "max_complexity:", using T.untyped
  sig { params(schema: T.untyped, queries: T.untyped, context: T.untyped, max_complexity: T.untyped).returns(Multiplex) }
  def initialize(schema:, queries:, context:, max_complexity:); end
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "query_options", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: T.untyped, query_options: T.untyped, args: T.untyped).void }
  def self.run_all(schema, query_options, *args); end
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "max_complexity:", using T.untyped
  sig { params(schema: GraphQL::Schema, queries: T::Array[GraphQL::Query], context: T.untyped, max_complexity: T.untyped).returns(T::Array[Hash]) }
  def self.run_queries(schema, queries, context: {}, max_complexity: schema.max_complexity); end
  # sord omit - no YARD type given for "multiplex", using T.untyped
  sig { params(multiplex: T.untyped).void }
  def self.run_as_multiplex(multiplex); end
  # sord omit - no YARD type given for "multiplex", using T.untyped
  sig { params(query: GraphQL::Query, multiplex: T.untyped).returns(Hash) }
  def self.begin_query(query, multiplex); end
  # sord omit - no YARD type given for "multiplex", using T.untyped
  sig { params(data_result: Hash, query: GraphQL::Query, multiplex: T.untyped).returns(Hash) }
  def self.finish_query(data_result, query, multiplex); end
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(schema: T.untyped, query: T.untyped).void }
  def self.run_one_legacy(schema, query); end
  # sord omit - no YARD type given for "schema", using T.untyped
  sig { params(schema: T.untyped).returns(T::Boolean) }
  def self.supports_multiplexing?(schema); end
  # sord omit - no YARD type given for "multiplex", using T.untyped
  sig { params(multiplex: T.untyped).void }
  def self.instrument_and_analyze(multiplex); end
  sig { params(key: String, metadata: Hash).returns(Object) }
  def trace(key, metadata); end
  sig { params(idx: Integer, key: String, metadata: Object).returns(T.untyped) }
  def call_tracers(idx, key, metadata); end
end
class Interpreter
  sig { returns(Interpreter) }
  def initialize(); end
  # sord omit - no YARD type given for "_operation", using T.untyped
  # sord omit - no YARD type given for "_root_type", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(_operation: T.untyped, _root_type: T.untyped, query: T.untyped).void }
  def execute(_operation, _root_type, query); end
  # sord omit - no YARD type given for "schema_defn", using T.untyped
  sig { params(schema_defn: T.untyped).void }
  def self.use(schema_defn); end
  # sord omit - no YARD type given for "multiplex", using T.untyped
  sig { params(multiplex: T.untyped).void }
  def self.begin_multiplex(multiplex); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "multiplex", using T.untyped
  sig { params(query: T.untyped, multiplex: T.untyped).void }
  def self.begin_query(query, multiplex); end
  # sord omit - no YARD type given for "_results", using T.untyped
  # sord omit - no YARD type given for "multiplex", using T.untyped
  sig { params(_results: T.untyped, multiplex: T.untyped).void }
  def self.finish_multiplex(_results, multiplex); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "_multiplex", using T.untyped
  sig { params(query: T.untyped, _multiplex: T.untyped).void }
  def self.finish_query(query, _multiplex); end
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).returns(Interpreter::Runtime) }
  def evaluate(query); end
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "multiplex:", using T.untyped
  sig { params(query: T.untyped, multiplex: T.untyped).void }
  def sync_lazies(query: nil, multiplex: nil); end
module Resolve
  # sord omit - no YARD type given for "results", using T.untyped
  sig { params(results: T.untyped).void }
  def self.resolve_all(results); end
  sig { params(results: Array).returns(Array) }
  def self.resolve(results); end
end
class Runtime
  sig { returns(GraphQL::Query) }
  def query(); end
  sig { returns(Class) }
  def schema(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "response:", using T.untyped
  sig { params(query: T.untyped, response: T.untyped).returns(Runtime) }
  def initialize(query:, response:); end
  sig { void }
  def final_value(); end
  sig { void }
  def inspect(); end
  sig { void }
  def run_eager(); end
  # sord omit - no YARD type given for "owner_object", using T.untyped
  # sord omit - no YARD type given for "owner_type", using T.untyped
  # sord omit - no YARD type given for "selections", using T.untyped
  # sord omit - no YARD type given for "selections_by_name", using T.untyped
  sig { params(owner_object: T.untyped, owner_type: T.untyped, selections: T.untyped, selections_by_name: T.untyped).void }
  def gather_selections(owner_object, owner_type, selections, selections_by_name); end
  # sord omit - no YARD type given for "path", using T.untyped
  # sord omit - no YARD type given for "owner_object", using T.untyped
  # sord omit - no YARD type given for "owner_type", using T.untyped
  # sord omit - no YARD type given for "selections", using T.untyped
  # sord omit - no YARD type given for "root_operation_type:", using T.untyped
  sig { params(path: T.untyped, owner_object: T.untyped, owner_type: T.untyped, selections: T.untyped, root_operation_type: T.untyped).void }
  def evaluate_selections(path, owner_object, owner_type, selections, root_operation_type: nil); end
  # sord omit - no YARD type given for "path", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "is_non_null", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(path: T.untyped, value: T.untyped, field: T.untyped, is_non_null: T.untyped, ast_node: T.untyped).void }
  def continue_value(path, value, field, is_non_null, ast_node); end
  # sord omit - no YARD type given for "path", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "next_selections", using T.untyped
  # sord omit - no YARD type given for "is_non_null", using T.untyped
  sig { params(path: T.untyped, value: T.untyped, field: T.untyped, type: T.untyped, ast_node: T.untyped, next_selections: T.untyped, is_non_null: T.untyped).returns(T.any(Lazy, Array, Hash, Object)) }
  def continue_field(path, value, field, type, ast_node, next_selections, is_non_null); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(object: T.untyped, ast_node: T.untyped).void }
  def resolve_with_directives(object, ast_node); end
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "idx", using T.untyped
  sig { params(object: T.untyped, ast_node: T.untyped, idx: T.untyped).void }
  def run_directive(object, ast_node, idx); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "graphql_object", using T.untyped
  # sord omit - no YARD type given for "parent_type", using T.untyped
  sig { params(node: T.untyped, graphql_object: T.untyped, parent_type: T.untyped).returns(T::Boolean) }
  def directives_include?(node, graphql_object, parent_type); end
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(type: T.untyped).void }
  def resolve_if_late_bound_type(type); end
  # sord omit - no YARD type given for "owner:", using T.untyped
  # sord omit - no YARD type given for "field:", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "eager:", using T.untyped
  sig { params(obj: Object, owner: T.untyped, field: T.untyped, path: T.untyped, eager: T.untyped).returns(T.any(GraphQL::Execution::Lazy, Object)) }
  def after_lazy(obj, owner:, field:, path:, eager: false); end
  # sord omit - no YARD type given for "ast_args_or_hash", using T.untyped
  sig { params(ast_args_or_hash: T.untyped).void }
  def each_argument_pair(ast_args_or_hash); end
  # sord omit - no YARD type given for "graphql_object", using T.untyped
  # sord omit - no YARD type given for "arg_owner", using T.untyped
  # sord omit - no YARD type given for "ast_node_or_hash", using T.untyped
  sig { params(graphql_object: T.untyped, arg_owner: T.untyped, ast_node_or_hash: T.untyped).void }
  def arguments(graphql_object, arg_owner, ast_node_or_hash); end
  # sord warn - "Array(is_present, value)" does not appear to be a type
  sig { params(graphql_object: Object, arg_type: T.any(Class, GraphQL::Schema::NonNull, GraphQL::Schema::List), ast_value: T.any(GraphQL::Language::Nodes::VariableIdentifier, String, Integer, Float, T::Boolean)).returns(SORD_ERROR_Arrayis_presentvalue) }
  def arg_to_value(graphql_object, arg_type, ast_value); end
  # sord omit - no YARD type given for "v", using T.untyped
  sig { params(v: T.untyped).void }
  def flatten_ast_value(v); end
  # sord omit - no YARD type given for "path", using T.untyped
  # sord omit - no YARD type given for "invalid_null_error", using T.untyped
  sig { params(path: T.untyped, invalid_null_error: T.untyped).void }
  def write_invalid_null_in_response(path, invalid_null_error); end
  # sord omit - no YARD type given for "path", using T.untyped
  # sord omit - no YARD type given for "errors", using T.untyped
  sig { params(path: T.untyped, errors: T.untyped).void }
  def write_execution_errors_in_response(path, errors); end
  # sord omit - no YARD type given for "path", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(path: T.untyped, value: T.untyped).void }
  def write_in_response(path, value); end
  # sord omit - no YARD type given for "path", using T.untyped
  sig { params(path: T.untyped).void }
  def type_at(path); end
  # sord omit - no YARD type given for "path", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(path: T.untyped, type: T.untyped).void }
  def set_type_at_path(path, type); end
  # sord omit - no YARD type given for "path", using T.untyped
  sig { params(path: T.untyped).void }
  def add_dead_path(path); end
  # sord omit - no YARD type given for "path", using T.untyped
  sig { params(path: T.untyped).returns(T::Boolean) }
  def dead_path?(path); end
end
class HashResponse
  sig { returns(HashResponse) }
  def initialize(); end
  sig { void }
  def final_value(); end
  sig { void }
  def inspect(); end
  # sord omit - no YARD type given for "path", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(path: T.untyped, value: T.untyped).void }
  def write(path, value); end
end
class ExecutionErrors
  # sord omit - no YARD type given for "ctx", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "path", using T.untyped
  sig { params(ctx: T.untyped, ast_node: T.untyped, path: T.untyped).returns(ExecutionErrors) }
  def initialize(ctx, ast_node, path); end
  # sord omit - no YARD type given for "err_or_msg", using T.untyped
  sig { params(err_or_msg: T.untyped).void }
  def add(err_or_msg); end
end
end
module Instrumentation
  # sord omit - no YARD type given for "multiplex", using T.untyped
  sig { params(multiplex: T.untyped).void }
  def self.apply_instrumenters(multiplex); end
  # sord omit - no YARD type given for "instrumenters", using T.untyped
  # sord omit - no YARD type given for "queries", using T.untyped
  # sord omit - no YARD type given for "i", using T.untyped
  sig { params(instrumenters: T.untyped, queries: T.untyped, i: T.untyped).void }
  def self.each_query_call_hooks(instrumenters, queries, i = 0); end
  # sord omit - no YARD type given for "instrumenters", using T.untyped
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "before_hook_name", using T.untyped
  # sord omit - no YARD type given for "after_hook_name", using T.untyped
  sig { params(instrumenters: T.untyped, object: T.untyped, before_hook_name: T.untyped, after_hook_name: T.untyped).void }
  def self.call_hooks(instrumenters, object, before_hook_name, after_hook_name); end
  # sord omit - no YARD type given for "instrumenters", using T.untyped
  # sord omit - no YARD type given for "object", using T.untyped
  # sord omit - no YARD type given for "after_hook_name", using T.untyped
  # sord omit - no YARD type given for "ex", using T.untyped
  sig { params(instrumenters: T.untyped, object: T.untyped, after_hook_name: T.untyped, ex: T.untyped).void }
  def self.call_after_hooks(instrumenters, object, after_hook_name, ex); end
end
module DirectiveChecks
  # sord omit - no YARD type given for "directive_ast_nodes", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(directive_ast_nodes: T.untyped, query: T.untyped).returns(T::Boolean) }
  def include?(directive_ast_nodes, query); end
  # sord omit - no YARD type given for "directive_ast_nodes", using T.untyped
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(directive_ast_nodes: T.untyped, query: T.untyped).returns(T::Boolean) }
  def self.include?(directive_ast_nodes, query); end
end
end
class InterfaceType < GraphQL::BaseType
  sig { void }
  def fields(); end
  sig { params(value: T.untyped).void }
  def fields=(value); end
  sig { void }
  def orphan_types(); end
  sig { params(value: T.untyped).void }
  def orphan_types=(value); end
  sig { void }
  def resolve_type_proc(); end
  sig { params(value: T.untyped).void }
  def resolve_type_proc=(value); end
  sig { returns(InterfaceType) }
  def initialize(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { void }
  def kind(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def resolve_type(value, ctx); end
  # sord infer - inferred type of parameter "resolve_type_callable" as T.any() using getter's return type
  sig { params(resolve_type_callable: T.any()).void }
  def resolve_type=(resolve_type_callable); end
  # sord omit - no YARD type given for "field_name", using T.untyped
  sig { params(field_name: T.untyped).returns(GraphQL::Field) }
  def get_field(field_name); end
  sig { returns(T::Array[GraphQL::Field]) }
  def all_fields(); end
  sig { params(type_name: String, ctx: GraphQL::Query::Context).returns(T.nilable(GraphQL::ObjectType)) }
  def get_possible_type(type_name, ctx); end
  sig { params(type: T.any(String, GraphQL::BaseType), ctx: GraphQL::Query::Context).returns(T::Boolean) }
  def possible_type?(type, ctx); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { void }
  def graphql_definition(); end
  # sord infer - inferred type of parameter "name" as String using getter's return type
  sig { params(name: String).void }
  def name=(name); end
  sig { returns(T.nilable(String)) }
  def description(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def description=(value); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  sig { returns(T::Boolean) }
  def default_scalar?(); end
  sig { returns(T::Boolean) }
  def default_relay?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def introspection=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_scalar=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_relay=(value); end
  sig { params(other: GraphQL::BaseType).returns(T::Boolean) }
  def ==(other); end
  sig { void }
  def unwrap(); end
  sig { returns(GraphQL::NonNullType) }
  def to_non_null_type(); end
  sig { returns(GraphQL::ListType) }
  def to_list_type(); end
  sig { void }
  def to_s(); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_type_signature(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(T::Boolean) }
  def valid_isolated_input?(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def validate_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_result(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def valid_input?(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_result(value, ctx); end
  # sord omit - no YARD type given for "type_arg", using T.untyped
  sig { params(type_arg: T.untyped).returns(GraphQL::BaseType) }
  def self.resolve_related_type(type_arg); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: GraphQL::Schema, printer: T.untyped, args: T.untyped).returns(String) }
  def to_definition(schema, printer: nil, **args); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  # sord omit - no YARD type given for "alt_method_name", using T.untyped
  sig { params(alt_method_name: T.untyped).void }
  def warn_deprecated_coerce(alt_method_name); end
  sig { returns(GraphQL::ObjectType) }
  def connection_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  sig { returns(GraphQL::ObjectType) }
  def edge_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
  sig { returns(GraphQL::NonNullType) }
  def !(); end
end
class NameValidator
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(name: T.untyped).void }
  def self.validate!(name); end
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(name: T.untyped).returns(T::Boolean) }
  def self.valid?(name); end
end
class ExecutionError < GraphQL::Error
  sig { returns(GraphQL::Language::Nodes::Field) }
  def ast_node(); end
  # sord infer - inferred type of parameter "value" as GraphQL::Language::Nodes::Field using getter's return type
  sig { params(value: GraphQL::Language::Nodes::Field).returns(GraphQL::Language::Nodes::Field) }
  def ast_node=(value); end
  sig { returns(String) }
  def path(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def path=(value); end
  sig { returns(Hash) }
  def options(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def options=(value); end
  sig { returns(Hash) }
  def extensions(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def extensions=(value); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "ast_node:", using T.untyped
  # sord omit - no YARD type given for "options:", using T.untyped
  # sord omit - no YARD type given for "extensions:", using T.untyped
  sig { params(message: T.untyped, ast_node: T.untyped, options: T.untyped, extensions: T.untyped).returns(ExecutionError) }
  def initialize(message, ast_node: nil, options: nil, extensions: nil); end
  sig { returns(Hash) }
  def to_h(); end
end
module Upgrader
class Transform
  sig { params(input_text: String).returns(String) }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class TypeDefineToClassTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "base_class_pattern:", using T.untyped
  sig { params(base_class_pattern: T.untyped).returns(TypeDefineToClassTransform) }
  def initialize(base_class_pattern: "Types::Base\\3"); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class MutationDefineToClassTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "base_class_name:", using T.untyped
  sig { params(base_class_name: T.untyped).returns(MutationDefineToClassTransform) }
  def initialize(base_class_name: "Mutations::BaseMutation"); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class NameTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "transformable", using T.untyped
  sig { params(transformable: T.untyped).void }
  def apply(transformable); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class RemoveNewlinesTransform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
end
class RemoveMethodParensTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class PositionalTypeArgTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class ConfigurationToKwargTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "kwarg:", using T.untyped
  sig { params(kwarg: T.untyped).returns(ConfigurationToKwargTransform) }
  def initialize(kwarg:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class PropertyToMethodTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class RemoveRedundantKwargTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "kwarg:", using T.untyped
  sig { params(kwarg: T.untyped).returns(RemoveRedundantKwargTransform) }
  def initialize(kwarg:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class UnderscoreizeFieldNameTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class ProcToClassMethodTransform < GraphQL::Upgrader::Transform
  sig { params(proc_name: String).returns(ProcToClassMethodTransform) }
  def initialize(proc_name); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
class NamedProcProcessor < Parser::AST::Processor
  sig { void }
  def proc_arg_names(); end
  sig { void }
  def proc_defn_start(); end
  sig { void }
  def proc_defn_end(); end
  sig { void }
  def proc_defn_indent(); end
  sig { void }
  def proc_body_start(); end
  sig { void }
  def proc_body_end(); end
  # sord omit - no YARD type given for "proc_name", using T.untyped
  sig { params(proc_name: T.untyped).returns(NamedProcProcessor) }
  def initialize(proc_name); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def on_send(node); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def on_block(node); end
end
end
class MutationResolveProcToMethodTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "proc_name:", using T.untyped
  sig { params(proc_name: T.untyped).returns(MutationResolveProcToMethodTransform) }
  def initialize(proc_name: "resolve"); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class UnderscorizeMutationHashTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
class ReturnedHashLiteralProcessor < Parser::AST::Processor
  sig { void }
  def keys_to_upgrade(); end
  sig { returns(ReturnedHashLiteralProcessor) }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def on_def(node); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "returning:", using T.untyped
  sig { params(node: T.untyped, returning: T.untyped).void }
  def find_returned_hashes(node, returning:); end
end
end
class ResolveProcToMethodTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
class ResolveProcProcessor < Parser::AST::Processor
  sig { void }
  def proc_start(); end
  sig { void }
  def proc_end(); end
  sig { void }
  def proc_arg_names(); end
  sig { void }
  def resolve_start(); end
  sig { void }
  def resolve_end(); end
  sig { void }
  def resolve_indent(); end
  sig { returns(ResolveProcProcessor) }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def on_send(node); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def on_block(node); end
end
end
class InterfacesToImplementsTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class PossibleTypesTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class UpdateMethodSignatureTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class RemoveEmptyBlocksTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class RemoveExcessWhitespaceTransform < GraphQL::Upgrader::Transform
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def apply(input_text); end
  # sord omit - no YARD type given for "preserve_bang:", using T.untyped
  sig { params(type_expr: String, preserve_bang: T.untyped).returns(String) }
  def normalize_type_expression(type_expr, preserve_bang: false); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def underscorize(str); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "processor", using T.untyped
  sig { params(input_text: T.untyped, processor: T.untyped).void }
  def apply_processor(input_text, processor); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  # sord omit - no YARD type given for "from_indent:", using T.untyped
  # sord omit - no YARD type given for "to_indent:", using T.untyped
  sig { params(input_text: T.untyped, from_indent: T.untyped, to_indent: T.untyped).void }
  def reindent_lines(input_text, from_indent:, to_indent:); end
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).void }
  def trim_lines(input_text); end
end
class SkipOnNullKeyword
  # sord omit - no YARD type given for "input_text", using T.untyped
  sig { params(input_text: T.untyped).returns(T::Boolean) }
  def skip?(input_text); end
end
class Member
  # sord omit - no YARD type given for "member", using T.untyped
  # sord omit - no YARD type given for "skip:", using T.untyped
  # sord omit - no YARD type given for "type_transforms:", using T.untyped
  # sord omit - no YARD type given for "field_transforms:", using T.untyped
  # sord omit - no YARD type given for "clean_up_transforms:", using T.untyped
  sig { params(member: T.untyped, skip: T.untyped, type_transforms: T.untyped, field_transforms: T.untyped, clean_up_transforms: T.untyped).returns(Member) }
  def initialize(member, skip: SkipOnNullKeyword, type_transforms: DEFAULT_TYPE_TRANSFORMS, field_transforms: DEFAULT_FIELD_TRANSFORMS, clean_up_transforms: DEFAULT_CLEAN_UP_TRANSFORMS); end
  sig { void }
  def upgrade(); end
  sig { returns(T::Boolean) }
  def upgradeable?(); end
  # sord omit - no YARD type given for "source_code", using T.untyped
  # sord omit - no YARD type given for "transforms", using T.untyped
  # sord omit - no YARD type given for "idx:", using T.untyped
  sig { params(source_code: T.untyped, transforms: T.untyped, idx: T.untyped).void }
  def apply_transforms(source_code, transforms, idx: 0); end
  # sord omit - no YARD type given for "type_source", using T.untyped
  sig { params(type_source: T.untyped).void }
  def find_fields(type_source); end
class FieldFinder < Parser::AST::Processor
  sig { void }
  def locations(); end
  sig { returns(FieldFinder) }
  def initialize(); end
  # sord omit - no YARD type given for "send_node:", using T.untyped
  # sord omit - no YARD type given for "source_node:", using T.untyped
  sig { params(send_node: T.untyped, source_node: T.untyped).void }
  def add_location(send_node:, source_node:); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def on_block(node); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def on_send(node); end
end
end
class Schema
  # sord omit - no YARD type given for "schema", using T.untyped
  sig { params(schema: T.untyped).returns(Schema) }
  def initialize(schema); end
  sig { void }
  def upgrade(); end
  sig { void }
  def schema(); end
end
end
class InputObjectType < GraphQL::BaseType
  sig { returns(T.nilable(GraphQL::Relay::Mutation)) }
  def mutation(); end
  # sord infer - inferred type of parameter "value" as T.nilable(GraphQL::Relay::Mutation) using getter's return type
  sig { params(value: T.nilable(GraphQL::Relay::Mutation)).returns(T.nilable(GraphQL::Relay::Mutation)) }
  def mutation=(value); end
  sig { returns(T::Hash[String, GraphQL::Argument]) }
  def arguments(); end
  # sord infer - inferred type of parameter "value" as T::Hash[String, GraphQL::Argument] using getter's return type
  sig { params(value: T::Hash[String, GraphQL::Argument]).returns(T::Hash[String, GraphQL::Argument]) }
  def arguments=(value); end
  sig { void }
  def arguments_class(); end
  sig { params(value: T.untyped).void }
  def arguments_class=(value); end
  sig { void }
  def input_fields(); end
  sig { returns(InputObjectType) }
  def initialize(); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def initialize_copy(other); end
  sig { void }
  def kind(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_result(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_non_null_input(value, ctx); end
  # sord omit - no YARD type given for "input", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(input: T.untyped, ctx: T.untyped).void }
  def validate_non_null_input(input, ctx); end
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  sig { returns(String) }
  def name(); end
  sig { returns(String) }
  def graphql_name(); end
  sig { void }
  def graphql_definition(); end
  # sord infer - inferred type of parameter "name" as String using getter's return type
  sig { params(name: String).void }
  def name=(name); end
  sig { returns(T.nilable(String)) }
  def description(); end
  # sord infer - inferred type of parameter "value" as T.nilable(String) using getter's return type
  sig { params(value: T.nilable(String)).returns(T.nilable(String)) }
  def description=(value); end
  sig { returns(T::Boolean) }
  def introspection?(); end
  sig { returns(T::Boolean) }
  def default_scalar?(); end
  sig { returns(T::Boolean) }
  def default_relay?(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def introspection=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_scalar=(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def default_relay=(value); end
  sig { params(other: GraphQL::BaseType).returns(T::Boolean) }
  def ==(other); end
  sig { void }
  def unwrap(); end
  sig { returns(GraphQL::NonNullType) }
  def to_non_null_type(); end
  sig { returns(GraphQL::ListType) }
  def to_list_type(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def resolve_type(value, ctx); end
  sig { void }
  def to_s(); end
  sig { void }
  def inspect(); end
  sig { void }
  def to_type_signature(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(T::Boolean) }
  def valid_isolated_input?(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def validate_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_input(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def coerce_isolated_result(value); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).returns(T::Boolean) }
  def valid_input?(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def validate_input(value, ctx = nil); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "ctx", using T.untyped
  sig { params(value: T.untyped, ctx: T.untyped).void }
  def coerce_input(value, ctx = nil); end
  sig { params(name: String).returns(T.nilable(GraphQL::Field)) }
  def get_field(name); end
  # sord omit - no YARD type given for "type_arg", using T.untyped
  sig { params(type_arg: T.untyped).returns(GraphQL::BaseType) }
  def self.resolve_related_type(type_arg); end
  # sord omit - no YARD type given for "printer:", using T.untyped
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(schema: GraphQL::Schema, printer: T.untyped, args: T.untyped).returns(String) }
  def to_definition(schema, printer: nil, **args); end
  sig { returns(T::Boolean) }
  def non_null?(); end
  sig { returns(T::Boolean) }
  def list?(); end
  # sord omit - no YARD type given for "alt_method_name", using T.untyped
  sig { params(alt_method_name: T.untyped).void }
  def warn_deprecated_coerce(alt_method_name); end
  sig { returns(GraphQL::ObjectType) }
  def connection_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_connection(**kwargs, &block); end
  sig { returns(GraphQL::ObjectType) }
  def edge_type(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(GraphQL::ObjectType) }
  def define_edge(**kwargs, &block); end
  sig { returns(T::Hash[Object, Object]) }
  def metadata(); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).void }
  def define(**kwargs, &block); end
  # sord omit - no YARD type given for "kwargs", using T.untyped
  sig { params(kwargs: T.untyped, block: T.untyped).returns(InstanceDefinable) }
  def redefine(**kwargs, &block); end
  sig { void }
  def ensure_defined(); end
  sig { void }
  def revive_dependent_methods(); end
  sig { void }
  def stash_dependent_methods(); end
  sig { returns(GraphQL::NonNullType) }
  def !(); end
end
class InvalidNameError < GraphQL::ExecutionError
  sig { void }
  def name(); end
  sig { void }
  def valid_regex(); end
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "valid_regex", using T.untyped
  sig { params(name: T.untyped, valid_regex: T.untyped).returns(InvalidNameError) }
  def initialize(name, valid_regex); end
  sig { returns(GraphQL::Language::Nodes::Field) }
  def ast_node(); end
  # sord infer - inferred type of parameter "value" as GraphQL::Language::Nodes::Field using getter's return type
  sig { params(value: GraphQL::Language::Nodes::Field).returns(GraphQL::Language::Nodes::Field) }
  def ast_node=(value); end
  sig { returns(String) }
  def path(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def path=(value); end
  sig { returns(Hash) }
  def options(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def options=(value); end
  sig { returns(Hash) }
  def extensions(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def extensions=(value); end
  sig { returns(Hash) }
  def to_h(); end
end
class InvalidNullError < GraphQL::RuntimeTypeError
  sig { returns(GraphQL::BaseType) }
  def parent_type(); end
  sig { returns(GraphQL::Field) }
  def field(); end
  sig { returns(T.nilable(GraphQL::ExecutionError)) }
  def value(); end
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(parent_type: T.untyped, field: T.untyped, value: T.untyped).returns(InvalidNullError) }
  def initialize(parent_type, field, value); end
  sig { returns(Hash) }
  def to_h(); end
  sig { returns(T::Boolean) }
  def parent_error?(); end
end
class RuntimeTypeError < GraphQL::Error
end
class UnauthorizedError < GraphQL::Error
  sig { returns(Object) }
  def object(); end
  sig { returns(Class) }
  def type(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(message: T.untyped, object: T.untyped, type: T.untyped, context: T.untyped).returns(UnauthorizedError) }
  def initialize(message = nil, object: nil, type: nil, context: nil); end
end
class StringEncodingError < GraphQL::RuntimeTypeError
  sig { void }
  def string(); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).returns(StringEncodingError) }
  def initialize(str); end
end
class UnresolvedTypeError < GraphQL::RuntimeTypeError
  sig { returns(Object) }
  def value(); end
  sig { returns(GraphQL::Field) }
  def field(); end
  sig { returns(GraphQL::BaseType) }
  def parent_type(); end
  sig { returns(Object) }
  def resolved_type(); end
  sig { returns(T::Array[GraphQL::BaseType]) }
  def possible_types(); end
  # sord omit - no YARD type given for "value", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "resolved_type", using T.untyped
  # sord omit - no YARD type given for "possible_types", using T.untyped
  sig { params(value: T.untyped, field: T.untyped, parent_type: T.untyped, resolved_type: T.untyped, possible_types: T.untyped).returns(UnresolvedTypeError) }
  def initialize(value, field, parent_type, resolved_type, possible_types); end
end
class IntegerEncodingError < GraphQL::RuntimeTypeError
  sig { void }
  def integer_value(); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).returns(IntegerEncodingError) }
  def initialize(value); end
end
module BackwardsCompatibility
  # sord omit - no YARD type given for "callable", using T.untyped
  # sord omit - no YARD type given for "from:", using T.untyped
  # sord omit - no YARD type given for "to:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "last:", using T.untyped
  sig { params(callable: T.untyped, from: T.untyped, to: T.untyped, name: T.untyped, last: T.untyped).void }
  def wrap_arity(callable, from:, to:, name:, last: false); end
  # sord omit - no YARD type given for "callable", using T.untyped
  # sord omit - no YARD type given for "from:", using T.untyped
  # sord omit - no YARD type given for "to:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "last:", using T.untyped
  sig { params(callable: T.untyped, from: T.untyped, to: T.untyped, name: T.untyped, last: T.untyped).void }
  def self.wrap_arity(callable, from:, to:, name:, last: false); end
  # sord omit - no YARD type given for "callable", using T.untyped
  sig { params(callable: T.untyped).void }
  def get_arity(callable); end
  # sord omit - no YARD type given for "callable", using T.untyped
  sig { params(callable: T.untyped).void }
  def self.get_arity(callable); end
class FirstArgumentsWrapper
  # sord omit - no YARD type given for "callable", using T.untyped
  # sord omit - no YARD type given for "old_arity", using T.untyped
  sig { params(callable: T.untyped, old_arity: T.untyped).returns(FirstArgumentsWrapper) }
  def initialize(callable, old_arity); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def call(*args); end
end
class LastArgumentsWrapper < GraphQL::BackwardsCompatibility::FirstArgumentsWrapper
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def call(*args); end
  # sord omit - no YARD type given for "callable", using T.untyped
  # sord omit - no YARD type given for "old_arity", using T.untyped
  sig { params(callable: T.untyped, old_arity: T.untyped).returns(FirstArgumentsWrapper) }
  def initialize(callable, old_arity); end
end
end
module StaticValidation
class Error
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped).returns(Error) }
  def initialize(message, path: nil, nodes: []); end
  sig { void }
  def to_h(); end
  sig { void }
  def locations(); end
module ErrorHelper
  # sord omit - no YARD type given for "error_message", using T.untyped
  # sord omit - no YARD type given for "nodes", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "extensions:", using T.untyped
  sig { params(error_message: T.untyped, nodes: T.untyped, context: T.untyped, path: T.untyped, extensions: T.untyped).void }
  def error(error_message, nodes, context: nil, path: nil, extensions: {}); end
end
end
class Validator
  # sord omit - no YARD type given for "schema:", using T.untyped
  # sord omit - no YARD type given for "rules:", using T.untyped
  sig { params(schema: T.untyped, rules: T.untyped).returns(Validator) }
  def initialize(schema:, rules: GraphQL::StaticValidation::ALL_RULES); end
  # sord omit - no YARD type given for "validate:", using T.untyped
  sig { params(query: GraphQL::Query, validate: T.untyped).returns(T::Array[Hash]) }
  def validate(query, validate: true); end
end
class TypeStack
  sig { returns(GraphQL::Schema) }
  def schema(); end
  sig { returns(T::Array[T.any(GraphQL::ObjectType, GraphQL::Union, GraphQL::Interface)]) }
  def object_types(); end
  sig { returns(T::Array[GraphQL::Field]) }
  def field_definitions(); end
  sig { returns(T::Array[GraphQL::Node::Directive]) }
  def directive_definitions(); end
  sig { returns(T::Array[GraphQL::Node::Argument]) }
  def argument_definitions(); end
  sig { returns(T::Array[String]) }
  def path(); end
  sig { params(schema: GraphQL::Schema, visitor: GraphQL::Language::Visitor).returns(TypeStack) }
  def initialize(schema, visitor); end
module FragmentWithTypeStrategy
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def pop(stack, node); end
end
module FragmentDefinitionStrategy
  include GraphQL::StaticValidation::TypeStack::FragmentWithTypeStrategy
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def push_path_member(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.push_path_member(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.pop(stack, node); end
end
module InlineFragmentStrategy
  include GraphQL::StaticValidation::TypeStack::FragmentWithTypeStrategy
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def push_path_member(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.push_path_member(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.pop(stack, node); end
end
module OperationDefinitionStrategy
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def pop(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.pop(stack, node); end
end
module FieldStrategy
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def pop(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.pop(stack, node); end
end
module DirectiveStrategy
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def pop(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.pop(stack, node); end
end
module ArgumentStrategy
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def pop(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.pop(stack, node); end
end
module FragmentSpreadStrategy
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.push(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def pop(stack, node); end
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(stack: T.untyped, node: T.untyped).void }
  def self.pop(stack, node); end
end
class EnterWithStrategy
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "strategy", using T.untyped
  sig { params(stack: T.untyped, strategy: T.untyped).returns(EnterWithStrategy) }
  def initialize(stack, strategy); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def call(node, parent); end
end
class LeaveWithStrategy
  # sord omit - no YARD type given for "stack", using T.untyped
  # sord omit - no YARD type given for "strategy", using T.untyped
  sig { params(stack: T.untyped, strategy: T.untyped).returns(LeaveWithStrategy) }
  def initialize(stack, strategy); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def call(node, parent); end
end
end
class BaseVisitor < GraphQL::Language::Visitor
  # sord omit - no YARD type given for "document", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  sig { params(document: T.untyped, context: T.untyped).returns(BaseVisitor) }
  def initialize(document, context); end
  sig { void }
  def rewrite_document(); end
  sig { void }
  def context(); end
  sig { returns(T::Array[GraphQL::ObjectType]) }
  def object_types(); end
  sig { returns(T::Array[String]) }
  def path(); end
  # sord omit - no YARD type given for "rewrite:", using T.untyped
  sig { params(rules: T::Array[T.any(Module, Class)], rewrite: T.untyped).returns(Class) }
  def self.including_rules(rules, rewrite: true); end
  # sord omit - no YARD type given for "error", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(error: T.untyped, path: T.untyped).void }
  def add_error(error, path: nil); end
  sig { returns(GraphQL::Language::Nodes::Document) }
  def result(); end
  sig { params(node_class: Class).returns(NodeVisitor) }
  def [](node_class); end
  sig { void }
  def visit(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def visit_node(node, parent); end
  sig { params(node: GraphQL::Language::Nodes::AbstractNode, parent: T.nilable(GraphQL::Language::Nodes::AbstractNode)).returns(T.nilable(Array)) }
  def on_abstract_node(node, parent); end
  # sord omit - no YARD type given for "node_method", using T.untyped
  sig { params(node_method: T.untyped).void }
  def self.make_visit_method(node_method); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_node_with_modifications(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def begin_visit(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def end_visit(node, parent); end
  # sord omit - no YARD type given for "hooks", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(hooks: T.untyped, node: T.untyped, parent: T.untyped).void }
  def self.apply_hooks(hooks, node, parent); end
module ContextMethods
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_operation_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_inline_fragment(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_field(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_directive(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_argument(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_spread(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_input_object(node, parent); end
  sig { returns(GraphQL::BaseType) }
  def type_definition(); end
  sig { returns(GraphQL::BaseType) }
  def parent_type_definition(); end
  sig { returns(T.nilable(GraphQL::Field)) }
  def field_definition(); end
  sig { returns(T.nilable(GraphQL::Directive)) }
  def directive_definition(); end
  sig { returns(T.nilable(GraphQL::Argument)) }
  def argument_definition(); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def on_fragment_with_type(node); end
end
end
class DefaultVisitor < GraphQL::StaticValidation::BaseVisitor
  extend ContextMethods
  extend GraphQL::InternalRepresentation::Rewrite
  extend GraphQL::StaticValidation::DefinitionDependencies
  sig { returns(T.untyped) }
  def rewrite_document(); end
  sig { void }
  def initialize(); end
  sig { returns(T::Hash[String, Node]) }
  def operations(); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(ast_node: T.untyped, parent: T.untyped).void }
  def on_operation_definition(ast_node, parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(ast_node: T.untyped, parent: T.untyped).void }
  def on_fragment_definition(ast_node, parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "definitions", using T.untyped
  sig { params(ast_node: T.untyped, definitions: T.untyped).void }
  def push_root_node(ast_node, definitions); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_inline_fragment(node, parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "ast_parent", using T.untyped
  sig { params(ast_node: T.untyped, ast_parent: T.untyped).void }
  def on_field(ast_node, ast_parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "ast_parent", using T.untyped
  sig { params(ast_node: T.untyped, ast_parent: T.untyped).void }
  def on_fragment_spread(ast_node, ast_parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(ast_node: T.untyped).returns(T::Boolean) }
  def skip?(ast_node); end
  sig { void }
  def dependencies(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_document(node, parent); end
  sig { params(block: T.untyped).returns(DependencyMap) }
  def dependency_map(&block); end
  sig { void }
  def resolve_dependencies(); end
  sig { void }
  def context(); end
  sig { returns(T::Array[GraphQL::ObjectType]) }
  def object_types(); end
  sig { returns(T::Array[String]) }
  def path(); end
  # sord omit - no YARD type given for "rewrite:", using T.untyped
  sig { params(rules: T::Array[T.any(Module, Class)], rewrite: T.untyped).returns(Class) }
  def self.including_rules(rules, rewrite: true); end
  # sord omit - no YARD type given for "error", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(error: T.untyped, path: T.untyped).void }
  def add_error(error, path: nil); end
  sig { returns(GraphQL::Language::Nodes::Document) }
  def result(); end
  sig { params(node_class: Class).returns(NodeVisitor) }
  def [](node_class); end
  sig { void }
  def visit(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def visit_node(node, parent); end
  sig { params(node: GraphQL::Language::Nodes::AbstractNode, parent: T.nilable(GraphQL::Language::Nodes::AbstractNode)).returns(T.nilable(Array)) }
  def on_abstract_node(node, parent); end
  # sord omit - no YARD type given for "node_method", using T.untyped
  sig { params(node_method: T.untyped).void }
  def self.make_visit_method(node_method); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_node_with_modifications(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def begin_visit(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def end_visit(node, parent); end
  # sord omit - no YARD type given for "hooks", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(hooks: T.untyped, node: T.untyped, parent: T.untyped).void }
  def self.apply_hooks(hooks, node, parent); end
end
class LiteralValidator
  # sord omit - no YARD type given for "context:", using T.untyped
  sig { params(context: T.untyped).returns(LiteralValidator) }
  def initialize(context:); end
  # sord omit - no YARD type given for "ast_value", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(ast_value: T.untyped, type: T.untyped).void }
  def validate(ast_value, type); end
  # sord omit - no YARD type given for "ast_value", using T.untyped
  sig { params(ast_value: T.untyped).void }
  def maybe_raise_if_invalid(ast_value); end
  # sord omit - no YARD type given for "ast_value", using T.untyped
  sig { params(ast_value: T.untyped).returns(T::Boolean) }
  def constant_scalar?(ast_value); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(type: T.untyped, ast_node: T.untyped).void }
  def required_input_fields_are_present(type, ast_node); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(type: T.untyped, ast_node: T.untyped).void }
  def present_input_field_values_are_valid(type, ast_node); end
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(value: T.untyped).void }
  def ensure_array(value); end
end
class ValidationContext
  include Forwardable
  sig { void }
  def query(); end
  sig { void }
  def errors(); end
  sig { void }
  def visitor(); end
  sig { void }
  def on_dependency_resolve_handlers(); end
  # sord omit - no YARD type given for "query", using T.untyped
  # sord omit - no YARD type given for "visitor_class", using T.untyped
  sig { params(query: T.untyped, visitor_class: T.untyped).returns(ValidationContext) }
  def initialize(query, visitor_class); end
  sig { params(handler: T.untyped).void }
  def on_dependency_resolve(&handler); end
  # sord omit - no YARD type given for "ast_value", using T.untyped
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(ast_value: T.untyped, type: T.untyped).returns(T::Boolean) }
  def valid_literal?(ast_value, type); end
end
class InterpreterVisitor < GraphQL::StaticValidation::BaseVisitor
  extend ContextMethods
  extend GraphQL::StaticValidation::DefinitionDependencies
  sig { void }
  def dependencies(); end
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_document(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "prev_node", using T.untyped
  sig { params(node: T.untyped, prev_node: T.untyped).void }
  def on_operation_definition(node, prev_node); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_spread(node, parent); end
  sig { params(block: T.untyped).returns(DependencyMap) }
  def dependency_map(&block); end
  sig { void }
  def resolve_dependencies(); end
  sig { void }
  def rewrite_document(); end
  sig { void }
  def context(); end
  sig { returns(T::Array[GraphQL::ObjectType]) }
  def object_types(); end
  sig { returns(T::Array[String]) }
  def path(); end
  # sord omit - no YARD type given for "rewrite:", using T.untyped
  sig { params(rules: T::Array[T.any(Module, Class)], rewrite: T.untyped).returns(Class) }
  def self.including_rules(rules, rewrite: true); end
  # sord omit - no YARD type given for "error", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(error: T.untyped, path: T.untyped).void }
  def add_error(error, path: nil); end
  sig { returns(GraphQL::Language::Nodes::Document) }
  def result(); end
  sig { params(node_class: Class).returns(NodeVisitor) }
  def [](node_class); end
  sig { void }
  def visit(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def visit_node(node, parent); end
  sig { params(node: GraphQL::Language::Nodes::AbstractNode, parent: T.nilable(GraphQL::Language::Nodes::AbstractNode)).returns(T.nilable(Array)) }
  def on_abstract_node(node, parent); end
  # sord omit - no YARD type given for "node_method", using T.untyped
  sig { params(node_method: T.untyped).void }
  def self.make_visit_method(node_method); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_node_with_modifications(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def begin_visit(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def end_visit(node, parent); end
  # sord omit - no YARD type given for "hooks", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(hooks: T.untyped, node: T.untyped, parent: T.untyped).void }
  def self.apply_hooks(hooks, node, parent); end
end
class NoValidateVisitor < GraphQL::StaticValidation::BaseVisitor
  extend ContextMethods
  extend GraphQL::StaticValidation::DefinitionDependencies
  extend GraphQL::InternalRepresentation::Rewrite
  sig { void }
  def dependencies(); end
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_document(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "prev_node", using T.untyped
  sig { params(node: T.untyped, prev_node: T.untyped).void }
  def on_operation_definition(node, prev_node); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_spread(node, parent); end
  sig { params(block: T.untyped).returns(DependencyMap) }
  def dependency_map(&block); end
  sig { void }
  def resolve_dependencies(); end
  sig { returns(T.untyped) }
  def rewrite_document(); end
  sig { returns(T::Hash[String, Node]) }
  def operations(); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "definitions", using T.untyped
  sig { params(ast_node: T.untyped, definitions: T.untyped).void }
  def push_root_node(ast_node, definitions); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_inline_fragment(node, parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "ast_parent", using T.untyped
  sig { params(ast_node: T.untyped, ast_parent: T.untyped).void }
  def on_field(ast_node, ast_parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(ast_node: T.untyped).returns(T::Boolean) }
  def skip?(ast_node); end
  sig { void }
  def context(); end
  sig { returns(T::Array[GraphQL::ObjectType]) }
  def object_types(); end
  sig { returns(T::Array[String]) }
  def path(); end
  # sord omit - no YARD type given for "rewrite:", using T.untyped
  sig { params(rules: T::Array[T.any(Module, Class)], rewrite: T.untyped).returns(Class) }
  def self.including_rules(rules, rewrite: true); end
  # sord omit - no YARD type given for "error", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(error: T.untyped, path: T.untyped).void }
  def add_error(error, path: nil); end
  sig { returns(GraphQL::Language::Nodes::Document) }
  def result(); end
  sig { params(node_class: Class).returns(NodeVisitor) }
  def [](node_class); end
  sig { void }
  def visit(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def visit_node(node, parent); end
  sig { params(node: GraphQL::Language::Nodes::AbstractNode, parent: T.nilable(GraphQL::Language::Nodes::AbstractNode)).returns(T.nilable(Array)) }
  def on_abstract_node(node, parent); end
  # sord omit - no YARD type given for "node_method", using T.untyped
  sig { params(node_method: T.untyped).void }
  def self.make_visit_method(node_method); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_node_with_modifications(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def begin_visit(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def end_visit(node, parent); end
  # sord omit - no YARD type given for "hooks", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(hooks: T.untyped, node: T.untyped, parent: T.untyped).void }
  def self.apply_hooks(hooks, node, parent); end
end
module DefinitionDependencies
  sig { void }
  def dependencies(); end
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_document(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "prev_node", using T.untyped
  sig { params(node: T.untyped, prev_node: T.untyped).void }
  def on_operation_definition(node, prev_node); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_spread(node, parent); end
  sig { params(block: T.untyped).returns(DependencyMap) }
  def dependency_map(&block); end
  sig { void }
  def resolve_dependencies(); end
class DependencyMap
  sig { returns(T::Array[GraphQL::Language::Nodes::FragmentDefinition]) }
  def cyclical_definitions(); end
  sig { returns(T::Hash[Node, T::Array[GraphQL::Language::Nodes::FragmentSpread]]) }
  def unmet_dependencies(); end
  sig { returns(T::Array[GraphQL::Language::Nodes::FragmentDefinition]) }
  def unused_dependencies(); end
  sig { returns(DependencyMap) }
  def initialize(); end
  # sord omit - no YARD type given for "definition_node", using T.untyped
  sig { params(definition_node: T.untyped).returns(T::Array[GraphQL::Language::Nodes::AbstractNode]) }
  def [](definition_node); end
end
class NodeWithPath
  include Forwardable
  sig { void }
  def node(); end
  sig { void }
  def path(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "path", using T.untyped
  sig { params(node: T.untyped, path: T.untyped).returns(NodeWithPath) }
  def initialize(node, path); end
end
end
module FieldsWillMerge
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_parent", using T.untyped
  sig { params(node: T.untyped, _parent: T.untyped).void }
  def on_operation_definition(node, _parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_parent", using T.untyped
  sig { params(node: T.untyped, _parent: T.untyped).void }
  def on_field(node, _parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent_type", using T.untyped
  sig { params(node: T.untyped, parent_type: T.untyped).void }
  def conflicts_within_selection_set(node, parent_type); end
  # sord omit - no YARD type given for "fragment_spread1", using T.untyped
  # sord omit - no YARD type given for "fragment_spread2", using T.untyped
  # sord omit - no YARD type given for "mutually_exclusive:", using T.untyped
  sig { params(fragment_spread1: T.untyped, fragment_spread2: T.untyped, mutually_exclusive: T.untyped).void }
  def find_conflicts_between_fragments(fragment_spread1, fragment_spread2, mutually_exclusive:); end
  # sord omit - no YARD type given for "fragment_spread", using T.untyped
  # sord omit - no YARD type given for "fields", using T.untyped
  # sord omit - no YARD type given for "mutually_exclusive:", using T.untyped
  sig { params(fragment_spread: T.untyped, fields: T.untyped, mutually_exclusive: T.untyped).void }
  def find_conflicts_between_fields_and_fragment(fragment_spread, fields, mutually_exclusive:); end
  # sord omit - no YARD type given for "response_keys", using T.untyped
  sig { params(response_keys: T.untyped).void }
  def find_conflicts_within(response_keys); end
  # sord omit - no YARD type given for "response_key", using T.untyped
  # sord omit - no YARD type given for "field1", using T.untyped
  # sord omit - no YARD type given for "field2", using T.untyped
  # sord omit - no YARD type given for "mutually_exclusive:", using T.untyped
  sig { params(response_key: T.untyped, field1: T.untyped, field2: T.untyped, mutually_exclusive: T.untyped).void }
  def find_conflict(response_key, field1, field2, mutually_exclusive: false); end
  # sord omit - no YARD type given for "field1", using T.untyped
  # sord omit - no YARD type given for "field2", using T.untyped
  # sord omit - no YARD type given for "mutually_exclusive:", using T.untyped
  sig { params(field1: T.untyped, field2: T.untyped, mutually_exclusive: T.untyped).void }
  def find_conflicts_between_sub_selection_sets(field1, field2, mutually_exclusive:); end
  # sord omit - no YARD type given for "response_keys", using T.untyped
  # sord omit - no YARD type given for "response_keys2", using T.untyped
  # sord omit - no YARD type given for "mutually_exclusive:", using T.untyped
  sig { params(response_keys: T.untyped, response_keys2: T.untyped, mutually_exclusive: T.untyped).void }
  def find_conflicts_between(response_keys, response_keys2, mutually_exclusive:); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "owner_type:", using T.untyped
  # sord omit - no YARD type given for "parents:", using T.untyped
  sig { params(node: T.untyped, owner_type: T.untyped, parents: T.untyped).void }
  def fields_and_fragments_from_selection(node, owner_type:, parents:); end
  # sord omit - no YARD type given for "selections", using T.untyped
  # sord omit - no YARD type given for "owner_type:", using T.untyped
  # sord omit - no YARD type given for "parents:", using T.untyped
  # sord omit - no YARD type given for "fields:", using T.untyped
  # sord omit - no YARD type given for "fragment_spreads:", using T.untyped
  sig { params(selections: T.untyped, owner_type: T.untyped, parents: T.untyped, fields: T.untyped, fragment_spreads: T.untyped).void }
  def find_fields_and_fragments(selections, owner_type:, parents:, fields:, fragment_spreads:); end
  # sord omit - no YARD type given for "field1", using T.untyped
  # sord omit - no YARD type given for "field2", using T.untyped
  sig { params(field1: T.untyped, field2: T.untyped).void }
  def possible_arguments(field1, field2); end
  # sord omit - no YARD type given for "frag1", using T.untyped
  # sord omit - no YARD type given for "frag2", using T.untyped
  # sord omit - no YARD type given for "exclusive", using T.untyped
  sig { params(frag1: T.untyped, frag2: T.untyped, exclusive: T.untyped).void }
  def compared_fragments_key(frag1, frag2, exclusive); end
  # sord omit - no YARD type given for "parents1", using T.untyped
  # sord omit - no YARD type given for "parents2", using T.untyped
  sig { params(parents1: T.untyped, parents2: T.untyped).returns(T::Boolean) }
  def mutually_exclusive?(parents1, parents2); end
class Field < Struct
  sig { params(value: Object).returns(Object) }
  def node=(value); end
  sig { returns(Object) }
  def node(); end
  sig { params(value: Object).returns(Object) }
  def definition=(value); end
  sig { returns(Object) }
  def definition(); end
  sig { params(value: Object).returns(Object) }
  def owner_type=(value); end
  sig { returns(Object) }
  def owner_type(); end
  sig { params(value: Object).returns(Object) }
  def parents=(value); end
  sig { returns(Object) }
  def parents(); end
end
class FragmentSpread < Struct
  sig { params(value: Object).returns(Object) }
  def name=(value); end
  sig { returns(Object) }
  def name(); end
  sig { params(value: Object).returns(Object) }
  def parents=(value); end
  sig { returns(Object) }
  def parents(); end
end
end
module FragmentsAreUsed
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_document(node, parent); end
end
module FragmentsAreNamed
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_parent", using T.untyped
  sig { params(node: T.untyped, _parent: T.untyped).void }
  def on_fragment_definition(node, _parent); end
end
module FragmentTypesExist
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_parent", using T.untyped
  sig { params(node: T.untyped, _parent: T.untyped).void }
  def on_fragment_definition(node, _parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_parent", using T.untyped
  sig { params(node: T.untyped, _parent: T.untyped).void }
  def on_inline_fragment(node, _parent); end
  # sord omit - no YARD type given for "fragment_node", using T.untyped
  sig { params(fragment_node: T.untyped).void }
  def validate_type_exists(fragment_node); end
end
module FragmentsAreFinite
  # sord omit - no YARD type given for "_n", using T.untyped
  # sord omit - no YARD type given for "_p", using T.untyped
  sig { params(_n: T.untyped, _p: T.untyped).void }
  def on_document(_n, _p); end
end
module MutationRootExists
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_parent", using T.untyped
  sig { params(node: T.untyped, _parent: T.untyped).void }
  def on_operation_definition(node, _parent); end
end
module ArgumentsAreDefined
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_argument(node, parent); end
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(parent: T.untyped, type_defn: T.untyped).void }
  def parent_name(parent, type_defn); end
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(parent: T.untyped).void }
  def node_type(parent); end
end
module DirectivesAreDefined
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_directive(node, parent); end
end
class FieldsWillMergeError < GraphQL::StaticValidation::Error
  sig { void }
  def field_name(); end
  sig { void }
  def conflicts(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "field_name:", using T.untyped
  # sord omit - no YARD type given for "conflicts:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, field_name: T.untyped, conflicts: T.untyped).returns(FieldsWillMergeError) }
  def initialize(message, path: nil, nodes: [], field_name:, conflicts:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class FragmentsAreUsedError < GraphQL::StaticValidation::Error
  sig { void }
  def fragment_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "fragment:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, fragment: T.untyped).returns(FragmentsAreUsedError) }
  def initialize(message, path: nil, nodes: [], fragment:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module SubscriptionRootExists
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_parent", using T.untyped
  sig { params(node: T.untyped, _parent: T.untyped).void }
  def on_operation_definition(node, _parent); end
end
module ArgumentNamesAreUnique
  extend GraphQL::StaticValidation::Error::ErrorHelper
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_field(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_directive(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def validate_arguments(node); end
  # sord omit - no YARD type given for "error_message", using T.untyped
  # sord omit - no YARD type given for "nodes", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "extensions:", using T.untyped
  sig { params(error_message: T.untyped, nodes: T.untyped, context: T.untyped, path: T.untyped, extensions: T.untyped).void }
  def error(error_message, nodes, context: nil, path: nil, extensions: {}); end
end
module FragmentNamesAreUnique
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_definition(node, parent); end
  # sord omit - no YARD type given for "_n", using T.untyped
  # sord omit - no YARD type given for "_p", using T.untyped
  sig { params(_n: T.untyped, _p: T.untyped).void }
  def on_document(_n, _p); end
end
class FragmentsAreNamedError < GraphQL::StaticValidation::Error
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped).returns(FragmentsAreNamedError) }
  def initialize(message, path: nil, nodes: []); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module OperationNamesAreValid
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_operation_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_document(node, parent); end
end
module VariableNamesAreUnique
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_operation_definition(node, parent); end
end
module VariablesAreInputTypes
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_variable_definition(node, parent); end
  # sord omit - no YARD type given for "ast_type", using T.untyped
  sig { params(ast_type: T.untyped).void }
  def get_type_name(ast_type); end
end
module FieldsAreDefinedOnType
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_field(node, parent); end
end
class FragmentTypesExistError < GraphQL::StaticValidation::Error
  sig { void }
  def type_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, type: T.untyped).returns(FragmentTypesExistError) }
  def initialize(message, path: nil, nodes: [], type:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class FragmentsAreFiniteError < GraphQL::StaticValidation::Error
  sig { void }
  def fragment_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, name: T.untyped).returns(FragmentsAreFiniteError) }
  def initialize(message, path: nil, nodes: [], name:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class MutationRootExistsError < GraphQL::StaticValidation::Error
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped).returns(MutationRootExistsError) }
  def initialize(message, path: nil, nodes: []); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module NoDefinitionsArePresent
  extend GraphQL::StaticValidation::Error::ErrorHelper
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_invalid_node(node, parent); end
  sig { void }
  def on_directive_definition(); end
  sig { void }
  def on_schema_definition(); end
  sig { void }
  def on_scalar_type_definition(); end
  sig { void }
  def on_object_type_definition(); end
  sig { void }
  def on_input_object_type_definition(); end
  sig { void }
  def on_interface_type_definition(); end
  sig { void }
  def on_union_type_definition(); end
  sig { void }
  def on_enum_type_definition(); end
  sig { void }
  def on_schema_extension(); end
  sig { void }
  def on_scalar_type_extension(); end
  sig { void }
  def on_object_type_extension(); end
  sig { void }
  def on_input_object_type_extension(); end
  sig { void }
  def on_interface_type_extension(); end
  sig { void }
  def on_union_type_extension(); end
  sig { void }
  def on_enum_type_extension(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_document(node, parent); end
  # sord omit - no YARD type given for "error_message", using T.untyped
  # sord omit - no YARD type given for "nodes", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "extensions:", using T.untyped
  sig { params(error_message: T.untyped, nodes: T.untyped, context: T.untyped, path: T.untyped, extensions: T.untyped).void }
  def error(error_message, nodes, context: nil, path: nil, extensions: {}); end
end
class ArgumentsAreDefinedError < GraphQL::StaticValidation::Error
  sig { void }
  def name(); end
  sig { void }
  def type_name(); end
  sig { void }
  def argument_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "argument:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, name: T.untyped, type: T.untyped, argument: T.untyped).returns(ArgumentsAreDefinedError) }
  def initialize(message, path: nil, nodes: [], name:, type:, argument:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module VariableUsagesAreAllowed
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_operation_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_argument(node, parent); end
  # sord omit - no YARD type given for "arguments", using T.untyped
  # sord omit - no YARD type given for "arg_node", using T.untyped
  # sord omit - no YARD type given for "ast_var", using T.untyped
  sig { params(arguments: T.untyped, arg_node: T.untyped, ast_var: T.untyped).void }
  def validate_usage(arguments, arg_node, ast_var); end
  # sord omit - no YARD type given for "error_message", using T.untyped
  # sord omit - no YARD type given for "var_type", using T.untyped
  # sord omit - no YARD type given for "ast_var", using T.untyped
  # sord omit - no YARD type given for "arg_defn", using T.untyped
  # sord omit - no YARD type given for "arg_node", using T.untyped
  sig { params(error_message: T.untyped, var_type: T.untyped, ast_var: T.untyped, arg_defn: T.untyped, arg_node: T.untyped).void }
  def create_error(error_message, var_type, ast_var, arg_defn, arg_node); end
  # sord omit - no YARD type given for "var_type", using T.untyped
  # sord omit - no YARD type given for "arg_node", using T.untyped
  sig { params(var_type: T.untyped, arg_node: T.untyped).void }
  def wrap_var_type_with_depth_of_arg(var_type, arg_node); end
  # sord omit - no YARD type given for "array", using T.untyped
  sig { params(array: T.untyped).returns(Integer) }
  def depth_of_array(array); end
  # sord omit - no YARD type given for "type", using T.untyped
  sig { params(type: T.untyped).void }
  def list_dimension(type); end
  # sord omit - no YARD type given for "arg_type", using T.untyped
  # sord omit - no YARD type given for "var_type", using T.untyped
  sig { params(arg_type: T.untyped, var_type: T.untyped).void }
  def non_null_levels_match(arg_type, var_type); end
end
class DirectivesAreDefinedError < GraphQL::StaticValidation::Error
  sig { void }
  def directive_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "directive:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, directive: T.untyped).returns(DirectivesAreDefinedError) }
  def initialize(message, path: nil, nodes: [], directive:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module FragmentSpreadsArePossible
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_inline_fragment(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_spread(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_document(node, parent); end
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "child_type", using T.untyped
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  # sord omit - no YARD type given for "path", using T.untyped
  sig { params(parent_type: T.untyped, child_type: T.untyped, node: T.untyped, context: T.untyped, path: T.untyped).void }
  def validate_fragment_in_scope(parent_type, child_type, node, context, path); end
class FragmentSpread
  sig { void }
  def node(); end
  sig { void }
  def parent_type(); end
  sig { void }
  def path(); end
  # sord omit - no YARD type given for "node:", using T.untyped
  # sord omit - no YARD type given for "parent_type:", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  sig { params(node: T.untyped, parent_type: T.untyped, path: T.untyped).returns(FragmentSpread) }
  def initialize(node:, parent_type:, path:); end
end
end
module RequiredArgumentsArePresent
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_parent", using T.untyped
  sig { params(node: T.untyped, _parent: T.untyped).void }
  def on_field(node, _parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_parent", using T.untyped
  sig { params(node: T.untyped, _parent: T.untyped).void }
  def on_directive(node, _parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "defn", using T.untyped
  sig { params(ast_node: T.untyped, defn: T.untyped).void }
  def assert_required_args(ast_node, defn); end
end
class SubscriptionRootExistsError < GraphQL::StaticValidation::Error
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped).returns(SubscriptionRootExistsError) }
  def initialize(message, path: nil, nodes: []); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module UniqueDirectivesPerLocation
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def validate_directive_location(node); end
end
module VariablesAreUsedAndDefined
  sig { void }
  def initialize(); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_operation_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_spread(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_variable_identifier(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_document(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent_variables", using T.untyped
  # sord omit - no YARD type given for "spreads_for_context", using T.untyped
  # sord omit - no YARD type given for "fragment_definitions", using T.untyped
  # sord omit - no YARD type given for "visited_fragments", using T.untyped
  sig { params(node: T.untyped, parent_variables: T.untyped, spreads_for_context: T.untyped, fragment_definitions: T.untyped, visited_fragments: T.untyped).void }
  def follow_spreads(node, parent_variables, spreads_for_context, fragment_definitions, visited_fragments); end
  # sord omit - no YARD type given for "node_variables", using T.untyped
  sig { params(node_variables: T.untyped).void }
  def create_errors(node_variables); end
class VariableUsage
  sig { void }
  def ast_node(); end
  sig { params(value: T.untyped).void }
  def ast_node=(value); end
  sig { void }
  def used_by(); end
  sig { params(value: T.untyped).void }
  def used_by=(value); end
  sig { void }
  def declared_by(); end
  sig { params(value: T.untyped).void }
  def declared_by=(value); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { returns(T::Boolean) }
  def used?(); end
  sig { returns(T::Boolean) }
  def declared?(); end
end
end
class ArgumentNamesAreUniqueError < GraphQL::StaticValidation::Error
  sig { void }
  def name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, name: T.untyped).returns(ArgumentNamesAreUniqueError) }
  def initialize(message, path: nil, nodes: [], name:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class FragmentNamesAreUniqueError < GraphQL::StaticValidation::Error
  sig { void }
  def fragment_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, name: T.untyped).returns(FragmentNamesAreUniqueError) }
  def initialize(message, path: nil, nodes: [], name:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class OperationNamesAreValidError < GraphQL::StaticValidation::Error
  sig { void }
  def operation_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, name: T.untyped).returns(OperationNamesAreValidError) }
  def initialize(message, path: nil, nodes: [], name: nil); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class VariableNamesAreUniqueError < GraphQL::StaticValidation::Error
  sig { void }
  def variable_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, name: T.untyped).returns(VariableNamesAreUniqueError) }
  def initialize(message, path: nil, nodes: [], name:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class VariablesAreInputTypesError < GraphQL::StaticValidation::Error
  sig { void }
  def type_name(); end
  sig { void }
  def variable_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, type: T.untyped, name: T.untyped).returns(VariablesAreInputTypesError) }
  def initialize(message, path: nil, nodes: [], type:, name:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module ArgumentLiteralsAreCompatible
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_argument(node, parent); end
  # sord omit - no YARD type given for "parent", using T.untyped
  # sord omit - no YARD type given for "type_defn", using T.untyped
  sig { params(parent: T.untyped, type_defn: T.untyped).void }
  def parent_name(parent, type_defn); end
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(parent: T.untyped).void }
  def node_type(parent); end
end
class FieldsAreDefinedOnTypeError < GraphQL::StaticValidation::Error
  sig { void }
  def type_name(); end
  sig { void }
  def field_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "field:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, type: T.untyped, field: T.untyped).returns(FieldsAreDefinedOnTypeError) }
  def initialize(message, path: nil, nodes: [], type:, field:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module FragmentsAreOnCompositeTypes
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_fragment_definition(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_inline_fragment(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def validate_type_is_composite(node); end
end
class NoDefinitionsArePresentError < GraphQL::StaticValidation::Error
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped).returns(NoDefinitionsArePresentError) }
  def initialize(message, path: nil, nodes: []); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module DirectivesAreInValidLocations
  extend GraphQL::Language
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_directive(node, parent); end
  # sord omit - no YARD type given for "ast_directive", using T.untyped
  # sord omit - no YARD type given for "ast_parent", using T.untyped
  # sord omit - no YARD type given for "directives", using T.untyped
  sig { params(ast_directive: T.untyped, ast_parent: T.untyped, directives: T.untyped).void }
  def validate_location(ast_directive, ast_parent, directives); end
  # sord omit - no YARD type given for "directive_defn", using T.untyped
  # sord omit - no YARD type given for "directive_ast", using T.untyped
  # sord omit - no YARD type given for "required_location", using T.untyped
  sig { params(directive_defn: T.untyped, directive_ast: T.untyped, required_location: T.untyped).void }
  def assert_includes_location(directive_defn, directive_ast, required_location); end
end
class VariableUsagesAreAllowedError < GraphQL::StaticValidation::Error
  sig { void }
  def type_name(); end
  sig { void }
  def variable_name(); end
  sig { void }
  def argument_name(); end
  sig { void }
  def error_message(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "argument:", using T.untyped
  # sord omit - no YARD type given for "error:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, type: T.untyped, name: T.untyped, argument: T.untyped, error: T.untyped).returns(VariableUsagesAreAllowedError) }
  def initialize(message, path: nil, nodes: [], type:, name:, argument:, error:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module FieldsHaveAppropriateSelections
  extend GraphQL::StaticValidation::Error::ErrorHelper
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_field(node, parent); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "_parent", using T.untyped
  sig { params(node: T.untyped, _parent: T.untyped).void }
  def on_operation_definition(node, _parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "resolved_type", using T.untyped
  sig { params(ast_node: T.untyped, resolved_type: T.untyped).void }
  def validate_field_selections(ast_node, resolved_type); end
  # sord omit - no YARD type given for "error_message", using T.untyped
  # sord omit - no YARD type given for "nodes", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "extensions:", using T.untyped
  sig { params(error_message: T.untyped, nodes: T.untyped, context: T.untyped, path: T.untyped, extensions: T.untyped).void }
  def error(error_message, nodes, context: nil, path: nil, extensions: {}); end
end
class FragmentSpreadsArePossibleError < GraphQL::StaticValidation::Error
  sig { void }
  def type_name(); end
  sig { void }
  def fragment_name(); end
  sig { void }
  def parent_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "fragment_name:", using T.untyped
  # sord omit - no YARD type given for "parent:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, type: T.untyped, fragment_name: T.untyped, parent: T.untyped).returns(FragmentSpreadsArePossibleError) }
  def initialize(message, path: nil, nodes: [], type:, fragment_name:, parent:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class RequiredArgumentsArePresentError < GraphQL::StaticValidation::Error
  sig { void }
  def class_name(); end
  sig { void }
  def name(); end
  sig { void }
  def arguments(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "class_name:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "arguments:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, class_name: T.untyped, name: T.untyped, arguments: T.untyped).returns(RequiredArgumentsArePresentError) }
  def initialize(message, path: nil, nodes: [], class_name:, name:, arguments:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class UniqueDirectivesPerLocationError < GraphQL::StaticValidation::Error
  sig { void }
  def directive_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "directive:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, directive: T.untyped).returns(UniqueDirectivesPerLocationError) }
  def initialize(message, path: nil, nodes: [], directive:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class VariablesAreUsedAndDefinedError < GraphQL::StaticValidation::Error
  sig { void }
  def variable_name(); end
  sig { void }
  def violation(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "error_type:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, name: T.untyped, error_type: T.untyped).returns(VariablesAreUsedAndDefinedError) }
  def initialize(message, path: nil, nodes: [], name:, error_type:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class ArgumentLiteralsAreCompatibleError < GraphQL::StaticValidation::Error
  sig { void }
  def type_name(); end
  sig { void }
  def argument_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "argument:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, type: T.untyped, argument: T.untyped).returns(ArgumentLiteralsAreCompatibleError) }
  def initialize(message, path: nil, nodes: [], type:, argument: nil); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class FragmentsAreOnCompositeTypesError < GraphQL::StaticValidation::Error
  sig { void }
  def type_name(); end
  sig { void }
  def argument_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, type: T.untyped).returns(FragmentsAreOnCompositeTypesError) }
  def initialize(message, path: nil, nodes: [], type:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class DirectivesAreInValidLocationsError < GraphQL::StaticValidation::Error
  sig { void }
  def target_name(); end
  sig { void }
  def name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "target:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, target: T.untyped, name: T.untyped).returns(DirectivesAreInValidLocationsError) }
  def initialize(message, path: nil, nodes: [], target:, name: nil); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class FieldsHaveAppropriateSelectionsError < GraphQL::StaticValidation::Error
  sig { void }
  def type_name(); end
  sig { void }
  def node_name(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "node_name:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, node_name: T.untyped, type: T.untyped).returns(FieldsHaveAppropriateSelectionsError) }
  def initialize(message, path: nil, nodes: [], node_name:, type: nil); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
module VariableDefaultValuesAreCorrectlyTyped
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_variable_definition(node, parent); end
end
module RequiredInputObjectAttributesArePresent
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_input_object(node, parent); end
  # sord omit - no YARD type given for "context", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(context: T.untyped, parent: T.untyped).void }
  def get_parent_type(context, parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "context", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(ast_node: T.untyped, context: T.untyped, parent: T.untyped).void }
  def validate_input_object(ast_node, context, parent); end
end
class VariableDefaultValuesAreCorrectlyTypedError < GraphQL::StaticValidation::Error
  sig { void }
  def variable_name(); end
  sig { void }
  def type_name(); end
  sig { void }
  def violation(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "error_type:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, name: T.untyped, type: T.untyped, error_type: T.untyped).returns(VariableDefaultValuesAreCorrectlyTypedError) }
  def initialize(message, path: nil, nodes: [], name:, type: nil, error_type:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
class RequiredInputObjectAttributesArePresentError < GraphQL::StaticValidation::Error
  sig { void }
  def argument_type(); end
  sig { void }
  def argument_name(); end
  sig { void }
  def input_object_type(); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "path:", using T.untyped
  # sord omit - no YARD type given for "nodes:", using T.untyped
  # sord omit - no YARD type given for "argument_type:", using T.untyped
  # sord omit - no YARD type given for "argument_name:", using T.untyped
  # sord omit - no YARD type given for "input_object_type:", using T.untyped
  sig { params(message: T.untyped, path: T.untyped, nodes: T.untyped, argument_type: T.untyped, argument_name: T.untyped, input_object_type: T.untyped).returns(RequiredInputObjectAttributesArePresentError) }
  def initialize(message, path:, nodes:, argument_type:, argument_name:, input_object_type:); end
  sig { void }
  def to_h(); end
  sig { void }
  def code(); end
  sig { void }
  def message(); end
  sig { void }
  def path(); end
  sig { params(value: T.untyped).void }
  def path=(value); end
  sig { void }
  def locations(); end
end
end
class LiteralValidationError < GraphQL::Error
  sig { void }
  def ast_value(); end
  sig { params(value: T.untyped).void }
  def ast_value=(value); end
end
class UnauthorizedFieldError < GraphQL::UnauthorizedError
  sig { returns(Field) }
  def field(); end
  # sord infer - inferred type of parameter "value" as Field using getter's return type
  sig { params(value: Field).returns(Field) }
  def field=(value); end
  # sord omit - no YARD type given for "message", using T.untyped
  # sord omit - no YARD type given for "object:", using T.untyped
  # sord omit - no YARD type given for "type:", using T.untyped
  # sord omit - no YARD type given for "context:", using T.untyped
  # sord omit - no YARD type given for "field:", using T.untyped
  sig { params(message: T.untyped, object: T.untyped, type: T.untyped, context: T.untyped, field: T.untyped).returns(UnauthorizedFieldError) }
  def initialize(message = nil, object: nil, type: nil, context: nil, field: nil); end
  sig { returns(Object) }
  def object(); end
  sig { returns(Class) }
  def type(); end
  sig { returns(GraphQL::Query::Context) }
  def context(); end
end
module InternalRepresentation
class Node
  sig { returns(String) }
  def name(); end
  sig { returns(GraphQL::ObjectType) }
  def owner_type(); end
  sig { returns(T::Hash[GraphQL::ObjectType, T::Hash[String, Node]]) }
  def typed_children(); end
  sig { returns(T::Hash[GraphQL::BaseType, T::Hash[String, Node]]) }
  def scoped_children(); end
  sig { returns(T::Array[Language::Nodes::AbstractNode]) }
  def ast_nodes(); end
  sig { returns(T::Array[GraphQL::Field]) }
  def definitions(); end
  sig { returns(GraphQL::BaseType) }
  def return_type(); end
  sig { returns(T.nilable(InternalRepresentation::Node)) }
  def parent(); end
  # sord omit - no YARD type given for "name:", using T.untyped
  # sord omit - no YARD type given for "owner_type:", using T.untyped
  # sord omit - no YARD type given for "query:", using T.untyped
  # sord omit - no YARD type given for "return_type:", using T.untyped
  # sord omit - no YARD type given for "parent:", using T.untyped
  # sord omit - no YARD type given for "ast_nodes:", using T.untyped
  # sord omit - no YARD type given for "definitions:", using T.untyped
  sig { params(name: T.untyped, owner_type: T.untyped, query: T.untyped, return_type: T.untyped, parent: T.untyped, ast_nodes: T.untyped, definitions: T.untyped).returns(Node) }
  def initialize(name:, owner_type:, query:, return_type:, parent:, ast_nodes: [], definitions: []); end
  # sord omit - no YARD type given for "other_node", using T.untyped
  sig { params(other_node: T.untyped).void }
  def initialize_copy(other_node); end
  # sord omit - no YARD type given for "other", using T.untyped
  sig { params(other: T.untyped).void }
  def ==(other); end
  sig { void }
  def definition_name(); end
  sig { void }
  def arguments(); end
  sig { void }
  def definition(); end
  sig { void }
  def ast_node(); end
  sig { void }
  def inspect(); end
  # sord omit - no YARD type given for "new_parent", using T.untyped
  # sord omit - no YARD type given for "scope:", using T.untyped
  # sord omit - no YARD type given for "merge_self:", using T.untyped
  sig { params(new_parent: T.untyped, scope: T.untyped, merge_self: T.untyped).void }
  def deep_merge_node(new_parent, scope: nil, merge_self: true); end
  sig { returns(GraphQL::Query) }
  def query(); end
  sig { void }
  def subscription_topic(); end
  sig { params(value: T.untyped).void }
  def owner_type=(value); end
  sig { params(value: T.untyped).void }
  def parent=(value); end
  sig { params(obj_type: GraphQL::ObjectType).returns(T::Hash[String, Node]) }
  def get_typed_children(obj_type); end
end
module Print
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "query_string", using T.untyped
  sig { params(schema: T.untyped, query_string: T.untyped).void }
  def print(schema, query_string); end
  # sord omit - no YARD type given for "schema", using T.untyped
  # sord omit - no YARD type given for "query_string", using T.untyped
  sig { params(schema: T.untyped, query_string: T.untyped).void }
  def self.print(schema, query_string); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped).void }
  def print_node(node, indent: 0); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "indent:", using T.untyped
  sig { params(node: T.untyped, indent: T.untyped).void }
  def self.print_node(node, indent: 0); end
end
class Scope
  sig { params(query: GraphQL::Query, type_defn: T.nilable(T.any(GraphQL::BaseType, T::Array[GraphQL::BaseType]))).returns(Scope) }
  def initialize(query, type_defn); end
  sig { params(other_type_defn: T.nilable(GraphQL::BaseType)).returns(Scope) }
  def enter(other_type_defn); end
  sig { void }
  def each(); end
  sig { void }
  def concrete_types(); end
end
module Visit
  # sord omit - no YARD type given for "operations", using T.untyped
  # sord omit - no YARD type given for "handlers", using T.untyped
  sig { params(operations: T.untyped, handlers: T.untyped).void }
  def visit_each_node(operations, handlers); end
  # sord omit - no YARD type given for "operations", using T.untyped
  # sord omit - no YARD type given for "handlers", using T.untyped
  sig { params(operations: T.untyped, handlers: T.untyped).void }
  def self.visit_each_node(operations, handlers); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def each_node(node); end
  # sord omit - no YARD type given for "node", using T.untyped
  sig { params(node: T.untyped).void }
  def self.each_node(node); end
end
module Rewrite
  extend GraphQL::Language
  sig { returns(T.untyped) }
  def rewrite_document(); end
  sig { void }
  def initialize(); end
  sig { returns(T::Hash[String, Node]) }
  def operations(); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(ast_node: T.untyped, parent: T.untyped).void }
  def on_operation_definition(ast_node, parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(ast_node: T.untyped, parent: T.untyped).void }
  def on_fragment_definition(ast_node, parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "definitions", using T.untyped
  sig { params(ast_node: T.untyped, definitions: T.untyped).void }
  def push_root_node(ast_node, definitions); end
  # sord omit - no YARD type given for "node", using T.untyped
  # sord omit - no YARD type given for "parent", using T.untyped
  sig { params(node: T.untyped, parent: T.untyped).void }
  def on_inline_fragment(node, parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "ast_parent", using T.untyped
  sig { params(ast_node: T.untyped, ast_parent: T.untyped).void }
  def on_field(ast_node, ast_parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  # sord omit - no YARD type given for "ast_parent", using T.untyped
  sig { params(ast_node: T.untyped, ast_parent: T.untyped).void }
  def on_fragment_spread(ast_node, ast_parent); end
  # sord omit - no YARD type given for "ast_node", using T.untyped
  sig { params(ast_node: T.untyped).returns(T::Boolean) }
  def skip?(ast_node); end
end
class Document
  sig { returns(T::Hash[String, Node]) }
  def operation_definitions(); end
  sig { returns(T::Hash[String, Node]) }
  def fragment_definitions(); end
  sig { returns(Document) }
  def initialize(); end
  # sord omit - no YARD type given for "key", using T.untyped
  sig { params(key: T.untyped).void }
  def [](key); end
  sig { params(block: T.untyped).void }
  def each(&block); end
end
end
class LoadApplicationObjectFailedError < GraphQL::ExecutionError
  sig { returns(GraphQL::Schema::Argument) }
  def argument(); end
  sig { returns(String) }
  def id(); end
  sig { returns(Object) }
  def object(); end
  # sord omit - no YARD type given for "argument:", using T.untyped
  # sord omit - no YARD type given for "id:", using T.untyped
  # sord omit - no YARD type given for "object:", using T.untyped
  sig { params(argument: T.untyped, id: T.untyped, object: T.untyped).returns(LoadApplicationObjectFailedError) }
  def initialize(argument:, id:, object:); end
  sig { returns(GraphQL::Language::Nodes::Field) }
  def ast_node(); end
  # sord infer - inferred type of parameter "value" as GraphQL::Language::Nodes::Field using getter's return type
  sig { params(value: GraphQL::Language::Nodes::Field).returns(GraphQL::Language::Nodes::Field) }
  def ast_node=(value); end
  sig { returns(String) }
  def path(); end
  # sord infer - inferred type of parameter "value" as String using getter's return type
  sig { params(value: String).returns(String) }
  def path=(value); end
  sig { returns(Hash) }
  def options(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def options=(value); end
  sig { returns(Hash) }
  def extensions(); end
  # sord infer - inferred type of parameter "value" as Hash using getter's return type
  sig { params(value: Hash).returns(Hash) }
  def extensions=(value); end
  sig { returns(Hash) }
  def to_h(); end
end
module Compatibility
module ExecutionSpecification
  # sord warn - "<#new, #execute>" does not appear to be a type
  # sord warn - unsupported generic type "Class" in "Class<Minitest::Test>"
  sig { params(execution_strategy: SORD_ERROR_newexecute).returns(SORD_ERROR_Class) }
  def self.build_suite(execution_strategy); end
module CounterSchema
  # sord omit - no YARD type given for "execution_strategy", using T.untyped
  sig { params(execution_strategy: T.untyped).void }
  def self.build(execution_strategy); end
end
module SpecificationSchema
  # sord omit - no YARD type given for "execution_strategy", using T.untyped
  sig { params(execution_strategy: T.untyped).void }
  def self.build(execution_strategy); end
class CustomCollection
  # sord omit - no YARD type given for "storage", using T.untyped
  sig { params(storage: T.untyped).returns(CustomCollection) }
  def initialize(storage); end
  sig { void }
  def each(); end
end
module TestMiddleware
  # sord omit - no YARD type given for "parent_type", using T.untyped
  # sord omit - no YARD type given for "parent_object", using T.untyped
  # sord omit - no YARD type given for "field_definition", using T.untyped
  # sord omit - no YARD type given for "field_args", using T.untyped
  # sord omit - no YARD type given for "query_context", using T.untyped
  sig { params(parent_type: T.untyped, parent_object: T.untyped, field_definition: T.untyped, field_args: T.untyped, query_context: T.untyped, next_middleware: T.untyped).void }
  def self.call(parent_type, parent_object, field_definition, field_args, query_context, &next_middleware); end
end
end
end
module QueryParserSpecification
  # sord warn - unsupported generic type "Class" in "Class<Minitest::Test>"
  sig { params(block: T.untyped).returns(SORD_ERROR_Class) }
  def self.build_suite(&block); end
module QueryAssertions
  # sord omit - no YARD type given for "query", using T.untyped
  sig { params(query: T.untyped).void }
  def assert_valid_query(query); end
  # sord omit - no YARD type given for "fragment_def", using T.untyped
  sig { params(fragment_def: T.untyped).void }
  def assert_valid_fragment(fragment_def); end
  # sord omit - no YARD type given for "variable", using T.untyped
  sig { params(variable: T.untyped).void }
  def assert_valid_variable(variable); end
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(field: T.untyped).void }
  def assert_valid_field(field); end
  # sord omit - no YARD type given for "argument", using T.untyped
  sig { params(argument: T.untyped).void }
  def assert_valid_literal_argument(argument); end
  # sord omit - no YARD type given for "argument", using T.untyped
  sig { params(argument: T.untyped).void }
  def assert_valid_variable_argument(argument); end
  # sord omit - no YARD type given for "fragment_spread", using T.untyped
  sig { params(fragment_spread: T.untyped).void }
  def assert_valid_fragment_spread(fragment_spread); end
  # sord omit - no YARD type given for "directive", using T.untyped
  sig { params(directive: T.untyped).void }
  def assert_valid_directive(directive); end
  # sord omit - no YARD type given for "inline_fragment", using T.untyped
  sig { params(inline_fragment: T.untyped).void }
  def assert_valid_typed_inline_fragment(inline_fragment); end
  # sord omit - no YARD type given for "inline_fragment", using T.untyped
  sig { params(inline_fragment: T.untyped).void }
  def assert_valid_typeless_inline_fragment(inline_fragment); end
end
module ParseErrorSpecification
  # sord omit - no YARD type given for "query_string", using T.untyped
  sig { params(query_string: T.untyped).void }
  def assert_raises_parse_error(query_string); end
  sig { void }
  def test_it_includes_line_and_column(); end
  sig { void }
  def test_it_rejects_unterminated_strings(); end
  sig { void }
  def test_it_rejects_unexpected_ends(); end
  # sord omit - no YARD type given for "char", using T.untyped
  sig { params(char: T.untyped).void }
  def assert_rejects_character(char); end
  sig { void }
  def test_it_rejects_invalid_characters(); end
  sig { void }
  def test_it_rejects_bad_unicode(); end
  sig { void }
  def test_it_rejects_empty_inline_fragments(); end
  # sord omit - no YARD type given for "query_string", using T.untyped
  sig { params(query_string: T.untyped).void }
  def assert_empty_document(query_string); end
  sig { void }
  def test_it_parses_blank_queries(); end
  sig { void }
  def test_it_restricts_on(); end
end
end
module SchemaParserSpecification
  # sord warn - unsupported generic type "Class" in "Class<Minitest::Test>"
  sig { params(block: T.untyped).returns(SORD_ERROR_Class) }
  def self.build_suite(&block); end
end
module LazyExecutionSpecification
  # sord warn - "<#new, #execute>" does not appear to be a type
  # sord warn - unsupported generic type "Class" in "Class<Minitest::Test>"
  sig { params(execution_strategy: SORD_ERROR_newexecute).returns(SORD_ERROR_Class) }
  def self.build_suite(execution_strategy); end
module LazySchema
  # sord omit - no YARD type given for "execution_strategy", using T.untyped
  sig { params(execution_strategy: T.untyped).void }
  def self.build(execution_strategy); end
class LazyPush
  sig { void }
  def value(); end
  # sord omit - no YARD type given for "ctx", using T.untyped
  # sord omit - no YARD type given for "value", using T.untyped
  sig { params(ctx: T.untyped, value: T.untyped).returns(LazyPush) }
  def initialize(ctx, value); end
  sig { void }
  def push(); end
end
class LazyPushCollection
  # sord omit - no YARD type given for "ctx", using T.untyped
  # sord omit - no YARD type given for "values", using T.untyped
  sig { params(ctx: T.untyped, values: T.untyped).returns(LazyPushCollection) }
  def initialize(ctx, values); end
  sig { void }
  def push(); end
  sig { void }
  def value(); end
end
module LazyInstrumentation
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "field", using T.untyped
  sig { params(type: T.untyped, field: T.untyped).void }
  def self.instrument(type, field); end
end
end
end
end
end
module Graphql
module Generators
module Core
  # sord omit - no YARD type given for "base", using T.untyped
  sig { params(base: T.untyped).void }
  def self.included(base); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(type: T.untyped, name: T.untyped).void }
  def insert_root_type(type, name); end
  sig { void }
  def create_mutation_root_type(); end
  sig { void }
  def schema_file_path(); end
  # sord omit - no YARD type given for "dir", using T.untyped
  sig { params(dir: T.untyped).void }
  def create_dir(dir); end
  sig { void }
  def schema_name(); end
end
class EnumGenerator < Graphql::Generators::TypeGeneratorBase
  sig { void }
  def create_type_file(); end
  sig { void }
  def prepared_values(); end
  # sord omit - no YARD type given for "type_expression", using T.untyped
  # sord omit - no YARD type given for "mode:", using T.untyped
  # sord omit - no YARD type given for "null:", using T.untyped
  # sord warn - "(String, Boolean)" does not appear to be a type
  sig { params(type_expression: T.untyped, mode: T.untyped, null: T.untyped).returns(SORD_ERROR_StringBoolean) }
  def self.normalize_type_expression(type_expression, mode:, null: true); end
  sig { returns(String) }
  def type_ruby_name(); end
  sig { returns(String) }
  def type_graphql_name(); end
  sig { returns(String) }
  def type_file_name(); end
  sig { returns(T::Array[NormalizedField]) }
  def normalized_fields(); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(type: T.untyped, name: T.untyped).void }
  def insert_root_type(type, name); end
  sig { void }
  def create_mutation_root_type(); end
  sig { void }
  def schema_file_path(); end
  # sord omit - no YARD type given for "dir", using T.untyped
  sig { params(dir: T.untyped).void }
  def create_dir(dir); end
  sig { void }
  def schema_name(); end
end
class TypeGeneratorBase < Rails::Generators::Base
  extend Graphql::Generators::Core
  # sord omit - no YARD type given for "type_expression", using T.untyped
  # sord omit - no YARD type given for "mode:", using T.untyped
  # sord omit - no YARD type given for "null:", using T.untyped
  # sord warn - "(String, Boolean)" does not appear to be a type
  sig { params(type_expression: T.untyped, mode: T.untyped, null: T.untyped).returns(SORD_ERROR_StringBoolean) }
  def self.normalize_type_expression(type_expression, mode:, null: true); end
  sig { returns(String) }
  def type_ruby_name(); end
  sig { returns(String) }
  def type_graphql_name(); end
  sig { returns(String) }
  def type_file_name(); end
  sig { returns(T::Array[NormalizedField]) }
  def normalized_fields(); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(type: T.untyped, name: T.untyped).void }
  def insert_root_type(type, name); end
  sig { void }
  def create_mutation_root_type(); end
  sig { void }
  def schema_file_path(); end
  # sord omit - no YARD type given for "dir", using T.untyped
  sig { params(dir: T.untyped).void }
  def create_dir(dir); end
  sig { void }
  def schema_name(); end
class NormalizedField
  # sord omit - no YARD type given for "name", using T.untyped
  # sord omit - no YARD type given for "type_expr", using T.untyped
  # sord omit - no YARD type given for "null", using T.untyped
  sig { params(name: T.untyped, type_expr: T.untyped, null: T.untyped).returns(NormalizedField) }
  def initialize(name, type_expr, null); end
  sig { void }
  def to_ruby(); end
end
end
class UnionGenerator < Graphql::Generators::TypeGeneratorBase
  sig { void }
  def create_type_file(); end
  sig { void }
  def normalized_possible_types(); end
  # sord omit - no YARD type given for "type_expression", using T.untyped
  # sord omit - no YARD type given for "mode:", using T.untyped
  # sord omit - no YARD type given for "null:", using T.untyped
  # sord warn - "(String, Boolean)" does not appear to be a type
  sig { params(type_expression: T.untyped, mode: T.untyped, null: T.untyped).returns(SORD_ERROR_StringBoolean) }
  def self.normalize_type_expression(type_expression, mode:, null: true); end
  sig { returns(String) }
  def type_ruby_name(); end
  sig { returns(String) }
  def type_graphql_name(); end
  sig { returns(String) }
  def type_file_name(); end
  sig { returns(T::Array[NormalizedField]) }
  def normalized_fields(); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(type: T.untyped, name: T.untyped).void }
  def insert_root_type(type, name); end
  sig { void }
  def create_mutation_root_type(); end
  sig { void }
  def schema_file_path(); end
  # sord omit - no YARD type given for "dir", using T.untyped
  sig { params(dir: T.untyped).void }
  def create_dir(dir); end
  sig { void }
  def schema_name(); end
end
class LoaderGenerator < Rails::Generators::NamedBase
  extend Graphql::Generators::Core
  sig { void }
  def create_loader_file(); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(type: T.untyped, name: T.untyped).void }
  def insert_root_type(type, name); end
  sig { void }
  def create_mutation_root_type(); end
  sig { void }
  def schema_file_path(); end
  # sord omit - no YARD type given for "dir", using T.untyped
  sig { params(dir: T.untyped).void }
  def create_dir(dir); end
  sig { void }
  def schema_name(); end
end
class ObjectGenerator < Graphql::Generators::TypeGeneratorBase
  sig { void }
  def create_type_file(); end
  # sord omit - no YARD type given for "type_expression", using T.untyped
  # sord omit - no YARD type given for "mode:", using T.untyped
  # sord omit - no YARD type given for "null:", using T.untyped
  # sord warn - "(String, Boolean)" does not appear to be a type
  sig { params(type_expression: T.untyped, mode: T.untyped, null: T.untyped).returns(SORD_ERROR_StringBoolean) }
  def self.normalize_type_expression(type_expression, mode:, null: true); end
  sig { returns(String) }
  def type_ruby_name(); end
  sig { returns(String) }
  def type_graphql_name(); end
  sig { returns(String) }
  def type_file_name(); end
  sig { returns(T::Array[NormalizedField]) }
  def normalized_fields(); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(type: T.untyped, name: T.untyped).void }
  def insert_root_type(type, name); end
  sig { void }
  def create_mutation_root_type(); end
  sig { void }
  def schema_file_path(); end
  # sord omit - no YARD type given for "dir", using T.untyped
  sig { params(dir: T.untyped).void }
  def create_dir(dir); end
  sig { void }
  def schema_name(); end
end
class ScalarGenerator < Graphql::Generators::TypeGeneratorBase
  sig { void }
  def create_type_file(); end
  # sord omit - no YARD type given for "type_expression", using T.untyped
  # sord omit - no YARD type given for "mode:", using T.untyped
  # sord omit - no YARD type given for "null:", using T.untyped
  # sord warn - "(String, Boolean)" does not appear to be a type
  sig { params(type_expression: T.untyped, mode: T.untyped, null: T.untyped).returns(SORD_ERROR_StringBoolean) }
  def self.normalize_type_expression(type_expression, mode:, null: true); end
  sig { returns(String) }
  def type_ruby_name(); end
  sig { returns(String) }
  def type_graphql_name(); end
  sig { returns(String) }
  def type_file_name(); end
  sig { returns(T::Array[NormalizedField]) }
  def normalized_fields(); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(type: T.untyped, name: T.untyped).void }
  def insert_root_type(type, name); end
  sig { void }
  def create_mutation_root_type(); end
  sig { void }
  def schema_file_path(); end
  # sord omit - no YARD type given for "dir", using T.untyped
  sig { params(dir: T.untyped).void }
  def create_dir(dir); end
  sig { void }
  def schema_name(); end
end
class InstallGenerator < Rails::Generators::Base
  extend Graphql::Generators::Core
  sig { void }
  def create_folder_structure(); end
  sig { returns(T::Boolean) }
  def gemfile_modified?(); end
  # sord omit - no YARD type given for "args", using T.untyped
  sig { params(args: T.untyped).void }
  def gem(*args); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(type: T.untyped, name: T.untyped).void }
  def insert_root_type(type, name); end
  sig { void }
  def create_mutation_root_type(); end
  sig { void }
  def schema_file_path(); end
  # sord omit - no YARD type given for "dir", using T.untyped
  sig { params(dir: T.untyped).void }
  def create_dir(dir); end
  sig { void }
  def schema_name(); end
end
class MutationGenerator < Rails::Generators::Base
  extend Graphql::Generators::Core
  # sord omit - no YARD type given for "args", using T.untyped
  # sord omit - no YARD type given for "options", using T.untyped
  sig { params(args: T.untyped, options: T.untyped).returns(MutationGenerator) }
  def initialize(args, *options); end
  sig { void }
  def file_name(); end
  sig { void }
  def mutation_name(); end
  sig { void }
  def field_name(); end
  sig { void }
  def create_mutation_file(); end
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(name: T.untyped).void }
  def assign_names!(name); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(type: T.untyped, name: T.untyped).void }
  def insert_root_type(type, name); end
  sig { void }
  def create_mutation_root_type(); end
  sig { void }
  def schema_file_path(); end
  # sord omit - no YARD type given for "dir", using T.untyped
  sig { params(dir: T.untyped).void }
  def create_dir(dir); end
  sig { void }
  def schema_name(); end
end
class InterfaceGenerator < Graphql::Generators::TypeGeneratorBase
  sig { void }
  def create_type_file(); end
  # sord omit - no YARD type given for "type_expression", using T.untyped
  # sord omit - no YARD type given for "mode:", using T.untyped
  # sord omit - no YARD type given for "null:", using T.untyped
  # sord warn - "(String, Boolean)" does not appear to be a type
  sig { params(type_expression: T.untyped, mode: T.untyped, null: T.untyped).returns(SORD_ERROR_StringBoolean) }
  def self.normalize_type_expression(type_expression, mode:, null: true); end
  sig { returns(String) }
  def type_ruby_name(); end
  sig { returns(String) }
  def type_graphql_name(); end
  sig { returns(String) }
  def type_file_name(); end
  sig { returns(T::Array[NormalizedField]) }
  def normalized_fields(); end
  # sord omit - no YARD type given for "type", using T.untyped
  # sord omit - no YARD type given for "name", using T.untyped
  sig { params(type: T.untyped, name: T.untyped).void }
  def insert_root_type(type, name); end
  sig { void }
  def create_mutation_root_type(); end
  sig { void }
  def schema_file_path(); end
  # sord omit - no YARD type given for "dir", using T.untyped
  sig { params(dir: T.untyped).void }
  def create_dir(dir); end
  sig { void }
  def schema_name(); end
end
end
end
module Base64Bp
  include Base64
  # sord omit - no YARD type given for "bin", using T.untyped
  # sord omit - no YARD type given for "padding:", using T.untyped
  sig { params(bin: T.untyped, padding: T.untyped).void }
  def urlsafe_encode64(bin, padding:); end
  # sord omit - no YARD type given for "bin", using T.untyped
  # sord omit - no YARD type given for "padding:", using T.untyped
  sig { params(bin: T.untyped, padding: T.untyped).void }
  def self.urlsafe_encode64(bin, padding:); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def urlsafe_decode64(str); end
  # sord omit - no YARD type given for "str", using T.untyped
  sig { params(str: T.untyped).void }
  def self.urlsafe_decode64(str); end
end