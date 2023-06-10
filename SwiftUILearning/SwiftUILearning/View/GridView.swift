//
//  GridView.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/22/23.
//

import SwiftUI

struct GridView: View {
    
    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    private var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(months, id: \.self) { month in
                        NavigationLink {
//                            DetailsScreen(detailTitle: month)
                            ImageDisplayView()
                        } label: {
//                            Text(month)
                            GridViewCell(cellData: month)
                        }
                    }
                }
            }
        }.padding(.top, 150)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
