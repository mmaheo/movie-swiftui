//
//  RemoteImageComponent.swift
//  Movies
//
//  Created by Maxime Maheo on 17/09/2020.
//

import KingfisherSwiftUI
import SwiftUI

struct RemoteImageComponent: View {
    // MARK: - Properties

    let url: URL?
    var width: CGFloat?
    var height: CGFloat?

    // MARK: - Body

    var body: some View {
        KFImage(url)
            .cancelOnDisappear(true)
            .placeholder {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(Color.gray.opacity(0.2))
            }
            .resizable()
            .frame(width: width,
                   height: height)
            .cornerRadius(4)
    }
}

#if DEBUG
struct RemoteImageComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RemoteImageComponent(url: Movie.one.posterPathUrl(size: .small),
                                 width: 100,
                                 height: 150)

            RemoteImageComponent(url: Movie.one.posterPathUrl(size: .small),
                                 width: 100,
                                 height: 150)
                .preferredColorScheme(.dark)

            RemoteImageComponent(url: nil,
                                 width: 100,
                                 height: 150)
                .preferredColorScheme(.light)
        }
        .previewLayout(.fixed(width: 200, height: 200))
    }
}
#endif
