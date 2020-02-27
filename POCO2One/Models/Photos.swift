/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Photos : Codable {
	let id : Int?
	let created_at : String?
	let privacy : Bool?
	let profile : Bool?
	let url : String?
	let user_id : Int?
	let status : Int?
	let width : Int?
	let height : Int?
	let rating : Double?
	let highest_rating : Double?
	let highest_rating_date : String?
	let image_format : String?
	let images : [Images]?
	let image_url : [String]?
	let name : String?
	let description : String?
	let category : Int?
	let taken_at : String?
	let shutter_speed : String?
	let focal_length : String?
	let aperture : String?
	let camera : String?
	let lens : String?
	let iso : String?
	let location : String?
	let latitude : Double?
	let longitude : Double?
	let nsfw : Bool?
	let privacy_level : Int?
	let watermark : Bool?
	let has_nsfw_tags : Bool?
	let liked : String?
	let voted : String?
	let comments_count : Int?
	let votes_count : Int?
	let positive_votes_count : Int?
	let times_viewed : Int?
	let user : User?
	let editors_choice : Bool?
	let editors_choice_date : String?
	let editored_by : String?
	let feature : String?
	let feature_date : String?
	let fill_switch : Fill_switch?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case created_at = "created_at"
		case privacy = "privacy"
		case profile = "profile"
		case url = "url"
		case user_id = "user_id"
		case status = "status"
		case width = "width"
		case height = "height"
		case rating = "rating"
		case highest_rating = "highest_rating"
		case highest_rating_date = "highest_rating_date"
		case image_format = "image_format"
		case images = "images"
		case image_url = "image_url"
		case name = "name"
		case description = "description"
		case category = "category"
		case taken_at = "taken_at"
		case shutter_speed = "shutter_speed"
		case focal_length = "focal_length"
		case aperture = "aperture"
		case camera = "camera"
		case lens = "lens"
		case iso = "iso"
		case location = "location"
		case latitude = "latitude"
		case longitude = "longitude"
		case nsfw = "nsfw"
		case privacy_level = "privacy_level"
		case watermark = "watermark"
		case has_nsfw_tags = "has_nsfw_tags"
		case liked = "liked"
		case voted = "voted"
		case comments_count = "comments_count"
		case votes_count = "votes_count"
		case positive_votes_count = "positive_votes_count"
		case times_viewed = "times_viewed"
		case user = "user"
		case editors_choice = "editors_choice"
		case editors_choice_date = "editors_choice_date"
		case editored_by = "editored_by"
		case feature = "feature"
		case feature_date = "feature_date"
		case fill_switch = "fill_switch"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		privacy = try values.decodeIfPresent(Bool.self, forKey: .privacy)
		profile = try values.decodeIfPresent(Bool.self, forKey: .profile)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		rating = try values.decodeIfPresent(Double.self, forKey: .rating)
		highest_rating = try values.decodeIfPresent(Double.self, forKey: .highest_rating)
		highest_rating_date = try values.decodeIfPresent(String.self, forKey: .highest_rating_date)
		image_format = try values.decodeIfPresent(String.self, forKey: .image_format)
		images = try values.decodeIfPresent([Images].self, forKey: .images)
		image_url = try values.decodeIfPresent([String].self, forKey: .image_url)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		category = try values.decodeIfPresent(Int.self, forKey: .category)
		taken_at = try values.decodeIfPresent(String.self, forKey: .taken_at)
		shutter_speed = try values.decodeIfPresent(String.self, forKey: .shutter_speed)
		focal_length = try values.decodeIfPresent(String.self, forKey: .focal_length)
		aperture = try values.decodeIfPresent(String.self, forKey: .aperture)
		camera = try values.decodeIfPresent(String.self, forKey: .camera)
		lens = try values.decodeIfPresent(String.self, forKey: .lens)
		iso = try values.decodeIfPresent(String.self, forKey: .iso)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
		nsfw = try values.decodeIfPresent(Bool.self, forKey: .nsfw)
		privacy_level = try values.decodeIfPresent(Int.self, forKey: .privacy_level)
		watermark = try values.decodeIfPresent(Bool.self, forKey: .watermark)
		has_nsfw_tags = try values.decodeIfPresent(Bool.self, forKey: .has_nsfw_tags)
		liked = try values.decodeIfPresent(String.self, forKey: .liked)
		voted = try values.decodeIfPresent(String.self, forKey: .voted)
		comments_count = try values.decodeIfPresent(Int.self, forKey: .comments_count)
		votes_count = try values.decodeIfPresent(Int.self, forKey: .votes_count)
		positive_votes_count = try values.decodeIfPresent(Int.self, forKey: .positive_votes_count)
		times_viewed = try values.decodeIfPresent(Int.self, forKey: .times_viewed)
		user = try values.decodeIfPresent(User.self, forKey: .user)
		editors_choice = try values.decodeIfPresent(Bool.self, forKey: .editors_choice)
		editors_choice_date = try values.decodeIfPresent(String.self, forKey: .editors_choice_date)
		editored_by = try values.decodeIfPresent(String.self, forKey: .editored_by)
		feature = try values.decodeIfPresent(String.self, forKey: .feature)
		feature_date = try values.decodeIfPresent(String.self, forKey: .feature_date)
		fill_switch = try values.decodeIfPresent(Fill_switch.self, forKey: .fill_switch)
	}

}