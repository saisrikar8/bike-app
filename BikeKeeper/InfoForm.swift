//
//  InfoForm.swift
//  BikeKeeper
//
//  Created by Sai Srikar on 3/1/24.
//

import SwiftUI

struct InfoForm: View {
    @State private var firstName = ""
    @State private var lastName = ""
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Color(UIColor.systemGroupedBackground)
                VStack{
                    VStack{
                        Text("Information")
                            .position(x:0.5*geometry.size.width, y:0.2*geometry.size.height)
                            .font(.title)
                            .bold()
                        
                        Form{
                            Section{
                                TextField("First Name", text: $firstName)
                                TextField("Last Name", text: $lastName)
                            }
                        }.position(x: 0.5*geometry.size.width, y: geometry.size.height*0.1)
                            .scrollContentBackground(.hidden)
                            .background(
                                Color(UIColor.systemGroupedBackground))
                            .frame(height: geometry.size.height*0.19)
                        
                        Button(action: {}, label: {
                            NavigationLink(destination: IntroPage(), label:{
                                Text("Continue").foregroundColor(.white)})
                        })
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        
                    }.background(Color(UIColor.systemGroupedBackground))
                    
                        .position(x: geometry.size.width/2, y: geometry.size.height * 0.15)
                    Image("FormImg")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: 0.6*geometry.size.height, alignment: .centerFirstTextBaseline)
                        .position(x:geometry.size.width*0.5, y: geometry.size.height*0.3)
                        .ignoresSafeArea(.keyboard)
                }
            }}
            
            .onAppear {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                AppDelegate.orientationLock = .portrait // And making sure it stays that way
            }.onDisappear {
                AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
            }
            .ignoresSafeArea()
            
    }
    
    
    func writeToJson(){
        //guard var path = new URL()
    }

}

struct InfoForm_Previews: PreviewProvider {
    static var previews: some View {
        InfoForm()
    }
}
