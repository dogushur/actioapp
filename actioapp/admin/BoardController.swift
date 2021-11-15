import UIKit
import paper_onboarding
import PTPopupWebView

class BoardController: UIViewController {
    
    override public var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .portrait
        }
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    fileprivate var items = [OnboardingItemInfo]()
    var itemsimage = [String]()
    
    var onboarding = PaperOnboarding()
    var skipButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        boardsetup()
        
    }
    
    var titles = ["Güncel etkinlikler","Haberdar olun","Yanlarında olun"]
    var texts = ["En güncel etkinlikleri takip edin","Size yakın olan etkinlikleri görün","Sevdiklerinizi en mutlu gününde yalnız bırakmayın"]
    
    func boardsetup(){
        for i in 0..<titles.count{
            itemsimage.append("logo3")
            self.items.append(OnboardingItemInfo(informationImage: UIImage(named: "logo3")!,
            title: "\(titles[i])",
            description: "\(texts[i])",
            pageIcon: UIImage(named: "boardpin")!,
            color: Appdata.yellow,
            titleColor: Appdata.pink,
            descriptionColor: Appdata.pink,
            titleFont: UIFont(name: "Avenir-Black", size: 24)!,
            descriptionFont: UIFont(name: "Avenir-Roman", size: 14)!
            ))
        }
        
        DispatchQueue.main.async {
            self.setupPaperOnboardingView()
        }
    }
    
    private func setupPaperOnboardingView() {
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = Appdata.yellow
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.backgroundColor = Appdata.yellow
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
        
        if(Appdata.device.isPhone){
            if(Appdata.device == .iPhone6sPlus || Appdata.device == .iPhone7Plus || Appdata.device == .iPhone6Plus || Appdata.device == .iPhone8Plus || Appdata.device == .simulator(.iPhone6sPlus) || Appdata.device == .simulator(.iPhone7Plus) || Appdata.device == .simulator(.iPhone6Plus) || Appdata.device == .simulator(.iPhone8Plus)){
                skipButton = UIButton(frame: CGRect(x:screenWidth-150,y:70,width:150,height:50))
            }else if(Appdata.device == .iPhoneX || Appdata.device == .iPhoneXS || Appdata.device == .iPhone11Pro || Appdata.device == .simulator(.iPhoneX) || Appdata.device == .simulator(.iPhoneXS) || Appdata.device == .simulator(.iPhone11Pro)){
                skipButton = UIButton(frame: CGRect(x:screenWidth-150,y:70,width:150,height:50))
            }else if(Appdata.device == .iPhone7 || Appdata.device == .iPhone6 || Appdata.device == .iPhone6s || Appdata.device == .iPhone8 || Appdata.device == .simulator(.iPhone7) || Appdata.device == .simulator(.iPhone6) || Appdata.device == .simulator(.iPhone6s) || Appdata.device == .simulator(.iPhone8)){
                skipButton = UIButton(frame: CGRect(x:screenWidth-150,y:70,width:150,height:50))
            }else if(Appdata.device == .iPhoneSE || Appdata.device == .iPhone5s || Appdata.device == .iPhone5 || Appdata.device == .iPhone5c || Appdata.device == .simulator(.iPhoneSE) || Appdata.device == .simulator(.iPhone5s) || Appdata.device == .simulator(.iPhone5) || Appdata.device == .simulator(.iPhone5c)){
                skipButton = UIButton(frame: CGRect(x:screenWidth-150,y:70,width:150,height:50))
            }else if(Appdata.device == .iPhoneXR || Appdata.device == .iPhoneXSMax || Appdata.device == .iPhone11 || Appdata.device == .iPhone11ProMax || Appdata.device == .simulator(.iPhoneXR) || Appdata.device == .simulator(.iPhoneXSMax) || Appdata.device == .simulator(.iPhone11) || Appdata.device == .simulator(.iPhone11ProMax)){
                skipButton = UIButton(frame: CGRect(x:screenWidth-150,y:70,width:150,height:50))
            }
        }else if(Appdata.device.isPad){
            skipButton = UIButton(frame: CGRect(x:screenWidth-150,y:70,width:150,height:50))
        }
        
        skipButton.setTitle("Devam et", for: .normal)
        skipButton.setTitleColor(Appdata.pink, for: .normal)
        skipButton.isHidden = true
        skipButton.titleLabel?.font = UIFont(name: "Avenir-Black", size: 20)!
        skipButton.layer.zPosition = 999
        skipButton.isUserInteractionEnabled = true
        skipButton.addTarget(self, action: #selector(skipfunc), for: .touchUpInside)
        view.addSubview(skipButton)
        view.bringSubviewToFront(skipButton)
        
    }
    
    @objc func skipfunc(sender:UIButton!){
        let style = PTPopupWebViewControllerStyle()
        style.titleBackgroundColor(Appdata.pink)
        style.titleForegroundColor(Appdata.white)
        style.backgroundColor(Appdata.pink)
        style.closeButtonHidden(true)
        
        let popupvc = PTPopupWebViewController()
        popupvc.popupView.URL(string: "\(Appdata.gizlilik_link)")
        popupvc.popupView.style(style)
        //popupvc.popupView.addButton(PTPopupWebViewButton(type: .close).title("Kapat").foregroundColor(UIColor.white))
        let handler = {
            popupvc.close()
            
            Appdata.user_data.set(true, forKey: "boarding_status")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                let sayfagecis = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! HomeController
                sayfagecis.modalPresentationStyle = .fullScreen
                self.present(sayfagecis, animated: false, completion: nil)
            })
        }
        popupvc.popupView.addButton(PTPopupWebViewButton(type: .custom).handler(handler).title("Kapat").foregroundColor(UIColor.white))
        popupvc.show()
    }
    
}

extension BoardController: PaperOnboardingDelegate {
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        skipButton.isHidden = index == items.count-1 ? false : true
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        let img = itemsimage[index]
        item.imageView?.image = UIImage(named: "\(img)")
    }
    
}

extension BoardController: PaperOnboardingDataSource {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return items[index]
    }
    
    func onboardingItemsCount() -> Int {
        return items.count
    }
    
}

