//
//  ITunesSocialAppList.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2020/01/08.
//  Copyright © 2020 Brian Voong. All rights reserved.
//

import Foundation

typealias ITunesSocialAppList = [ITunesSocialApp]

struct ITunesSocialApp: Codable {
    let id, name: String
    let imageURL: String
    let tagline: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
        case tagline
    }
}

