//
//  String+ToDate.swift
//  Movies
//
//  Created by Maxime Maheo on 24/09/2020.
//

import Foundation

extension String {
    func toDate(from format: String) -> Date? {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = format

        return dateFormatter.date(from: self)
    }
}
