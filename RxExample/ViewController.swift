//
//  ViewController.swift
//  RxExample
//
//  Created by Gilbert Gwizdała on 19/07/2017.
//
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    let viewModelRx = ViewModelRx()
    let disposeBag = DisposeBag()
    
    let viewModelProtocol = ViewModelProtocol()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Rx init :
        self.subscribeImage()
        
        //Protocol init :
        self.viewModelProtocol.viewImageDelegate = self
        
    }

    @IBAction func rxPressed(_ sender: Any) {
        viewModelRx.getImage()
    }
    @IBAction func protocolPressed(_ sender: Any) {
        viewModelProtocol.getImage()
    }


}

// MARK: - RxSwift and RxCocoa
extension ViewController {
    
    func subscribeImage() {
        
        self.viewModelRx.image
            .asObservable()
            .filter{ $0 != nil }
            .bind(to: self.imageView.rx.image)
            .addDisposableTo(self.disposeBag)
        
    }
}


// MARK: - Protocol
extension ViewController: ViewImageDelegate {
    
    func setImage(image: UIImage?) {
        
        if let image = image {
            self.imageView.image = image
        }
        
    }
    
}
