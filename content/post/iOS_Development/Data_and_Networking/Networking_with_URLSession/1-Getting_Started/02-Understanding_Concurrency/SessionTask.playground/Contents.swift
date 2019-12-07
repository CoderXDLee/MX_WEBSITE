import UIKit
import PlaygroundSupport

var str = "Hello, playground"

let configuration = URLSessionConfiguration.ephemeral
configuration.waitsForConnectivity = true
let session = URLSession(configuration: configuration)

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
let task = session.dataTask(with: url) {
    (data, response, error) in
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        print(response)
        return
    }
    guard let data = data else {
        print(error.debugDescription)
        return
    }
    
    if let result = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
        print(result)
    }
    
    PlaygroundPage.current.finishExecution()
}
task.resume()

