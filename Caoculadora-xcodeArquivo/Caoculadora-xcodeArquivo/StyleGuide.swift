//
//  StyleGuide.swift
//  Caoculadora-xcodeArquivo
//
//  Created by Marina Meirelles Paixão on 13/05/24.
//

import SwiftUI

extension Font {
    static let display: Font = .system(
        size: 60,
        weight: .bold,
        design: .rounded
    )
    static let header1: Font = .system(
        size: 48,
        weight: .bold,
        design: .rounded
    )
    static let header2: Font = .system(
        size: 40,
        weight: .bold,
        design: .rounded
    )
    static let header3: Font = .system(
        size: 36,
        weight: .bold,
        design: .rounded
    )
    static let header4: Font = .system(
        size: 32,
        weight: .bold,
        design: .rounded
    )
    static let header5: Font = .system(
        size: 24,
        weight: .bold,
        design: .rounded
    )
    static let header6: Font = .system(
        size: 20,
        weight: .bold,
        design: .rounded
    )
    static let body1: Font = .body.bold()

}


extension Color {
    static let corDoApp: Color  = Color(red: 79/255, green: 70/255, blue: 229/255)
}
