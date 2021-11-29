//
//  CartLoadingView.swift
//  ModerneShopping
//
//  Created by Hassan Yahya on 19/04/1443 AH.
//

import SwiftUI

struct CartLoadingView: View {
    var body: some View {
        HStack{
            Spacer()
            VStack {
                CartLoading()
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Your cart is empty").font(.headline)
            }
            Spacer()
        }
    }
}

struct CartLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: true, error: nil, retryAction: nil)
    }
}

