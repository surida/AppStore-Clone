//
//  ItunesAPI.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2019/12/24.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import Moya

//https://itunes.apple.com/search?term=instagram&entity=software
//https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json

enum ITunesAPI {
    case search(term: String, entity: String)
    case fetchGames
}

extension ITunesAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .search:
            return URL(string: "https://itunes.apple.com")!
        case .fetchGames:
            return URL(string: "https://rss.itunes.apple.com")!
        }
        
    }
    
    var path: String {
        switch self {
        case .search:
            return "search"
        case .fetchGames:
            return "api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
        }
    }
    
    var method: Method {
        switch self {
        case .search:
            return .get
        case .fetchGames:
            return .get
        }
    }
    
    var sampleData: Data {
        return "sample".data(using: .utf8)!
    }
    
    var task: Task {
        var parameters: [String: Any]?
        let parameterEncoding: Moya.ParameterEncoding

        switch self {
        case .search(let term, let entity):
            parameters = ["term": term, "entity": entity]
            parameterEncoding = URLEncoding.default
        case .fetchGames:
            parameters = nil
            parameterEncoding = URLEncoding.default
        }
        
        return Task.requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        var result: [String : String]
        result = ["Content-Type": "application/json"]
        return result
    }
    
}

