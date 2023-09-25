# frozen_string_literal: true

require 'rails_helper'
require 'rack/test'

RSpec.describe '/posts API' do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def committee_options
    @committee_options ||= {
      schema: Committee::Drivers::load_from_file('schemas/posts.json'),
      prefix: '',
      validate_success_only: true,
      params_key: 'action_dispatch.request.request_parameters',
      strict_reference_validation: true,
      strict: true
    }
  end

  def request_object
    last_request
  end

  def response_data
    [last_response.status, last_response.headers, last_response.body]
  end

  def app
    Rails.application
  end

  describe "GET /posts" do
    it "(Committee) conforms to response schema with 200 response code" do
      get "posts"

      assert_schema_conform
      assert_response_schema_confirm(200)
      assert_schema_conform(200)
      assert_request_schema_confirm
    end

    it "(OpenAPIParser) conforms to response schema with 200 response code" do
      root = OpenAPIParser.parse(YAML.load_file('schemas/posts.json'))
      request_operation = root.request_operation(:get, '/posts')
      request_operation.validate_response_body(OpenAPIParser::RequestOperation::ValidatableResponseBody.new(200, { idd: 1 }, {}), OpenAPIParser::SchemaValidator::ResponseValidateOptions.new(strict: false, validate_header: false))
    end
  end
end
