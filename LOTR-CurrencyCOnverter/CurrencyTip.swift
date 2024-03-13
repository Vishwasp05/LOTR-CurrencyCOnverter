//
//  CurrencyTip.swift
//  LOTR-CurrencyCOnverter
//
//  Created by Vishwas Sharma on 13/03/24.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title: Text = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the 'Select Currency' screen")
    
    
}
