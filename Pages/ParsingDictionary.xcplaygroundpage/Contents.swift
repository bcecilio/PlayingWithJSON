import Foundation

let json = """
{
    "results": [
    {
        "firstName": "John",
        "lastName": "Appleseed"
        },
    {
        "firstName": "Alex",
        "lastName": "Paul"
        }
    ]
}
""".data(using: .utf8)!

// Codable -> Encodable + Decodable
// Decodable: converts json to data
// Encodable: converts json to data to POST to web API

struct ResultWrapper: Codable {
    let results: [Contact]
}

struct Contact: Codable {
    let firstName: String
    let lastName: String
}

do {
    let dictionay = try JSONDecoder().decode(ResultWrapper.self, from: json)
    let contacts = dictionay.results // array of contacts
    dump(contacts)
} catch {
    print("decoding error: \(error)")
}

/*
 ▿ 2 elements
 ▿ __lldb_expr_1.Contact
   - firstName: "John"
   - lastName: "Appleseed"
 ▿ __lldb_expr_1.Contact
   - firstName: "Alex"
   - lastName: "Paul"
 */
