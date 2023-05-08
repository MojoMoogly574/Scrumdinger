//
//  TRhemePickerView.swift
//  Scrumdinger
//
//  Created by Joseph DeWeese on 5/7/23.
//

import SwiftUI

struct ThemePicker: View {
    //MARK:  PROPERTIES
    @Binding var selection: Theme
    
    
    var body: some View {
        Picker("Theme", selection:  $selection) {
            ForEach(Theme.allCases) {  theme in
                ThemeView(theme: theme)
                                    .tag(theme)
                
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct TRhemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.indigo))
    }
}
