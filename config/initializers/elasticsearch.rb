Elasticsearch::Model.client = Elasticsearch::Client.new(
  url: 'http://localhost:9200',  
  transport_options: {
    headers: {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  },
  request: {
    timeout: 5,
    open_timeout: 2
  },
  log: true
)

