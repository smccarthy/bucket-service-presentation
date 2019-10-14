require 'faraday'
require 'json'
require 'uri'

bucket_service_url = 'http://localhost:8080'
project = 'barracuda'

conn = Faraday.new bucket_service_url

## 1st API request - Creates a project in the bucket service
project_data = {
  name: project,
  description: 'Example Project Barracuda'
}
r = conn.post 'projects', project_data

## 2nd API request - Adds a test to the project in the bucket service
test_data = {
  bucket: '[dt_chrome_regression]',
  name: 'Example Chrome Test',
  uuid: 'test-chrome'
}
r = conn.post "projects/#{project}/tests", test_data

test_data = {
  bucket: '[dt_firefox_regression]',
  name: 'Example Firefox Test',
  uuid: 'test-firefox'
}
r = conn.post "projects/#{project}/tests", test_data

## 3rd API request - Retrieves all tests in the specified bucket
r = conn.get "projects/#{project}/tests/"
puts JSON.pretty_generate(JSON.parse(r.body))

# ruby bucket-service-example.rb