//
//  ItunesAPI.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2019/12/24.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import Moya

//https://itunes.apple.com/search?term=instagram&entity=software

enum ITunesAPI {
    case search(term: String, entity: String)
}

extension ITunesAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://itunes.apple.com")!
    }
    
    var path: String {
        switch self {
        case .search:
            return "search"
        }
    }
    
    var method: Method {
        switch self {
        case .search:
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
        }
        
        return Task.requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        var result: [String : String]
        result = ["Content-Type": "application/json"]
        return result
    }
    
}

