class NetworkSource {
  Uri baseUri(String path) {
    return Uri.parse('https://jsonplaceholder.typicode.com/$path');
  }
}
