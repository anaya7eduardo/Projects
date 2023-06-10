//
//  GridViewCell.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/22/23.
//

import SwiftUI

struct GridViewCell: View {
    
    var cellData: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15.0)
            .fill(.green)
            .overlay(Text(cellData))
            .frame(width: 80, height: 80)
            
//            Text("TEXT")
        }
    }
}

struct GridViewCell_Previews: PreviewProvider {
    static var previews: some View {
        GridViewCell(cellData: "Cell Data")
    }
}
