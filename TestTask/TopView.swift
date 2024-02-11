//
//  TopView.swift
//  TestTask
//
//  Created by Misha Vrana on 11.02.2024.
//

import SwiftUI
struct TopView: View {
    
    var dismissScreenAction: () -> ()
    
    var body: some View {
        ZStack {
            optionalImage
            close
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
    }
    
    @ViewBuilder
    private var optionalImage: some View {
        if let uiImage = UIImage(named: "panda") {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .vertical)
                .frame(
                    width: UIScreen.main.bounds.width,
                    alignment: .leading
                )
        }
    }
    
    private var close: some View {
        Button {
           dismissScreenAction()
        } label: {
            Image(systemName: "xmark")
                .foregroundStyle(.white)
                .background {
                    Circle()
                        .fill(.gray)
                        .frame(width: 36, height: 36)
                }
                .padding(20)
           
        }
    }
}

#Preview {
    TopView(dismissScreenAction: { } )
}
