import Foundation

enum MovieCategories: String{
    case popular = "popular"
    case topRated = "top_rated"
    case upcoming = "upcoming"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func requestForApi(category: MovieCategories, completionHandler: ((Any) -> ())?) {
        var request = URLRequest(url: URL(string: kBaseUrl + category.rawValue + apiKey)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, err in
            if let err = err {
                print("Some error occured")
                return
            }
            guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else {
                print("Getting some error in json serialisation")
                return
                }
            completionHandler?(jsonData)
        }.resume()
    }
}

let apiKey = "?api_key=314778b919b218a848acfcee10a6c785"
let kBaseUrl = "https://api.themoviedb.org/3/movie/"
