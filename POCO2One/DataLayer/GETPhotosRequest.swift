//
//  GETPhotosRequest.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 27/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//

import Foundation
struct PhotosRequestDTO : BaseRequestDTO {
    func createGetRequestUrl(url:String)-> URL?{
        //TODO : create
        return URL(string: url + Constants.endPoint)
    }
    func createParamsDictionary() -> [String:AnyObject]?  {
        var parameter : [String:AnyObject] = [String:AnyObject]()
        parameter["feature"] = "popular" as AnyObject
        return parameter
    }
}

class GetPhotosRequest: BaseRequestUseCase<PhotosRequestDTO,PhotosResponseDTO > {
    var sessionTask : URLSessionTask?
    
    func initialize(requestDTO : PhotosRequestDTO,completionHandler:@escaping(PhotosResponseDTO?,Error?)->Void) {
        let baseUrl = Constants.baseUrl
        let url = requestDTO.createGetRequestUrl(url: baseUrl)
        sessionTask?.cancel()
        if let params = requestDTO.createParamsDictionary()
        {
            sessionTask = super.getDataFromServerUsingGet(url: url!, parameters: params, requestDto: requestDTO, completionHandler: completionHandler)
        }
        else
        {
            let error = NSError(domain:"", code:401, userInfo:[ NSLocalizedDescriptionKey: "Invaild params"])
            completionHandler(nil,error)
        }
    }
    override func decode(data: Data) throws -> PhotosResponseDTO {
        let decoder = JSONDecoder()
        return try decoder.decode(PhotosResponseDTO.self, from: data)
    }
}
