//
//  HorizontalLoadingComponent.swift
//  Movies
//
//  Created by Maxime Maheo on 24/09/2020.
//

import SwiftUI

struct HorizontalLoadingComponent: View {
    // MARK: - Properties

    var placeholder: String?

    // MARK: - Body

    var body: some View {
        HStack {
            Spacer()
            if let placeholder = placeholder {
                ProgressView(placeholder)
            } else {
                ProgressView()
            }
            Spacer()
        }
    }
}

struct HorizontalLoadingComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HorizontalLoadingComponent()

            HorizontalLoadingComponent(placeholder: "§Loading...")
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 375,
                              height: 100))
    }
}
