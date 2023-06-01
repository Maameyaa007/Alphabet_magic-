//
//  homeView.swift
//  AlphabetMagic
//
//  Created by maameyaa osei-akoto on 21/04/2023.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    // Audio cues for the app

    @State private var audioPlayer: AVAudioPlayer?
    @State private var titleOffset: CGFloat = -300
    @State private var wordButtonOffset: CGFloat = 300
    @State private var lettersButtonOffset: CGFloat = 300
    @State private var wordVolumeOffset: CGFloat = 300
    @State private var lettersVolumeOffset: CGFloat = 300
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("BG")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("Title")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 800, maxHeight: 900)
                        .padding()
                        .offset(y: titleOffset)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                titleOffset = 0
                            }
                        }
                    
                    Spacer()
                    
                    VStack(spacing: -80) {
                        HStack {
                            NavigationLink(destination: ARViewContainerWordsWrapper().edgesIgnoringSafeArea(.all)) {
                                Image("Word")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 250)
                            }
                            
                            .offset(y: wordButtonOffset)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.0).delay(1.0)) {
                                    wordButtonOffset = 0
                                }
                            }
                            
                            Button(action: {
                                
                                if let url = Bundle.main.url(forResource: "words", withExtension: "mp3") {
                                    audioPlayer = try? AVAudioPlayer(contentsOf: url)
                                    audioPlayer?.play()
                                }
                               
                            })
                        {
                                Image("blue volume")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 250)
                            }
                            .offset(y: wordVolumeOffset)
                            
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.0).delay(1.2)) {
                                    wordVolumeOffset = 0
                                }
                            }
                        }
                        
                        HStack {
                            NavigationLink(destination: ARViewContainerLettersWrapper().edgesIgnoringSafeArea(.all)) {
                                Image("Letters")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 250)
                            }
                            .offset(y: lettersButtonOffset)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.0).delay(1.5)) {
                                    lettersButtonOffset = 0
                                }
                            }
                            
                            Button(action: {
                                if let url = Bundle.main.url(forResource: "letters", withExtension: "mp3") {
                                    audioPlayer = try? AVAudioPlayer(contentsOf: url)
                                    audioPlayer?.play()
                                }
                            }) {
                                Image("yellow volume")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 250)
                            }
                            .offset(y: lettersVolumeOffset)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.0).delay(1.7)) {
                                    lettersVolumeOffset = 0
                                }
                            }
                        }
                    }
                    .padding(.leading, 60)
                    
                    Spacer()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // prevents the app from creating slpit views in landscape mode
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
