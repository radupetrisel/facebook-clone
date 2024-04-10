//
//  PhotosPickerItem+Extensions.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 10.04.2024.
//

import Foundation
import PhotosUI
import SwiftUI

extension PhotosPickerItem {
    var isAudioVideo: Bool { supportedContentTypes.contains(where: { $0.isSubtype(of: .audiovisualContent )})}
    var isImage: Bool { supportedContentTypes.contains(where: { $0.isSubtype(of: .image )})}
}
