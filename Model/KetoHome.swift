//
//  KetoHome.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/28/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import Foundation

// MARK: - KetoHome
struct KetoHome: Codable {
    let status: Int
    let message: String
    let code: Int
    let data: [Datumm]
    let errors: JSONNuil?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case code = "Code"
        case data = "Data"
        case errors = "Errors"
    }
}

// MARK: - Datum
struct Datumm: Codable {
    let id: Int
    let title, type: String
    let image: String
}

// MARK: - Encode/decode helpers

class JSONNuil: Codable, Hashable {

    public static func == (lhs: JSONNuil, rhs: JSONNuil) -> Bool {
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
