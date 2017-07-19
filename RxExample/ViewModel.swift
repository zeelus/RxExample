//
//  ViewModel.swift
//  RxExample
//
//  Created by Gilbert Gwizdała on 19/07/2017.
//
//

import Foundation
import RxSwift

class ViewModelRx {
    
    public let image = Variable<UIImage?>(nil)
    
    public func getImage() {
        self.image.value = downloadImage()
    }
    
    private func downloadImage() -> UIImage? {
        
        return UIImage(named: "dog")
        
    }
    
}



//-----------------------------------------------------

protocol ViewImageDelegate {
    func setImage(image: UIImage?)
}

class ViewModelProtocol {
    
    var viewImageDelegate: ViewImageDelegate? = nil
    
    public func getImage() {
        
        let image = downloadImage()
        self.viewImageDelegate?.setImage(image: image)
        
    }
    
    private func downloadImage() -> UIImage? {
        
        return UIImage(named: "cat")
        
    }
    
}

