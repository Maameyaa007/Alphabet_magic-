//
//  ContentView.swift
//  AlphabetMagic
//
//  Created by maameyaa osei-akoto on 21/04/2023.
//

import SwiftUI
import RealityKit
import AVFoundation


// audio for buttons
struct AudioButton: View {
    let audioFileName: String
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        Button(action: {
            if let url = Bundle.main.url(forResource:audioFileName, withExtension: "mp3") {
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
        }) {
            Image("blue volume")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
    }
}




// Letters ar view
struct ARViewContainerLetters: UIViewRepresentable {
    @Binding var showInstructions: Bool
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        //Load the scene from Reality File
        let aletterAnchor = try! Experience.loadBox()
        let bletterAnchor = try! LetterB.loadLetterb()
        let cletterAnchor = try! Letterc.loadLetterC()
        let dletterAnchor = try! LetterD.load_LetterD()
        let eletterAnchor = try! LetterE.load_LetterE()
        let fletterAnchor = try! LetterF.load_LetterF()
        let gletterAnchor = try! LetterG.load_LetterG()
        let hletterAnchor = try! LetterH.load_LetterH()
        let iletrerAnchor = try! LetterI.load_LetterI()
        let jletterAnchor = try! LetterJ.load_LetterJ()
        let kletterAnchor = try! LetterK.load_LetterK()
        let LletterAnchor = try! LetterL.load_LetterL()
        let mletterAnchor = try! LetterM.load_LetterM()
        let nletterAnchor = try! LetterN.load_LetterN()
        let oletterAnchor = try! LetterO.load_LetterO()
        let pletterAnchor = try! LetterP.load_LetterP()
        let qletterAnchor = try! LetterQ.load_LetterQ()
        let rletterAnchor = try! LetterR.load_LetterR()
        let sletterAnchor = try! LetterS.load_LetterS()
        let tletterAnchor = try! LetterT.load_LetterT()
        let uletterAnchor = try! LetterU.load_LetterU()
        let vletterAnchor = try! LetterV.load_LetterV()
        let wletterAnchor = try! LetterW.load_LetterW()
        let xletterAnchor = try! LetterX.load_LetterX()
        let yletterAnchor = try! LetterY.load_LetterY()
        let zletterAnchor = try! LetterZ.load_LetterZ()
        
        
        
        //Add the anchor to the scene
        arView.scene.anchors.append(aletterAnchor)
        arView.scene.anchors.append(bletterAnchor)
        arView.scene.anchors.append(cletterAnchor)
        arView.scene.anchors.append(dletterAnchor)
        arView.scene.anchors.append(eletterAnchor)
        arView.scene.anchors.append(fletterAnchor)
        arView.scene.anchors.append(gletterAnchor)
        arView.scene.anchors.append(hletterAnchor)
        arView.scene.anchors.append(iletrerAnchor)
        arView.scene.anchors.append(jletterAnchor)
        arView.scene.anchors.append(kletterAnchor)
        arView.scene.anchors.append(LletterAnchor)
        arView.scene.anchors.append(mletterAnchor)
        arView.scene.anchors.append(nletterAnchor)
        arView.scene.anchors.append(oletterAnchor)
        arView.scene.anchors.append(pletterAnchor)
        arView.scene.anchors.append(qletterAnchor)
        arView.scene.anchors.append(rletterAnchor)
        arView.scene.anchors.append(sletterAnchor)
        arView.scene.anchors.append(tletterAnchor)
        arView.scene.anchors.append(uletterAnchor)
        arView.scene.anchors.append(vletterAnchor)
        arView.scene.anchors.append(wletterAnchor)
        arView.scene.anchors.append(xletterAnchor)
        arView.scene.anchors.append(yletterAnchor)
        arView.scene.anchors.append(zletterAnchor)

        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}






// instruction button view

struct InstructionsButtonView: View {
    @Binding var showInstructions: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showInstructions.toggle()
                }) {
                    Image("info")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding()
                }
            }
        }
    }
}










//overlay for Letter instructions

struct ARViewContainerLettersWrapper: View {
    @State private var showInstructions = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("Back")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
        }
    }
    
    var body: some View {
        ZStack {
            ARViewContainerLetters(showInstructions: $showInstructions)
            
            InstructionsButtonView(showInstructions: $showInstructions)
            
            VStack {
                HStack {
                    backButton // custom back button
                    Spacer()
                }
                Spacer()
            }
            
            if showInstructions {
                VStack {
                    
                    Text("Instructions")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    AudioButton(audioFileName: "letters intro")
                    
                    Text("Welcome to Letters! Point your camera at the alphabet card and watch the letters come to life. Tap the letter to hear its fun sound!. If you need help again press the question mark button. Have fun exploring!")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button(action: {
                        showInstructions.toggle()
                    }) {
                        Text("Lets Begin")
                            .font(.title2)
                            .bold()
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .frame(width: 500) // need to change the width of the container here
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.black.opacity(0.5))
            }
        }
        .navigationBarBackButtonHidden(true) // hides the defult back button 
    }
}







// Words AR View
struct ARViewContainerWords: UIViewRepresentable {
    @Binding var showInstructions: Bool
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        //Load the scene from Reality File
        let awordAnchor = try! Experience.loadWordA()
        let bwordAnchor = try! LetterB.loadWordB()
        let cwordAnchor = try! Letterc.loadWordC()
        let dwordAnchor = try! LetterD.loadWordD()
        let ewordAnchor = try! LetterE.loadWordE()
        let fwordAnchor = try! LetterF.loadWordF()
        let gwordAnchor = try! LetterG.loadWordG()
        let hwordAnchor = try! LetterH.loadWordH()
        let iwordAnchor = try! LetterI.loadWordI()
        let jwordAnchor = try! LetterJ.loadWordJ()
        let kwordAnchor = try! LetterK.loadWordK()
        let lwordAnchor = try! LetterL.loadWordL()
        let mwordAnchor = try! LetterM.loadWordM()
        let nwordAnchor = try! LetterN.loadWordN()
        let owordAnchor = try! LetterO.loadWordO()
        let pwordAnchor = try! LetterP.loadWordP()
        let qwordAnchor = try! LetterQ.loadWordQ()
        let rwordAnchor = try! LetterR.loadWordR()
        let swordAnchor = try! LetterS.loadWordS()
        let twordAnchor = try! LetterT.loadWordT()
        let uwordAnchor = try! LetterU.loadWordU()
        let vwordAnchor = try! LetterV.loadWordV()
        let wwordAnchor = try! LetterW.loadWordW()
        let xwordAnchor = try! LetterX.loadWordX()
        let ywordAnchor = try! LetterY.loadScene1()
        let zwordAnchor = try! LetterZ.loadWordZ()
        
        
        //Add the anchor to the scene
        arView.scene.anchors.append(awordAnchor)
        arView.scene.anchors.append(bwordAnchor)
        arView.scene.anchors.append(cwordAnchor)
        arView.scene.anchors.append(dwordAnchor)
        arView.scene.anchors.append(ewordAnchor)
        arView.scene.anchors.append(fwordAnchor)
        arView.scene.anchors.append(gwordAnchor)
        arView.scene.anchors.append(hwordAnchor)
        arView.scene.anchors.append(iwordAnchor)
        arView.scene.anchors.append(jwordAnchor)
        arView.scene.anchors.append(kwordAnchor)
        arView.scene.anchors.append(lwordAnchor)
        arView.scene.anchors.append(mwordAnchor)
        arView.scene.anchors.append(nwordAnchor)
        arView.scene.anchors.append(owordAnchor)
        arView.scene.anchors.append(pwordAnchor)
        arView.scene.anchors.append(qwordAnchor)
        arView.scene.anchors.append(rwordAnchor)
        arView.scene.anchors.append(swordAnchor)
        arView.scene.anchors.append(twordAnchor)
        arView.scene.anchors.append(uwordAnchor)
        arView.scene.anchors.append(vwordAnchor)
        arView.scene.anchors.append(wwordAnchor)
        arView.scene.anchors.append(xwordAnchor)
        arView.scene.anchors.append(ywordAnchor)
        arView.scene.anchors.append(zwordAnchor)
        
        
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}









// overlay for Word instructions
struct ARViewContainerWordsWrapper: View {
    @State private var showInstructions = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("Back")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
        }
    }
    
    var body: some View {
        ZStack {
            ARViewContainerWords(showInstructions: $showInstructions)
            
            InstructionsButtonView(showInstructions: $showInstructions)
            
            VStack {
                HStack {
                    backButton 
                    Spacer()
                }
                Spacer()
            }
            
            if showInstructions {
                VStack {
                    Text("Instructions")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    AudioButton(audioFileName: "words intro")
                    
                    Text("Welcome to Words! Point your camera at the alphabet card and watch the word come to life. Tap the letters to hear its fun sound! If you need help again press the question mark button. Have fun exploring!")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button(action: {
                        showInstructions.toggle()
                    }) {
                        Text("Lets Begin")
                            .font(.title2)
                            .bold()
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .frame(width: 500)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.black.opacity(0.5))
            }
        }
        .navigationBarBackButtonHidden(true) 
    }
}


