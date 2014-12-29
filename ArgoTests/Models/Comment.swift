struct Comment {
  let id: Int
  let text: String
  let authorName: String
}

import Argo

extension Comment: JSONDecodable {
  static func create(id: Int)(text: String)(authorName: String) -> Comment {
    return Comment(id: id, text: text, authorName: authorName)
  }

  static var decoder: JSONValue -> Comment? {
    return { j in Comment.create
      <^> j <| "id"
      <*> j <| "text"
      <*> j <| ["author", "name"]
    }
  }
}
