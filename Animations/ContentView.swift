//
//  ContentView.swift
//  Animations
//
//  Created by netset on 23/02/22.
//

import SwiftUI


struct CornerModifier: ViewModifier {
    var amount: Double
    var anchor: UnitPoint
    
    func body(content: Content) -> some View {
        print("amount", amount)
       return content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .opacity(amount == -90 ? 1: 0)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerModifier(amount: -90, anchor: .topLeading), identity: CornerModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    
  //  @State private var animationDuration = 1.0
    @State private var animationDuration = false
    @State private var isShowRectangle = false
    @State private var letters = Array("Hello Swift")
    @State private var dragAmount = CGSize.zero
    var body: some View {
        ZStack {
//            Button("Tap Me Vro") {
//                withAnimation(.default.delay(1)) {
//                    isShowRectangle.toggle()
//                }
//            }
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            if isShowRectangle {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 2)) {
                isShowRectangle.toggle()
            }
        }
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(animationDuration ? .blue :.red)
//                    .foregroundColor(.white)
//                    .offset(dragAmount)
//                    .gesture(
//                        DragGesture()
//                            .onChanged({ val in
//                                dragAmount = val.translation
//                            })
//                            .onEnded({ _ in
//                                dragAmount = .zero
//                                animationDuration.toggle()
//                            })
//                    )
//                    .animation(.default.delay(Double(num)/20), value: dragAmount)
//            }
//        }
////
//        LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 350, height: 200, alignment: .center)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged({ val in
//                        dragAmount = val.translation
//                    })
//                    .onEnded({ _ in
//                        withAnimation(.easeInOut(duration: 0.4)) {
//                            dragAmount = .zero
//                        }
//                    })
//            )
//        VStack {
//            Stepper("Scale Amount", value: $animationDuration.animation(
//                .easeIn(duration: 1)
//                    .repeatCount(3, autoreverses: true)), in: 1...10)
//                .padding()
//
//            Spacer()
//
//            Button("Tap Me") {
//                animationDuration += 1
//            }
//            .frame(width: 100, height: 100, alignment: .center)
//            .background(.red)
//            .clipShape(Circle())
//            .foregroundColor(.white)
//            .scaleEffect(animationDuration)
//            .blur(radius: (animationDuration - 1) * 3)
//        }
//        Button("Tap Me") {
//           // animationDuration += 1
//            animationDuration.toggle()
//        }
//        .frame(width: 100, height: 100, alignment: .center)
//        .background(animationDuration ? .red: .blue)
//        .clipShape(RoundedRectangle(cornerRadius: animationDuration ? 40: 0))
//        .foregroundColor(.white)
//        .overlay {
//            Circle()
//                .stroke(.blue)
//                .scaleEffect(animationDuration)
//                .opacity(2 - animationDuration)
//                .animation(.easeInOut(duration: 1)
//                            .repeatForever(autoreverses: false)
//                           , value: animationDuration)
//        }
//        .scaleEffect(animationDuration)
//        .blur(radius: (animationDuration - 1) * 3)
       // .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: animationDuration)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
