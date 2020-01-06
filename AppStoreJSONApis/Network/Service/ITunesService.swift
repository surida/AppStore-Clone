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
    case fetchGameFailed
}

class ITunesService {
    
    static let instance = ITunesService()
    let provider = MoyaProvider<ITunesAPI>()
    
    //https://itunes.apple.com/search?term=instagram&entity=software
    func search(term: String, entity: String) -> Single<ITunesSearchResult> {
        return provider.rx.request(.search(term: term, entity: entity))//.asObservable()
            .flatMap { (response) -> Single<ITunesSearchResult> in
//                print("search: \(String(data: response.data, encoding: .utf8))")
                if response.statusCode == 200 {
                    let result = try response.map(ITunesSearchResult.self)
                    return Single<ITunesSearchResult>.just(result)
                } else {
                    return Single<ITunesSearchResult>.error(ITunesError.searchFailed)
                }
        }
    }
    
    func fetchGame() -> Single<ITunesFetchGameResult> {
        return provider.rx.request(.fetchGames)
            .flatMap { (response) -> Single<ITunesFetchGameResult> in
                print("fetchGame: \(String(data: response.data, encoding: .utf8))")
                if response.statusCode == 200 {
                    let result = try response.map(ITunesFetchGameResult.self)
                    return Single<ITunesFetchGameResult>.just(result)
                } else {
                    return Single<ITunesFetchGameResult>.error(ITunesError.fetchGameFailed) //.error(ITunesError.fetchGameFailed)
                }
            }
    }
    
}


