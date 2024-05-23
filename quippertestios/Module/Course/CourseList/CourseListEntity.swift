// 
//  CourseListEntity.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import Foundation

struct CourseEntity: Codable {
    let title, presenterName, description: String
    let thumbnailURL: String
    let videoURL: String
    let videoDuration: Int

    enum CodingKeys: String, CodingKey {
        case title
        case presenterName = "presenter_name"
        case description
        case thumbnailURL = "thumbnail_url"
        case videoURL = "video_url"
        case videoDuration = "video_duration"
    }
}
