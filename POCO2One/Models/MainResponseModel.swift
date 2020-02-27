//
//  MainResponseModel.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 27/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//
import Foundation
struct PhotosResponseDTO : BaseResponseDTO, Codable {
    let current_page : Int?
    let total_pages : Int?
    let total_items : Int?
    let feature : String?
    let photos : [Photos]?

    enum CodingKeys: String, CodingKey {

        case current_page = "current_page"
        case total_pages = "total_pages"
        case total_items = "total_items"
        case feature = "feature"
        case photos = "photos"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        current_page = try values.decodeIfPresent(Int.self, forKey: .current_page)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
        total_items = try values.decodeIfPresent(Int.self, forKey: .total_items)
        feature = try values.decodeIfPresent(String.self, forKey: .feature)
        photos = try values.decodeIfPresent([Photos].self, forKey: .photos)
    }

}

