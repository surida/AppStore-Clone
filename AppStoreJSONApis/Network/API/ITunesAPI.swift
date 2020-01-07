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
//https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json
//https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json
//https://api.letsbuildthatapp.com/appstore/social

enum ITunesAPI {
    case search(term: String, entity: String)
    case fetchGames
    case fetchTopgrossing
    case fetchTopFree
    case fetchSocialApps
}

extension ITunesAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .search:
            return URL(string: "https://itunes.apple.com")!
        case .fetchGames, .fetchTopgrossing, .fetchTopFree:
            return URL(string: "https://rss.itunes.apple.com")!
        case .fetchSocialApps:
            return URL(string: "https://api.letsbuildthatapp.com")!
        }
        
    }
    
    var path: String {
        switch self {
        case .search:
            return "search"
        case .fetchGames:
            return "api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
        case .fetchTopgrossing:
            return "api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
        case .fetchTopFree:
            return "api/v1/us/ios-apps/top-free/all/25/explicit.json"
        case .fetchSocialApps:
            return "appstore/social"
        }
    }
    
    var method: Method {
        switch self {
        case .search:
            return .get
        case .fetchGames, .fetchTopgrossing, .fetchTopFree, .fetchSocialApps:
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
        case .fetchGames, .fetchTopgrossing, .fetchTopFree, .fetchSocialApps:
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

