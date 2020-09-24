//
//  Movie.swift
//  Movies
//
//  Created by Maxime Maheo on 17/09/2020.
//

import Foundation

struct MovieList: Codable {
    let page: Int
    let results: [Movie]
    let totalResults: Int
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDateString: String

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDateString = "release_date"
    }
    
    var releaseDate: Date? {
        releaseDateString.toDate(from: "yyyy-mm-dd")
    }

    // MARK: - Methods

    func posterPathUrl(size: ImageSize) -> URL? {
        guard
            let posterPath = posterPath
        else { return nil }

        return URL(string: "https://image.tmdb.org/t/p/\(size.rawValue)\(posterPath)")
    }

    func backdropPathUrl(size: ImageSize) -> URL? {
        guard
            let backdropPath = backdropPath else { return nil }

        return URL(string: "https://image.tmdb.org/t/p/\(size.rawValue)\(backdropPath)")
    }
}

#if DEBUG
extension Movie {
    static let one = Movie(id: 419704,
                           title: "Ad Astra",
                           overview: "The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon menaces to destroy life on planet Earth, astronaut Roy McBride undertakes a mission across the immensity of space and its many perils to uncover the truth about a lost expedition that decades before boldly faced emptiness and silence in search of the unknown.",
                           posterPath: "/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg",
                           backdropPath: "/5BwqwxMEjeFtdknRV792Svo0K1v.jpg",
                           releaseDateString: "2010-01-19")

    static let list = [
        Movie(id: 554993,
              title: "Britt-Marie Was Here",
              overview: "Britt-Marie, a woman in her sixties, decides to leave her husband and start anew. Having been housewife for most of her life and and living in small backwater town of Borg, there isn't many jobs available and soon she finds herself fending a youth football team.",
              posterPath: "/1Duc3EBiegywczxTWekvy03HWai.jpg",
              backdropPath: "/oCFbh4Mrd0fuGanCgIF6sG27WGD.jpg",
              releaseDateString: "2010-01-19"),
        Movie(id: 475430,
              title: "Artemis Fowl",
              overview: "Artemis Fowl is a 12-year-old genius and descendant of a long line of criminal masterminds. He soon finds himself in an epic battle against a race of powerful underground fairies who may be behind his father's disappearance.",
              posterPath: "/mhDdx7o7hhrxrikq8aqPLLnS9w8.jpg",
              backdropPath: "/o0F8xAt8YuEm5mEZviX5pEFC12y.jpg",
              releaseDateString: "2010-01-19"),
        Movie(id: 707886,
              title: "Feel the Beat",
              overview: "After failing to make it on Broadway, April returns to her hometown and reluctantly begins training a misfit group of young dancers for a competition.",
              posterPath: "/wXBxd34dFEx6Wruf5Ch5jKLBxDi.jpg",
              backdropPath: "/fZBQOScjDT8TAipEyCkLVeDTu5c.jpg",
              releaseDateString: "2010-01-19")
    ]
}
#endif
