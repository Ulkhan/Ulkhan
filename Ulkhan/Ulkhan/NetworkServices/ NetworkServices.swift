//
//   NetworkServices.swift
//  Ulkhan
//
//  Created by Ulxan Emiraslanov on 8/5/19.
//  Copyright © 2019 Ulxan Emiraslanov. All rights reserved.
//

import Foundation


open class NetworkServices: NSObject {
    
    public static let shared = NetworkServices()
    private override init() {}
    
    public var uploadProgress: Float? = nil
    
    open func request(_ url: URL, params: [String: String]? = nil, body: [String: Any]?, headers: [String: String]?, method: HttpMethod) -> URLRequest {
        var urlComponent = URLComponents(string: url.absoluteString)
        
        
        if let params = params {
            var query = [URLQueryItem(name: "", value: nil)]
            params.forEach { (key, val) in
                let item = URLQueryItem(name: key, value: val)
                query.append(item)
            }
            print(query)
            urlComponent?.queryItems = query
        }
        var req = URLRequest(url: urlComponent!.url!)
        req.httpMethod = method.rawValue
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = body {
            do {
                req.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            } catch let err {
                print(err.localizedDescription)
            }
        }
        
        if let headers = headers {
            req.allHTTPHeaderFields = headers
        }
        return req
    }
    
    
    open func decoder<T: Decodable>(_ request: URLRequest, decodableType: T.Type, completion: @escaping (Result<(T), Error>)->Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, res, err) in
            print(res!.value(forKey: "statusCode") as Any)
            guard let data = data else { return }
            do {
                let jsonResult = try JSONDecoder().decode(decodableType.self, from: data)
                completion(.success(jsonResult))
            } catch (let error) {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
     public enum HttpMethod: String {
        case post = "POST"
        case get = "GET"
        case delete = "DELETE"
        case put = "PUT"
    }
    
    
    enum NetError: Int, Error {
        case badUrl = 500
    }
    
    
    
}



