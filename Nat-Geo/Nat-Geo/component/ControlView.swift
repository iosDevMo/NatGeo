//
//  ControlView.swift
//  NatGeo
//
//  Created by mohamdan on 02/06/2023.
//

import SwiftUI

struct ControlView: View {
    //: Properties
    @Binding var scale : CGFloat
    @Binding var offset : CGSize
    //: Body
    var body: some View {
        HStack{
            Button {
                if scale > 1 {
                    scale = scale-1
                }
            } label: {
                Image(systemName: "minus.magnifyingglass")
            }
            Button {
                scale = 1
                offset = .zero
            } label: {
                Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
            }
            Button {
                if scale < 5 {
                    scale = scale+1
                }
            } label: {
                Image(systemName: "plus.magnifyingglass")
            }
        }//: Hstack
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .foregroundColor(.white)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .font(.largeTitle)
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(scale: .constant(1), offset: .constant(.zero))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
