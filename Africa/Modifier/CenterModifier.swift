//
//  CenterModifier.swift
//  Africa
//
//  Created by Piotr Szerszeń on 09/11/2021.
//

import SwiftUI

struct CenterModifier: ViewModifier {

    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

