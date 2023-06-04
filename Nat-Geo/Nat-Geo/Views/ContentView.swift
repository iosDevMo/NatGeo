//
//  ContentView.swift
//  NatGeo
//
//  Created by mohamdan on 31/05/2023.
//

import SwiftUI

struct ContentView: View {
    //: Property
    @State var imageScale : CGFloat = 1
    @State var imageOffset : CGSize = .zero
    let covers : [Cover] = coverData
    @State var coverIndex : Int = 1
    //:function
    private func resetImage (){
        imageScale = 1
        imageOffset = .zero
    }
    //:Body
    var body: some View {
        Image(covers[coverIndex].coverName)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .scaleEffect(imageScale)
            .offset(x: imageOffset.width, y: imageOffset.height)
            .padding()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.35), radius: 8, x: 3, y: 3)
        //: Double tap gesture
            .onTapGesture(count: 2) {
                withAnimation(.spring()){
                    if imageScale == 1 {
                        imageScale = 5
                    }else{
                        resetImage()
                    }
                }
            }
        //:Drag gesture
            .gesture(DragGesture()
                .onChanged ({ gesture in
                    imageOffset = gesture.translation
                })
                    .onEnded ({ _ in
                        withAnimation(.spring()){
                            if imageScale <= 1{
                                resetImage()
                            }
                        }
                    })
            )
        //: Magnification gesture
            .gesture(MagnificationGesture()
                .onChanged ({ value in
                    withAnimation(.spring()){
                        if imageScale >= 1 && imageScale <= 5 {
                            imageScale = value
                        }else if imageScale > 5 {
                            imageScale = 5
                        }else if imageScale < 1 {
                            imageScale = 1
                        }
                    }
            })
            .onEnded ({ value in
                withAnimation(.spring()){
                    if imageScale >= 5 {
                        imageScale = 5
                    }else if imageScale <= 1 {
                        imageScale = 1
                    }
                }
            })
        )
        //: drawer
            .overlay(alignment : .topTrailing) {
                DrawerView(index: $coverIndex)
                    .padding(.top, 15)
            }
        //: ControlView
            .overlay(alignment: .bottom) {
                ControlView(scale: $imageScale, offset: $imageOffset)
            }
        // : PannelView
            .overlay(alignment: .top) {
                PannelView(scale: imageScale, offset: imageOffset)
                    .padding()
                    .offset(y: -50)
                
            }
    }
}
//: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
