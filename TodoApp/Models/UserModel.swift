//
//  UserModel.swift
//  TodoApp
//
//  Created by Devansh Mohata on 09/07/24.
//

import Foundation

struct User: Codable {
	let id: String
	let name: String
	let email: String
	let createdAt: TimeInterval
	
	enum CodingKeys: String, CodingKey {
		case id,
			 name,
			 email,
			 createdAt = "created_at"
	}
}
