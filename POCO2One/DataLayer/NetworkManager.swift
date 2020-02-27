//
//  NetworkManager.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 27/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//
import Foundation
class NetworkManager: NSObject {

 
 enum URLError : Error {
     case URLISNIL
     case URLBadScheme
 }
 
 struct NetworkError : Error {
     var errorCode : String
     var errorType : String
 }

 static var shared = NetworkManager()
 private override init() {
     super.init()
     
 }
 
 private lazy var queue : OperationQueue = {
     let queue = OperationQueue()
     queue.maxConcurrentOperationCount = 4
     return queue
 }()
 
 private lazy var session : URLSession = {
     let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: self.queue)
     return  session
 }()
 
    func getData(url : URL , parameters:[String:AnyObject],completionHandler:@escaping(Data? , Error?)->Void) -> URLSessionTask
 {
    var components = URLComponents(string: url.absoluteString)!
    components.queryItems = parameters.map { (arg) -> URLQueryItem in
        let (key, value) = arg
        return URLQueryItem(name: key, value: (value as! String))
    }
    var request = URLRequest(url: components.url!)
     request.httpMethod = "GET"
     request.setValue("2", forHTTPHeaderField: "X-DEVICE-TYPE")

     let sessionTask = self.session.dataTask(with: request) { (data, response, error) in
         if (data != nil)
         {
             let backToString = String(data: data!, encoding: String.Encoding.utf8) as String?
             print(backToString ?? "")
         }
         completionHandler(data,error)
     }
     sessionTask.resume()
     return sessionTask
     
 }
}


protocol BaseRequestDTO {
    func createGetRequestUrl(url:String)-> URL?
}

protocol BaseResponseDTO {
    
}

class BaseRequestUseCase <S : BaseRequestDTO ,T : BaseResponseDTO > {
    
    func initialize(requestDTO : S)  {
        fatalError("This is an Abstract Base class, Method should be override")
        
    }
    func getDataFromServerUsingGet(url : URL,parameters:[String:AnyObject], requestDto:S, completionHandler:@escaping(T? , Error?) -> Void) -> URLSessionTask{
        
        return NetworkManager.shared.getData(url:url, parameters: parameters) { (data, error) in
            if let error = error  {
                DispatchQueue.main.async {
                    completionHandler(nil , error)
                }
            }else{
                guard let unwrappedData = data else {
                    DispatchQueue.main.async {
                        completionHandler(nil,nil);
                    }
                    return
                }
                do {
                    let response = try self.decode(data: unwrappedData)
                    DispatchQueue.main.async {
                        completionHandler(response,nil)
                    }
                }
                catch {
                    DispatchQueue.main.async {
                        completionHandler(nil,error)
                    }
                }
            }
        }
    }
    
    func decode(data : Data)throws -> T {
        fatalError("This is an Abstract Base class, Method should be override")
    }
}
