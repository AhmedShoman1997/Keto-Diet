//
//  ImageSlider.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/25/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import Foundation


// MARK: - SliderImage
struct SliderImage: Codable {
    let status: Int
    let message: String
    let code: Int
    let data: [Datum]
    let errors: JSONNull?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case code = "Code"
        case data = "Data"
        case errors = "Errors"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let mealID: Int
    let mealName: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case mealID = "meal_id"
        case mealName = "meal_name"
        case image
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
