//
//  Codable+Extension.swift
//  TodoApp
//
//  Created by Devansh Mohata on 09/07/24.
//

import Foundation

extension Encodable {
	func asDictionary() -> [String: Any] {
		var dict: [String: Any] = [:]
		
		do {
			let data = try JSONEncoder().encode(self)
			dict = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] ?? [:]
		} catch {
			print("Cannot convert the Encodable")
		}
		
		return dict
	}
}
