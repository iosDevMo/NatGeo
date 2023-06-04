//
//  DrawerView.swift
//  NatGeo
//
//  Created by mohamdan on 01/06/2023.
//

import SwiftUI

struct DrawerView: View {
    
    //: Property
    var covers : [Cover] = coverData
    @State var isDrawerOpen : Bool = false
    @Binding var index : Int
    
    //: Body
    var body: some View {
        HStack{
            Image(systemName: isDrawerOpen ? "chevron.compact.right" :  "chevron.compact.left")
                .resizable()
                .scaledToFit()
                .frame(height: 40, alignment: .center)
                .padding(8)
                .foregroundColor(.secondary)
                .onTapGesture {
                    isDrawerOpen.toggle()
                }
            Spacer()
            ForEach(covers) { item in
                Image(item.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .padding(.horizontal, 2)
                    .onTapGesture {
                        index = item.id-1
                    }
            }
        }// : Hstack
        .frame(width: 260)
        .background(.thinMaterial)
        .cornerRadius(8)
        .offset(x: isDrawerOpen ? 0 : 225)
    }
}
//: Preview
struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerView(index: .constant(1))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
    }
}
