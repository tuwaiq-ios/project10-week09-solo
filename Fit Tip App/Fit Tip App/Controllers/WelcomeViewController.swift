//
//  ViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 17/04/1443 AH.
//

import UIKit
import Lottie

class WelcomeViewController: UIViewController {

    let welcomePages = [Welcome(imageName: "Fit_Tip_Logo",
                                topic: "Fit Tip",
                                description: "Fitness App"),
                        Welcome(imageName: "goal",
                                topic: "Goal",
                                description: "Chose your goal"),
                        Welcome(imageName: "mesure",
                                topic: "Mesurments",
                                description: "Enter your body mesurments"),
                        Welcome(imageName: "activity",
                                topic: "Activity",
                                description: "Check your calories, how many steps you walked"),
                        Welcome(imageName: "food",
                                topic: "Meals",
                                description: "Variety of meals that align with your goals")]
    
    var collectionView =  UICollectionView()
    var skipButton = UIButton(type: .system)
    var pageControl = UIPageControl()
    var slideAnimView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    func setupCollectionview(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(WelcomeCell.self, forCellWithReuseIdentifier: "cellId")
        let constraints = [
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupSkipButton(){
        view.addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitle("Skip", for: .normal)
        skipButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        skipButton.tintColor = ThemeColor.mainColor
        skipButton.addTarget(self, action: #selector(skipButtonPressed), for: .touchUpInside)
        let constraints = [
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func skipButtonPressed(){
        
        let indexPath = IndexPath(item: welcomePages.count - 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = welcomePages.count - 1
        goToSignInController()
    }
    
    func goToSignInController() {
        let transitionView = UIView(frame: CGRect(x: view.center.x, y: view.center.y, width: 100, height: 100))
        view.addSubview(transitionView)
        transitionView.layer.cornerRadius = 50
        transitionView.layer.masksToBounds = true
        let gradient = setupGradientLayer()
        gradient.frame = view.bounds
        transitionView.layer.insertSublayer(gradient, at: 0)
        let timer = Timer(timeInterval: 0.3, target: self, selector: #selector(self.animateLogo), userInfo: nil, repeats: false)
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            transitionView.transform = CGAffineTransform(scaleX: 20, y: 20)
            RunLoop.current.add(timer, forMode: .default)
        })
    }
    
    @objc private func animateLogo(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.center = CGPoint(x: view.center.x, y: view.center.y)
        imageView.image = UIImage(named: "Fit_Tip_Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = true
        view.addSubview(imageView)
        imageView.alpha = 0
        imageView.transform = CGAffineTransform(rotationAngle: 720)
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            imageView.transform = .identity
            imageView.alpha = 1
        }) { (true) in
            self.animateLogoLabel()
        }
    }
    
    @objc private func animateLogoLabel(){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.center = CGPoint(x: view.center.x, y: view.center.y + 150)
        label.font = UIFont(name: "Alata", size: 48)
        label.text = "Fit Tip"
        label.textAlignment = .center
        label.textColor = .white
        view.addSubview(label)
        label.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            label.transform = .identity
        }) { (true) in
            let controller = SignInViewController()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: false, completion: nil)
            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
}

extension WelcomeViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let xValue = targetContentOffset.pointee.x
        let pageNum = Int(xValue / view.frame.width)
        pageControl.currentPage = pageNum
        if pageNum != welcomePages.count - 1 {
            skipButton.isHidden = false
        }else{
            goToSignInController()
            skipButton.isHidden = true
        }
        if pageControl.currentPage > 0 { slideAnimView.isHidden = true } else { slideAnimView.isHidden = false }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return welcomePages.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! WelcomeCell
        let welcomePage = welcomePages[indexPath.row]
        cell.page = welcomePage
        cell.welcomeVC = self
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let welcomeCell = cell as! WelcomeCell
        welcomeCell.topicImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        welcomeCell.descriptionLabel.transform = CGAffineTransform(translationX: view.frame.origin.x + view.frame.width/2, y: 0)
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            welcomeCell.topicImage.transform = .identity
            welcomeCell.descriptionLabel.transform = .identity
        })
    }
    
}
