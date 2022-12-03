//
//  ContentView.swift
//  Contributors
//
//  Created by varunbhalla19 on 03/12/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font : UIFont.monospacedSystemFont(ofSize: 24, weight: .semibold)
        ]
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont.monospacedSystemFont(ofSize: 16, weight: .medium)
        ]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(0..<30) { _ in
                        RoundedRectangle.init(cornerRadius: 24)
                            .padding()
                    }
                }
            }
            .navigationTitle("Contributors")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
