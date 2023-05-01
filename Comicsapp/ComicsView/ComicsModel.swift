//
//  ComicsModel.swift
//  Comicsapp
//
//  Created by Samakab on 30/04/2023.
//
import SwiftUI
import Foundation
struct Welcome: Codable, Identifiable, Equatable, Hashable  {
    let month: String
    let num: Int
    let link, year, news, safeTitle: String
    let transcript, alt: String
    let img: String
    let title, day: String
    var id: Int {
           return num
       }
    static func == (lhs: Welcome, rhs: Welcome) -> Bool {
           return lhs.month == rhs.month && lhs.num == rhs.num && lhs.link == rhs.link && lhs.year == rhs.year && lhs.day == rhs.day && lhs.news == rhs.news && lhs.safeTitle == rhs.safeTitle && lhs.transcript == rhs.transcript && lhs.alt == rhs.alt && lhs.img == rhs.img && lhs.title == rhs.title
       }
    enum CodingKeys: String, CodingKey {
        case month, num, link, year, news
        case safeTitle = "safe_title"
        case transcript, alt, img, title, day
    }
}
