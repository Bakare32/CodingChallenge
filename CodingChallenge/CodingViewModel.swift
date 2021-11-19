//
//  CodingViewModel.swift
//  CodingChallenge
//
//  Created by Decagon on 19/11/2021.
//

import Foundation
import UIKit.UIImage

class CodingViewModel: ObservableObject {
  var title: String
  var describe: String
  var image: UIImage!
 
  init(with model: CodingModel) {
    title = model.title
    describe = model.describe
    image = UIImage(named: "\(model.image)")
  }
}
