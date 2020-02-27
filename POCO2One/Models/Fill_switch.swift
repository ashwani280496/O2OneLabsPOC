/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Fill_switch : Codable {
	let access_deleted : Bool?
	let access_private : Bool?
	let include_deleted : Bool?
	let exclude_private : Bool?
	let exclude_nude : Bool?
	let always_exclude_nude : Bool?
	let exclude_block : Bool?
	let current_user_id : String?
	let only_user_active : Bool?
	let include_tags : Bool?
	let include_geo : Bool?
	let include_licensing : Bool?
	let include_admin_locks : Bool?
	let include_like_by : Bool?
	let include_comments : Bool?
	let include_user_info : Bool?
	let include_follow_info : Bool?
	let include_equipment_info : Bool?

	enum CodingKeys: String, CodingKey {

		case access_deleted = "access_deleted"
		case access_private = "access_private"
		case include_deleted = "include_deleted"
		case exclude_private = "exclude_private"
		case exclude_nude = "exclude_nude"
		case always_exclude_nude = "always_exclude_nude"
		case exclude_block = "exclude_block"
		case current_user_id = "current_user_id"
		case only_user_active = "only_user_active"
		case include_tags = "include_tags"
		case include_geo = "include_geo"
		case include_licensing = "include_licensing"
		case include_admin_locks = "include_admin_locks"
		case include_like_by = "include_like_by"
		case include_comments = "include_comments"
		case include_user_info = "include_user_info"
		case include_follow_info = "include_follow_info"
		case include_equipment_info = "include_equipment_info"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		access_deleted = try values.decodeIfPresent(Bool.self, forKey: .access_deleted)
		access_private = try values.decodeIfPresent(Bool.self, forKey: .access_private)
		include_deleted = try values.decodeIfPresent(Bool.self, forKey: .include_deleted)
		exclude_private = try values.decodeIfPresent(Bool.self, forKey: .exclude_private)
		exclude_nude = try values.decodeIfPresent(Bool.self, forKey: .exclude_nude)
		always_exclude_nude = try values.decodeIfPresent(Bool.self, forKey: .always_exclude_nude)
		exclude_block = try values.decodeIfPresent(Bool.self, forKey: .exclude_block)
		current_user_id = try values.decodeIfPresent(String.self, forKey: .current_user_id)
		only_user_active = try values.decodeIfPresent(Bool.self, forKey: .only_user_active)
		include_tags = try values.decodeIfPresent(Bool.self, forKey: .include_tags)
		include_geo = try values.decodeIfPresent(Bool.self, forKey: .include_geo)
		include_licensing = try values.decodeIfPresent(Bool.self, forKey: .include_licensing)
		include_admin_locks = try values.decodeIfPresent(Bool.self, forKey: .include_admin_locks)
		include_like_by = try values.decodeIfPresent(Bool.self, forKey: .include_like_by)
		include_comments = try values.decodeIfPresent(Bool.self, forKey: .include_comments)
		include_user_info = try values.decodeIfPresent(Bool.self, forKey: .include_user_info)
		include_follow_info = try values.decodeIfPresent(Bool.self, forKey: .include_follow_info)
		include_equipment_info = try values.decodeIfPresent(Bool.self, forKey: .include_equipment_info)
	}

}