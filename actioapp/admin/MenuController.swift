import UIKit

class MenuController: UIViewController {
    
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
    
    var menuview = UIView()
    var menubg = UIImageView()
    var menuin = UIView()
    var menubtn = UIButton()
    
    var menutags = ["home","action","empty","notification","account"]
    var menuicons = ["menuhome","menuaction","","menunotification","menuaccount"]
    var menutext = ["Anasayfa","Etkinlikler","","Bildirimler","Hesabım"]
    
    var menuiconview = [UIButton]()
    var menutextview = [UILabel]()
    
    var ilk_acilis = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Appdata.colorclear
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        if(Appdata.device.isPhone){
            if(Appdata.device == .iPhone6sPlus || Appdata.device == .iPhone7Plus || Appdata.device == .iPhone6Plus || Appdata.device == .iPhone8Plus || Appdata.device == .simulator(.iPhone6sPlus) || Appdata.device == .simulator(.iPhone7Plus) || Appdata.device == .simulator(.iPhone6Plus) || Appdata.device == .simulator(.iPhone8Plus)){
                
            }else if(Appdata.device == .iPhoneX || Appdata.device == .iPhoneXS || Appdata.device == .iPhone11Pro || Appdata.device == .simulator(.iPhoneX) || Appdata.device == .simulator(.iPhoneXS) || Appdata.device == .simulator(.iPhone11Pro)){
                menuview = UIView(frame: CGRect(x:0,y:screenHeight-135,width:screenWidth,height:135))
                menubg = UIImageView(frame: CGRect(x:0,y:0,width:menuview.frame.width,height:menuview.frame.height))
                menuin = UIView(frame: CGRect(x:0,y:(menuview.frame.height-65)-15,width:menuview.frame.width,height:65))
                
                let menucount = menutags.count
                let menuwidth = Int(menuin.frame.width)
                let menuheight = Int(menuin.frame.height)
                let menuitemsinglewidth = (menuwidth/menucount)
                
                for i in 0..<menucount{
                    let menuitem = UIView(frame: CGRect(x:i*menuitemsinglewidth,y:0,width:menuitemsinglewidth,height:menuheight))
                    menuitem.backgroundColor = UIColor.clear
                    menuin.addSubview(menuitem)
                    
                    let menuitemin = UIView(frame: CGRect(x:5,y:0,width:menuitem.frame.width-10,height:menuitem.frame.height))
                    menuitemin.backgroundColor = Appdata.colorclear
                    menuitem.addSubview(menuitemin)
                    
                    let menuicon = UIButton(frame: CGRect(x:15,y:0,width:menuitemin.frame.width-30,height:menuitemin.frame.height-30))
                    menuicon.setImage(UIImage(named: "\(menuicons[i])")?.withRenderingMode(.alwaysTemplate), for: .normal)
                    menuicon.imageView?.contentMode = .scaleAspectFit
                    menuicon.tintColor = Appdata.black
                    menuiconview.append(menuicon)
                    menuitemin.addSubview(menuicon)
                    
                    let menutitle = UILabel(frame: CGRect(x:0,y:menuitemin.frame.height-30,width:menuitemin.frame.width,height:30))
                    menutitle.backgroundColor = Appdata.colorclear
                    menutitle.text = "\(menutext[i])"
                    menutitle.textAlignment = .center
                    menutitle.textColor = Appdata.black
                    menutitle.font = UIFont(name: "Avenir-Black", size: 13)!
                    menutextview.append(menutitle)
                    menuitemin.addSubview(menutitle)
                    
                    let menubutton = UIButton(frame: CGRect(x:0,y:0,width:menuitemin.frame.width,height:menuitemin.frame.height))
                    menubutton.backgroundColor = Appdata.colorclear
                    menubutton.tag = i
                    menubutton.addTarget(self, action: #selector(menuitemclick), for: .touchUpInside)
                    menuitemin.addSubview(menubutton)
                }
                
                if(ilk_acilis == true){
                    let icon = menuiconview[0]
                    let text = menutextview[0]
                    
                    icon.tintColor = Appdata.pink
                    text.textColor = Appdata.pink
                }
                
                menubtn = UIButton(frame: CGRect(x:(menuview.frame.width/2)-40,y:20,width:80,height:80))
            }else if(Appdata.device == .iPhone7 || Appdata.device == .iPhone6 || Appdata.device == .iPhone6s || Appdata.device == .iPhone8 || Appdata.device == .simulator(.iPhone7) || Appdata.device == .simulator(.iPhone6) || Appdata.device == .simulator(.iPhone6s) || Appdata.device == .simulator(.iPhone8)){
                
            }else if(Appdata.device == .iPhoneSE || Appdata.device == .iPhone5s || Appdata.device == .iPhone5 || Appdata.device == .iPhone5c || Appdata.device == .simulator(.iPhoneSE) || Appdata.device == .simulator(.iPhone5s) || Appdata.device == .simulator(.iPhone5) || Appdata.device == .simulator(.iPhone5c)){
                
            }else if(Appdata.device == .iPhoneXR || Appdata.device == .iPhoneXSMax || Appdata.device == .iPhone11 || Appdata.device == .iPhone11ProMax || Appdata.device == .simulator(.iPhoneXR) || Appdata.device == .simulator(.iPhoneXSMax) || Appdata.device == .simulator(.iPhone11) || Appdata.device == .simulator(.iPhone11ProMax)){
                
            }
        }else if(Appdata.device.isPad){
            
        }
        
        menuview.layer.zPosition = 9000
        view.addSubview(menuview)
        
        menubg.image = UIImage(named: "menubg")
        menubg.contentMode = .scaleAspectFill
        menuview.addSubview(menubg)
        
        menuin.backgroundColor = Appdata.colorclear
        menuview.addSubview(menuin)
        
        menubtn.backgroundColor = Appdata.pink
        menubtn.clipsToBounds = true
        menubtn.layer.cornerRadius = menubtn.frame.height/2
        menubtn.setImage(UIImage(named: "pluswhite"), for: .normal)
        menubtn.imageView?.contentMode = .scaleAspectFit
        menubtn.addTarget(self, action: #selector(menubtnclick), for: .touchUpInside)
        menuview.addSubview(menubtn)
        
    }
    
    @objc func menuitemclick(sender:UIButton!){
        
        ilk_acilis = false
        
        let tag = sender.tag
        let menutag = "\(menutags[tag])"
        
        let menucount = menutags.count
        for i in 0..<menucount{
            let icon = menuiconview[i]
            let text = menutextview[i]
            
            if(tag == i){
                icon.tintColor = Appdata.pink
                text.textColor = Appdata.pink
            }else{
                icon.tintColor = Appdata.black
                text.textColor = Appdata.black
            }
        }
        
        if(menutag != "empty"){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            if(menutag == "home"){
                let view = storyboard.instantiateViewController(withIdentifier: "homeVC") as! HomeController
                appDelegate.window?.rootViewController = view
            }else if(menutag == "action"){
                let view = storyboard.instantiateViewController(withIdentifier: "actionsVC") as! ActionsController
                appDelegate.window?.rootViewController = view
            }else if(menutag == "notification"){
                let view = storyboard.instantiateViewController(withIdentifier: "notificationVC") as! NotificationController
                appDelegate.window?.rootViewController = view
            }else if(menutag == "account"){
                let view = storyboard.instantiateViewController(withIdentifier: "accountVC") as! AccountController
                appDelegate.window?.rootViewController = view
            }
        }
        
    }
    
    @objc func menubtnclick(sender:UIButton!){
        print("menubtn")
    }
    
}
