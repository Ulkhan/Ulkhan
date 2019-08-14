//
//  NetworkServices+MultiPartExt.swift
//  Ulkhan
//
//  Created by Ulxan Emiraslanov on 8/9/19.
//  Copyright © 2019 Ulxan Emiraslanov. All rights reserved.
//

import Foundation

extension NetworkServices: URLSessionTaskDelegate, URLSessionDelegate, URLSessionDataDelegate {
    
    /**
     
     - returns: URLRequest
     */
    
    
    open func multiPartRequest(_ url: URL, params: [String: String]? = nil, media: [Media], queryParams: [String: String]? = nil, headers: [String: String]?, method: HttpMethod = .post) -> URLRequest {
        
        let boundary = "Boundary-\(UUID().uuidString)"
        
        var urlComponent = URLComponents(string: url.absoluteString)
        
        
        if let params = queryParams {
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
        
        req.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let body = createDataBody(withParameters: params, media, boundary)
         req.httpBody = body
            
        
        if let headers = headers {
            req.allHTTPHeaderFields = headers
        }
        return req
    }
    
    func createDataBody(withParameters params: [String: String]?,_ media: [Media]?,_ boundary: String) -> Data {
        
        let lineBreak = "\r\n"
        var body = Data()
        
        
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value + lineBreak)")
            }
        }
        
        if let media = media {
            for item in media {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(item.name)\"; filename=\"\(item.fileName)\"\(lineBreak)")
                body.append("Content-Type: \(item.mimeType + lineBreak + lineBreak)")
                body.append(item.data)
                body.append(lineBreak)
            }
        }
        
        body.append("--\(boundary)--\(lineBreak)")
        
        return body
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        uploadProgress = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
    }
    
    public func decoderMultipart<T: Decodable>(_ request: URLRequest, decodableType: T.Type, completion: @escaping (Result<(T), Error>)->Void, uploadProgress: @escaping (Float?)->Void) {
        let session = URLSession(configuration: .background(withIdentifier: "com.Ulkhan/Upload"), delegate: self, delegateQueue: OperationQueue.main)
        
        
        //TODO: - uplooadProgress Crashes 
           uploadProgress(self.uploadProgress)
        
        
        let task = session.uploadTask(with: request, from: nil) { (data, res, err) in
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
    
}



extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
