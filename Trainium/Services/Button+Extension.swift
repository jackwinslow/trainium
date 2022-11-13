//
//  Button+Extension.swift
//  Trainium
//
//  Created by Jack Winslow on 11/12/22.
//

import SwiftUI

struct StaticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
