//
//  LoadingViewSpy.swift
//  PresentationTests
//
//  Created by Marcos Barbosa on 04/05/21.
//

import Foundation
import Presentation

class LoadingViewSpy: LoadingView {
    
    var emit: ((LoadingViewModel) -> Void)?
    
    func observe(completion: @escaping(LoadingViewModel) -> Void) {
        self.emit = completion
    }
    
    func display(viewModel: LoadingViewModel) {
        self.emit?(viewModel)
    }
}
