//
//  SearchResultModel.swift
//  AppStoreJSONApis
//
//  Created by 안관수 on 2019/12/24.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import Foundation

struct ITunesSearchResult: Codable {
    let resultCount: Int
    let results: [ITunesSearchResultItem]
}

// MARK: - Result
struct ITunesSearchResultItem: Codable {
    let isGameCenterEnabled: Bool
    let screenshotUrls, ipadScreenshotUrls: [String]
    let artworkUrl512: String
    let artistViewURL: String?
    let artworkUrl60, artworkUrl100: String // app icon
    let supportedDevices, advisories: [String]
    let languageCodesISO2A: [String]
    let fileSizeBytes: String
    let sellerURL: String?
    let averageUserRatingForCurrentVersion: Double?
    let userRatingCountForCurrentVersion: Int?
    let trackCensoredName: String
    let trackViewURL: String?
    let isVppDeviceBasedLicensingEnabled: Bool
    let primaryGenreName: PrimaryGenreName
    let genreIDS: [String]?
    let primaryGenreID: Int?
    let sellerName, trackName: String
    let trackID: Int?
    let minimumOSVersion: String?
//    let currentVersionReleaseDate: Date?
    let releaseNotes: String?
//    let releaseDate: Date
    let version: String
    let artistID: Int?
    let artistName: String
    let price: Int
    let resultDescription, bundleID: String?
    let averageUserRating: Double?
    let userRatingCount: Int?
}

enum PrimaryGenreName: String, Codable {
    case business = "Business"
    case entertainment = "Entertainment"
    case lifestyle = "Lifestyle"
    case photoVideo = "Photo & Video"
    case productivity = "Productivity"
    case reference = "Reference"
    case socialNetworking = "Social Networking"
    case utilities = "Utilities"
}
