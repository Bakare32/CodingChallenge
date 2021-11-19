//
//  CodingViewModel.swift
//  CodingChallenge
//
//  Created by Decagon on 19/11/2021.
//

import Foundation
import UIKit.UIImage
import UIKit

class CodingViewModel: ObservableObject {
  var title: String
  var describe: String
  var image: String
 
  init(with model: Photo) {
    title = model.title
      describe = "\(model.ownername)"
      image = model.urlM
  }
}
