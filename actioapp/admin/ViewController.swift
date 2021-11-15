import UIKit
import UIColor_Hex_Swift
import AAViewAnimator

class ViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splashsetup()
        
    }
    
    var splashlogo = UIImageView()
    var applogo = UIImageView()
    
    func splashsetup(){
        
        view.backgroundColor = Appdata.pink
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        if(Appdata.device.isPhone){
            if(Appdata.device == .iPhone6sPlus || Appdata.device == .iPhone7Plus || Appdata.device == .iPhone6Plus || Appdata.device == .iPhone8Plus || Appdata.device == .simulator(.iPhone6sPlus) || Appdata.device == .simulator(.iPhone7Plus) || Appdata.device == .simulator(.iPhone6Plus) || Appdata.device == .simulator(.iPhone8Plus)){
                splashlogo = UIImageView(frame: CGRect(x:0,y:50,width:screenWidth,height:screenHeight-300))
                applogo = UIImageView(frame: CGRect(x:(screenWidth/2)-100,y:screenHeight-200,width:200,height:100))
            }else if(Appdata.device == .iPhoneX || Appdata.device == .iPhoneXS || Appdata.device == .iPhone11Pro || Appdata.device == .simulator(.iPhoneX) || Appdata.device == .simulator(.iPhoneXS) || Appdata.device == .simulator(.iPhone11Pro)){
                splashlogo = UIImageView(frame: CGRect(x:0,y:50,width:screenWidth,height:screenHeight-300))
                applogo = UIImageView(frame: CGRect(x:(screenWidth/2)-100,y:screenHeight-200,width:200,height:100))
            }else if(Appdata.device == .iPhone7 || Appdata.device == .iPhone6 || Appdata.device == .iPhone6s || Appdata.device == .iPhone8 || Appdata.device == .simulator(.iPhone7) || Appdata.device == .simulator(.iPhone6) || Appdata.device == .simulator(.iPhone6s) || Appdata.device == .simulator(.iPhone8)){
                splashlogo = UIImageView(frame: CGRect(x:0,y:50,width:screenWidth,height:screenHeight-300))
                applogo = UIImageView(frame: CGRect(x:(screenWidth/2)-100,y:screenHeight-200,width:200,height:100))
            }else if(Appdata.device == .iPhoneSE || Appdata.device == .iPhone5s || Appdata.device == .iPhone5 || Appdata.device == .iPhone5c || Appdata.device == .simulator(.iPhoneSE) || Appdata.device == .simulator(.iPhone5s) || Appdata.device == .simulator(.iPhone5) || Appdata.device == .simulator(.iPhone5c)){
                splashlogo = UIImageView(frame: CGRect(x:0,y:50,width:screenWidth,height:screenHeight-300))
                applogo = UIImageView(frame: CGRect(x:(screenWidth/2)-100,y:screenHeight-200,width:200,height:100))
            }else if(Appdata.device == .iPhoneXR || Appdata.device == .iPhoneXSMax || Appdata.device == .iPhone11 || Appdata.device == .iPhone11ProMax || Appdata.device == .simulator(.iPhoneXR) || Appdata.device == .simulator(.iPhoneXSMax) || Appdata.device == .simulator(.iPhone11) || Appdata.device == .simulator(.iPhone11ProMax)){
                splashlogo = UIImageView(frame: CGRect(x:0,y:50,width:screenWidth,height:screenHeight-300))
                applogo = UIImageView(frame: CGRect(x:(screenWidth/2)-100,y:screenHeight-200,width:200,height:100))
            }
        }else if(Appdata.device.isPad){
            splashlogo = UIImageView(frame: CGRect(x:0,y:50,width:screenWidth,height:screenHeight-300))
            applogo = UIImageView(frame: CGRect(x:(screenWidth/2)-100,y:screenHeight-200,width:200,height:100))
        }
        
        splashlogo.image = UIImage(named: "logo1")
        splashlogo.contentMode = .scaleAspectFill
        view.addSubview(splashlogo)
        
        applogo.image = UIImage(named: "logo2")
        applogo.contentMode = .scaleAspectFit
        applogo.isHidden = true
        view.addSubview(applogo)
        
        animation_setup()
        
    }
    
    func animation_setup(){
        splashlogo.aa_animate(duration: 0, springDamping: .none, animation: .zoomIn) { inAnimating, animView in
            if inAnimating {
                //AnimationStart
            }else {
                self.page_switch()
            }
        }
    }
    
    func page_switch(){
        applogo.aa_animate(duration: 1.2, springDamping: .slight, animation: .scale(rate: 1.2)) { inAnimating, animView in
            if inAnimating {
                self.applogo.isHidden = false
            }else {
                let boarding_status = Appdata.user_data.bool(forKey: "boarding_status")
                if(boarding_status == true){
                    let sayfagecis = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! HomeController
                    sayfagecis.modalPresentationStyle = .fullScreen
                    self.present(sayfagecis, animated: false, completion: nil)
                }else if(boarding_status == false){
                    let sayfagecis = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "boardVC") as! BoardController
                    sayfagecis.modalPresentationStyle = .fullScreen
                    self.present(sayfagecis, animated: false, completion: nil)
                }
            }
        }
    }

}

