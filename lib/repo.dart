class Repo {
  final String htmlUrl;
  final String title;
  final String woeid;

  Repo(this.htmlUrl, this.title, this.woeid);

  static List<Repo> mapJSONStringToList(List<dynamic> jsonList) {
    return jsonList
        .map((r) => Repo(r['url'], r['title'], r['woeid']))
        .toList();
  }
}