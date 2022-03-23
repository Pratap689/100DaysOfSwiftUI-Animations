//
//  BackgroundAndOverlays.swift
//  Animations
//
//  Created by netset on 25/02/22.
//

import SwiftUI

struct BackgroundAndOverlays: View {
    init() {
        updateNavigationBarColor()
    }
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(stops: [Gradient.Stop(color: .black, location: 0.6), Gradient.Stop(color: .purple, location: 0.7)], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack {
                        HeartView()
                        HeyPratapView()
                    }
                    VerticalGridViews()
                    ScrollView(.horizontal) {
                        HorizontalGridViews()
                    }
                }
            }.navigationTitle("SwiftUI For Beginners")
        }
    }

    func updateNavigationBarColor() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

struct BackgroundAndOverlays_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlays()
        
    }
}

struct HeyPratapView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Hey Pratap")
                .underline(.random(), color: .red)
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(.white)
            Text("Yeah I am Pratap rana, i am a iOS Developer by profession. I have god hands on swift but now I am also learning SwiftUI which is awesome.")
                .foregroundColor(.white)
        }
        .padding()
        .padding([.leading, .trailing], 10)
        .background(LinearGradient(stops: [Gradient.Stop(color: .black.opacity(0.9), location: 0.5), Gradient.Stop(color: .red.opacity(1), location: 0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        .shadow(color: .white.opacity(0.8), radius: 5, x: 0.0, y: 4)
    }
}


struct VerticalGridViews: View {
    
    let gridColumn: [GridItem] = [
        GridItem(.flexible(), spacing: nil),
        GridItem(.flexible(), spacing: nil),
        GridItem(.flexible(), spacing: nil)
    ]
    
    var body: some View {
        LazyVGrid(columns: gridColumn
                  , pinnedViews: .sectionHeaders) {
            Section(header:
                        Text("Vertical GridView")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
            ) {
                ForEach(0..<14) { index in
                    Image("\(index)")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100, alignment: .center)
                }
            }
        }.padding(05)
    }
}

struct HorizontalGridViews: View {
    
    let gridColumn: [GridItem] = [
        GridItem(.flexible(minimum: 100, maximum: 300), spacing: 10),
        GridItem(.flexible(minimum: 100, maximum: 300), spacing: 10),
        GridItem(.flexible(minimum: 100, maximum: 300), spacing: 10),
        GridItem(.flexible(minimum: 100, maximum: 300), spacing: 10)
    ]
    
    var body: some View {
        VStack {
            Text("Horizontal Gridview")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            LazyHGrid(rows: gridColumn, spacing: 10) {
                ForEach(1..<14) { index in
                    Image("\(index).0")
                        .resizable()
                        .scaledToFit()
                }
            }.padding(10)
        }
    }
}

struct HeartView: View {
    
    @State var animateDuration = 1.0
    
    var body: some View {
        HStack(spacing: 30) {
            Text("Background and Overlays")
                .fontWeight(.semibold)
                .padding(10)
                .foregroundColor(.white)
                .background(.pink)
                .cornerRadius(5)
                .shadow(color: .white.opacity(0.4), radius: 8, x: 1, y: 5)
            Button {
                animateDuration = 0.5
            } label: {
                Image(systemName: "heart.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.black.opacity(0.8), .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .frame(width: 100, height: 100)
                            .shadow(color: .purple.opacity(0.5), radius: 10, x: 0, y: 10)
                            .overlay(alignment: .bottomTrailing, content: {
                                Circle()
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [.pink, .white]), startPoint: .topTrailing, endPoint: .bottomLeading)
                                    )
                                    .frame(width: 35, height: 35)
                                    .overlay {
                                        Text("5")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .shadow(color: .purple.opacity(0.4), radius: 10, x: 5, y: 5)
                            })
                    )
                
            }
            .scaleEffect(animateDuration)
            .animation(.easeInOut(
                duration: 0.5).repeatForever(autoreverses: true)
                       , value: animateDuration)
        }
        .padding([.top, .bottom], 40)
        .padding(.leading, 50)
        .padding(.trailing, 50)
        .background(
            LinearGradient(gradient: Gradient(colors: [.pink.opacity(0.5), .white.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .cornerRadius(5))
        .cornerRadius(10)
        .shadow(color: .white, radius: 50, x: 0, y: 5)
    }
}
