struct Person {
    let firstName: String
    let restName: String?
    var lastName: String {
        return String((restName ?? "").split(separator: " ").last ?? String.SubSequence())
    }
}
