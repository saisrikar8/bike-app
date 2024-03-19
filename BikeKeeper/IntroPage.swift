//
//  IntroPage.swift
//  BikeKeeper
//
//  Created by Sai Srikar on 3/1/24.
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct IntroPage: View {
    @State private var orientation = UIDeviceOrientation.unknown
    @State private var y = UIScreen.main.bounds.height*0.92
    @State private var opacity = 0.0
    @State private var isVisible = false
    @State private var bgwidth = UIScreen.main.bounds.width * 1.05
    @State private var bgheight = UIScreen.main.bounds.height * 1.05
    @State private var textShown = false
    @State private var buttonClicked = 1
    var body: some View {
        NavigationView{
            ZStack{
                Image("intro-bg")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: bgwidth, height: bgheight, alignment: .centerFirstTextBaseline)
                    .clipped()
                VStack{
                    Text("Welcome")
                        .frame(width:200, height:20)
                        .opacity(opacity)
                        .foregroundColor(.black)
                        .bold()
                        .font(.largeTitle)
                        .position(y: y)
                        Button(action:{}
                        )
                        {
                            NavigationLink(destination: InfoForm()){
                                HStack{
                                    Text("Get Started")
                                        .frame(alignment: .center)
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .frame(width: UIScreen.main.bounds.width * 0.7)
                                    Image (systemName: "chevron.right")
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        .position(y: y * 0.6)
                        .opacity(opacity)
                    }
                .onAppear{
                    if !textShown{
                        textShown = true
                        withAnimation(.linear(duration: 3.0)){
                            y = UIScreen.main.bounds.height*0.87
                            opacity = 1.0
                        }
                    }
                }
                .position(x: UIScreen.main.bounds.width*1.05)
            }
            .onAppear {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                AppDelegate.orientationLock = .portrait // And making sure it stays that way
            }.onDisappear {
                AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
            }
            .padding()
        }
        
    }
}
struct IntroPage_Previews: PreviewProvider {
    static var previews: some View {
        IntroPage()
    }
}
