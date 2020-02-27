//
//  MainVM.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 27/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//

import Foundation
class MainVM {
    private var requestUseCase :GetPhotosRequest?
      
      func getPopularPhotos(completionHandler :@escaping (PhotosResponseDTO?)->Void,useCase : GetPhotosRequest = GetPhotosRequest()) {
          
        let requestDTO = PhotosRequestDTO()
          requestUseCase = useCase
          requestUseCase?.initialize(requestDTO: requestDTO, completionHandler: { (responseDTO, error) in
              if(error != nil)
              {
                  completionHandler(nil)
              }
              else
              {
                  completionHandler(responseDTO)
              }
          })
      }
}
