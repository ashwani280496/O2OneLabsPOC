/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct User : Codable {
	let id : Int?
	let username : String?
	let fullname : String?
	let avatar_version : Int?
	let registration_date : String?
	let avatars : Avatars?
	let userpic_url : String?
	let userpic_https_url : String?
	let usertype : Int?
	let active : Int?
	let firstname : String?
	let lastname : String?
	let about : String?
	let city : String?
	let state : String?
	let country : String?
	let cover_url : String?
	let upgrade_status : Int?
	let affection : Int?
	let followers_count : Int?
	let following : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case username = "username"
		case fullname = "fullname"
		case avatar_version = "avatar_version"
		case registration_date = "registration_date"
		case avatars = "avatars"
		case userpic_url = "userpic_url"
		case userpic_https_url = "userpic_https_url"
		case usertype = "usertype"
		case active = "active"
		case firstname = "firstname"
		case lastname = "lastname"
		case about = "about"
		case city = "city"
		case state = "state"
		case country = "country"
		case cover_url = "cover_url"
		case upgrade_status = "upgrade_status"
		case affection = "affection"
		case followers_count = "followers_count"
		case following = "following"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		fullname = try values.decodeIfPresent(String.self, forKey: .fullname)
		avatar_version = try values.decodeIfPresent(Int.self, forKey: .avatar_version)
		registration_date = try values.decodeIfPresent(String.self, forKey: .registration_date)
		avatars = try values.decodeIfPresent(Avatars.self, forKey: .avatars)
		userpic_url = try values.decodeIfPresent(String.self, forKey: .userpic_url)
		userpic_https_url = try values.decodeIfPresent(String.self, forKey: .userpic_https_url)
		usertype = try values.decodeIfPresent(Int.self, forKey: .usertype)
		active = try values.decodeIfPresent(Int.self, forKey: .active)
		firstname = try values.decodeIfPresent(String.self, forKey: .firstname)
		lastname = try values.decodeIfPresent(String.self, forKey: .lastname)
		about = try values.decodeIfPresent(String.self, forKey: .about)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		cover_url = try values.decodeIfPresent(String.self, forKey: .cover_url)
		upgrade_status = try values.decodeIfPresent(Int.self, forKey: .upgrade_status)
		affection = try values.decodeIfPresent(Int.self, forKey: .affection)
		followers_count = try values.decodeIfPresent(Int.self, forKey: .followers_count)
		following = try values.decodeIfPresent(Bool.self, forKey: .following)
	}

}