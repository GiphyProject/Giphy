//
//  StartViewController.swift
//  Giphy
//
//  Created by Стас on 03.05.2023.
//

import UIKit
import SnapKit

class GIPStartViewController: UIViewController {
    var viewModel: GIPStartViewViewModel?
    var coordinator: StartCoordinator?
    
    private let logoImage: UIImageView = {
        let logoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 256, height: 256))
        logoImage.image = UIImage(named: Asset.logo.name)
        return logoImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logoImage.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.animate()
        })
    }
    
    // MARK: - Amination method
    private func animate() {
        // Increase size
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.logoImage.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
        })
        
        // Fade away
        let animationDuration: TimeInterval = 1.5
        let logoAlpha: CGFloat = 0

        let logoAnimationCompletion: ((Bool) -> Void) = { [weak self] done in
            guard let self = self, done else { return }
            
            let viewController = GIPTabViewController()
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            
            self.present(viewController, animated: true)
        }

        UIView.animate(withDuration: animationDuration, animations: {
            self.logoImage.alpha = logoAlpha
        }, completion: logoAnimationCompletion)
    }
    
    // MARK: - Embed view
    private func embedView() {
        view.backgroundColor = .systemBackground
        view.addSubview(logoImage)
    }
}
