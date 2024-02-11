//
//  ContentView.swift
//  TestTask
//
//  Created by Misha Vrana on 10.02.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        if !viewModel.isShowingFullImage {
            ZStack(alignment: .top) {
                Color.gray
                    .ignoresSafeArea()
                VStack {
                    optionalImage
                    horizontalButtons
                        .padding(20)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Open full")
                            .strokedButton()
                    }
                    .padding(20)
                }
            }
        } else {
            TopView(dismissScreenAction: viewModel.closeFullImage)
                .transition(.move(edge: .top))
        }
    }
    
    
    @ViewBuilder 
    private var optionalImage: some View {
        if let uiImage = UIImage(named: "panda") {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: 150,
                    height: UIScreen.main.bounds.height * 0.3,
                    alignment: .leading
                )
                .clipped()
        }
    }
    
    private var horizontalButtons: some View {
        HStack(spacing: 20) {
            Button {
                if !viewModel.isLocked {
                    viewModel.lockShowTopButton()
                } else {
                    viewModel.unlockShowTopButton()
                }
            } label: {
                Text(viewModel.isLocked ? "Unlock" : "Lock")
                    .strokedButton()
                    .animation(.none, value: viewModel.isLocked)
            }
            
            Button {
                viewModel.openFromTop()
            } label: {
                Text("Open from top")
                    .strokedButton()
            }
            .disabled(viewModel.isLocked)
            .opacity(viewModel.isLocked ? 0.5 : 1)
        }
    }
}

#Preview {
    ContentView()
}
