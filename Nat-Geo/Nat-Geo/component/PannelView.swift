//
//  PannelView.swift
//  NatGeo
//
//  Created by mohamdan on 02/06/2023.
//

import SwiftUI

struct PannelView: View {
    //: Properties
    @State var isPannelDesplayed : Bool = false
    var scale : CGFloat
    var offset : CGSize
    //: Body
    var body: some View {
        HStack{
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .onLongPressGesture(minimumDuration: 1){
                    isPannelDesplayed.toggle()
                }
            Spacer()
            
            HStack{
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                    .padding(.vertical, 6)
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                    .padding(.vertical, 6)
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                    .padding(.vertical, 6)
                Spacer()
                
            }//: HStack
            .background(.ultraThinMaterial)
            .font(.footnote)
            .frame(maxWidth: 420, minHeight: 30, alignment: .center)
            .opacity(isPannelDesplayed ? 1 : 0)
        }//: HStack
    }
}

struct PannelView_Previews: PreviewProvider {
    static var previews: some View {
        PannelView(scale: 1, offset: .zero)
            .previewLayout(.sizeThatFits)
        
    }
}
