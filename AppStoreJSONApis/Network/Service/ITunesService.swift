//
//  ItunesSearchService.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2019/12/24.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import RxSwift
import RxCocoa
import Moya

enum ITunesError: Error {
    case searchFailed
}

class ITunesService {
    
    static let instance = ITunesService()
    let provider = MoyaProvider<ITunesAPI>()
    
    //https://itunes.apple.com/search?term=instagram&entity=software
    func search(term: String, entity: String) -> Single<ITunesSearchResult> {
        return provider.rx.request(.search(term: term, entity: entity))//.asObservable()
            .flatMap { (response) -> Single<ITunesSearchResult> in
                print("search: \(String(data: response.data, encoding: .utf8))")

                if response.statusCode == 200 {
                    let ttt = try response.map(ITunesSearchResult.self)
                    return Single<ITunesSearchResult>.just(ttt)
                } else {
                    return Single<ITunesSearchResult>.error(ITunesError.searchFailed)
                }
        }
        
    }
    
}


