import Foundation
import Alamofire

class APIServices {
    private init() {}
    static let instance = APIServices()
    func getData<T: Codable>(url: String, method: HTTPMethod ,params: Parameters? ,headers: HTTPHeaders? ,completion: @escaping (T?, Error?)->()) {
        
        AF.request(url, method: method, parameters: params, headers: headers)
            .responseJSON { (response) in
                print(response)
                switch response.result {
                case .success(_):
                    guard let data = response.data else { return }
                    do {
                        let jsonData = try JSONDecoder().decode(T.self, from: data)
                        completion(jsonData, nil)
                    } catch let jsonError {
                        print(jsonError)
                    }
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
}
