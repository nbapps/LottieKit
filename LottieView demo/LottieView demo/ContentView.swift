//
//  ContentView.swift
//  LottieView demo
//
//  Created by Nicolas Bachur on 27/10/2022.
//

import SwiftUI
import LottieKit

enum LottieFile: String {
    case diamond = "demo-file"
}
struct ContentView: View {
    var body: some View {
        VStack {
            LottieView(file: LottieFile.diamond.rawValue)
            Text("Default loopmode is loop")
            LottieView(file: LottieFile.diamond.rawValue,
                       loopMode: .autoReverse)
            Text("Can update loopMode")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
