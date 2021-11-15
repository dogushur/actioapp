import UIKit

class HomeController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pagesetup()
        
    }
    
    var pageview = UIView()
    
    func pagesetup(){
        
        view.backgroundColor = Appdata.white
        
        let menuview = Appdata.menuVC.view
        menuview?.layer.zPosition = 9999
        view.addSubview(menuview!)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        if(Appdata.device.isPhone){
            if(Appdata.device == .iPhone6sPlus || Appdata.device == .iPhone7Plus || Appdata.device == .iPhone6Plus || Appdata.device == .iPhone8Plus || Appdata.device == .simulator(.iPhone6sPlus) || Appdata.device == .simulator(.iPhone7Plus) || Appdata.device == .simulator(.iPhone6Plus) || Appdata.device == .simulator(.iPhone8Plus)){
                
            }else if(Appdata.device == .iPhoneX || Appdata.device == .iPhoneXS || Appdata.device == .iPhone11Pro || Appdata.device == .simulator(.iPhoneX) || Appdata.device == .simulator(.iPhoneXS) || Appdata.device == .simulator(.iPhone11Pro)){
                pageview = UIView(frame: CGRect(x:0,y:0,width:screenWidth,height:screenHeight-90))
            }else if(Appdata.device == .iPhone7 || Appdata.device == .iPhone6 || Appdata.device == .iPhone6s || Appdata.device == .iPhone8 || Appdata.device == .simulator(.iPhone7) || Appdata.device == .simulator(.iPhone6) || Appdata.device == .simulator(.iPhone6s) || Appdata.device == .simulator(.iPhone8)){
                
            }else if(Appdata.device == .iPhoneSE || Appdata.device == .iPhone5s || Appdata.device == .iPhone5 || Appdata.device == .iPhone5c || Appdata.device == .simulator(.iPhoneSE) || Appdata.device == .simulator(.iPhone5s) || Appdata.device == .simulator(.iPhone5) || Appdata.device == .simulator(.iPhone5c)){
                
            }else if(Appdata.device == .iPhoneXR || Appdata.device == .iPhoneXSMax || Appdata.device == .iPhone11 || Appdata.device == .iPhone11ProMax || Appdata.device == .simulator(.iPhoneXR) || Appdata.device == .simulator(.iPhoneXSMax) || Appdata.device == .simulator(.iPhone11) || Appdata.device == .simulator(.iPhone11ProMax)){
                
            }
        }else if(Appdata.device.isPad){
            
        }
        
        pageview.backgroundColor = Appdata.white
        pageview.layer.zPosition = 9
        view.addSubview(pageview)
        
    }
    
}

