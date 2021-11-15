import UIKit
import WebKit
import FontAwesome_swift

class ActionsController: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler, UIScrollViewDelegate {
    
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
        
        pagesetup()
        
    }
    
    var pageview = UIView()
    var pagein = UIView()
    var pagetop = UIView()
    var pagetopleft = UIView()
    var pageicon = UIImageView()
    var pagetopcenter = UIView()
    var pagetitle = UILabel()
    var pagetopright = UIView()
    var pagetoprightone = UIView()
    var pagetoprighttwo = UIView()
    var pagetoponebtn = UIButton()
    var pagetoptwobtn = UIButton()
    
    var pagedetail = UIView()
    
    var actionsview = WKWebView()
    var actionsviewFile : String!
    
    var actiondetail = UIView()
    var actiondetailview = WKWebView()
    var actiondetailviewFile : String!
    var actiondetailbasla = String()
    
    var actiondetailtop = UIView()
    var actionimage = UIImageView()
    var actionimagefiltre = UIView()
    var actionimageust = UIView()
    var actionimageustbtn1 = UIButton()
    var actionimageustbtn2 = UIButton()
    var actionimageustbtn3 = UIButton()
    
    var actiondetailbottom = UIView()
    var actiondetailbottomtarih = UILabel()
    var actiondetailbottomtitle = UILabel()
    
    var blurEffect = UIBlurEffect()
    var blurEffectView = UIVisualEffectView()
    
    func pagesetup(){
        
        view.backgroundColor = Appdata.white
        
        let menuview = Appdata.menuVC.view
        menuview?.layer.zPosition = 9000
        view.addSubview(menuview!)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        if(Appdata.device.isPhone){
            if(Appdata.device == .iPhone6sPlus || Appdata.device == .iPhone7Plus || Appdata.device == .iPhone6Plus || Appdata.device == .iPhone8Plus || Appdata.device == .simulator(.iPhone6sPlus) || Appdata.device == .simulator(.iPhone7Plus) || Appdata.device == .simulator(.iPhone6Plus) || Appdata.device == .simulator(.iPhone8Plus)){
                
            }else if(Appdata.device == .iPhoneX || Appdata.device == .iPhoneXS || Appdata.device == .iPhone11Pro || Appdata.device == .simulator(.iPhoneX) || Appdata.device == .simulator(.iPhoneXS) || Appdata.device == .simulator(.iPhone11Pro)){
                pageview = UIView(frame: CGRect(x:0,y:0,width:screenWidth,height:screenHeight-90))
                pagein = UIView(frame: CGRect(x:20,y:30,width:pageview.frame.width-40,height:pageview.frame.height-30))
                pagetop = UIView(frame: CGRect(x:0,y:0,width:pagein.frame.width,height:70))
                pagetopleft = UIView(frame: CGRect(x:0,y:0,width:100,height:pagetop.frame.height))
                pageicon = UIImageView(frame: CGRect(x:0,y:0,width:pagetopleft.frame.width,height:pagetopleft.frame.height))
                pagetopcenter = UIView(frame: CGRect(x:pagetopleft.frame.width,y:0,width:pagetop.frame.width-pagetopleft.frame.width,height:pagetop.frame.height))
                pagetitle = UILabel(frame: CGRect(x:20,y:0,width:pagetopcenter.frame.width-20,height:pagetopcenter.frame.height))
                pagetopright = UIView(frame: CGRect(x:pagetop.frame.width-60,y:0,width:70,height:pagetop.frame.height))
                pagetoprightone = UIView(frame: CGRect(x:0,y:0,width:pagetopright.frame.width/2,height:pagetopright.frame.height))
                pagetoprighttwo = UIView(frame: CGRect(x:pagetopright.frame.width/2,y:0,width:pagetopright.frame.width/2,height:pagetopright.frame.height))
                pagetoponebtn = UIButton(frame: CGRect(x:0,y:0,width:pagetoprightone.frame.width,height:pagetoprightone.frame.height))
                pagetoptwobtn = UIButton(frame: CGRect(x:0,y:0,width:pagetoprighttwo.frame.width,height:pagetoprighttwo.frame.height))
                
                pagedetail = UIView(frame: CGRect(x:0,y:pagetop.frame.height,width:pagein.frame.width,height:pagein.frame.height-pagetop.frame.height))
                actionsview = WKWebView(frame: CGRect(x: 0, y: 0, width: pagedetail.frame.width, height: pagedetail.frame.height))
                
                actiondetail = UIView(frame: CGRect(x:0,y:0,width:screenWidth,height:screenHeight))
                actiondetailview = WKWebView(frame: CGRect(x: 0, y: 0, width: actiondetail.frame.width, height: actiondetail.frame.height))
                actiondetailbasla = "<div style=\"margin-top:255px;\" class=\"actiondetail\"><div class=\"container\"><div class=\"row\">"
                actiondetailtop = UIView(frame: CGRect(x: 0, y: -45, width: actiondetailview.frame.width, height: 300))
                actionimage = UIImageView(frame: CGRect(x: 0, y: 0, width: actiondetailtop.frame.width, height: actiondetailtop.frame.height))
                actionimagefiltre = UIView(frame: CGRect(x: 0, y: 0, width: actionimage.frame.width, height: actionimage.frame.height))
                actionimageust = UIButton(frame: CGRect(x: 20, y: 40, width: actiondetail.frame.width-40, height: 30))
                actionimageustbtn1 = UIButton(frame: CGRect(x: 0, y: 0, width: actionimageust.frame.height, height: actionimageust.frame.height))
                actionimageustbtn2 = UIButton(frame: CGRect(x: actionimageustbtn1.frame.width+10, y: 0, width: actionimageust.frame.height, height: actionimageust.frame.height))
                actionimageustbtn3 = UIButton(frame: CGRect(x: actionimageust.frame.width-actionimageust.frame.height, y: 0, width: actionimageust.frame.height, height: actionimageust.frame.height))
                
                actiondetailbottom = UIView(frame: CGRect(x: 20, y: actionimagefiltre.frame.height-80, width: actionimagefiltre.frame.width-40, height: 60))
                actiondetailbottomtarih = UILabel(frame: CGRect(x: 0, y: 0, width: actiondetailbottom.frame.width, height: 20))
                actiondetailbottomtitle = UILabel(frame: CGRect(x: 0, y: actiondetailbottomtarih.frame.height, width: actiondetailbottom.frame.width, height: 40))
            }else if(Appdata.device == .iPhone7 || Appdata.device == .iPhone6 || Appdata.device == .iPhone6s || Appdata.device == .iPhone8 || Appdata.device == .simulator(.iPhone7) || Appdata.device == .simulator(.iPhone6) || Appdata.device == .simulator(.iPhone6s) || Appdata.device == .simulator(.iPhone8)){
                
            }else if(Appdata.device == .iPhoneSE || Appdata.device == .iPhone5s || Appdata.device == .iPhone5 || Appdata.device == .iPhone5c || Appdata.device == .simulator(.iPhoneSE) || Appdata.device == .simulator(.iPhone5s) || Appdata.device == .simulator(.iPhone5) || Appdata.device == .simulator(.iPhone5c)){
                
            }else if(Appdata.device == .iPhoneXR || Appdata.device == .iPhoneXSMax || Appdata.device == .iPhone11 || Appdata.device == .iPhone11ProMax || Appdata.device == .simulator(.iPhoneXR) || Appdata.device == .simulator(.iPhoneXSMax) || Appdata.device == .simulator(.iPhone11) || Appdata.device == .simulator(.iPhone11ProMax)){
                
            }
        }else if(Appdata.device.isPad){
            
        }
        
        pageview.layer.zPosition = 1
        view.addSubview(pageview)
        
        pageview.addSubview(pagein)
        
        pagein.addSubview(pagetop)
        
        pagetop.addSubview(pagetopleft)
        
        pageicon.image = UIImage(named: "logo4")
        pageicon.contentMode = .scaleAspectFit
        pagetopleft.addSubview(pageicon)
        
        pagetop.addSubview(pagetopcenter)
        
        pagetitle.text = "Etkinlikler"
        pagetitle.textColor = Appdata.black
        pagetitle.textAlignment = .left
        pagetitle.font = UIFont(name: "Avenir-Roman", size: 20)!
        pagetopcenter.addSubview(pagetitle)
        
        pagetop.addSubview(pagetopright)
        
        pagetopright.addSubview(pagetoprightone)
        
        pagetoponebtn.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysTemplate), for: .normal)
        pagetoponebtn.imageView?.contentMode = .scaleAspectFit
        pagetoponebtn.tintColor = Appdata.topbargray
        pagetoponebtn.tag = 0
        pagetoponebtn.addTarget(self, action: #selector(pagetopbarclick), for: .touchUpInside)
        pagetoprightone.addSubview(pagetoponebtn)
        
        pagetopright.addSubview(pagetoprighttwo)
        
        pagetoptwobtn.setImage(UIImage(named: "tune")?.withRenderingMode(.alwaysTemplate), for: .normal)
        pagetoptwobtn.imageView?.contentMode = .scaleAspectFit
        pagetoptwobtn.tintColor = Appdata.topbargray
        pagetoptwobtn.tag = 1
        pagetoptwobtn.addTarget(self, action: #selector(pagetopbarclick), for: .touchUpInside)
        pagetoprighttwo.addSubview(pagetoptwobtn)
        
        pagetop.aa_animate(duration: 0.7, animation: .zoomIn)
        
        //
        
        pagedetail.backgroundColor = Appdata.colorclear
        pagein.addSubview(pagedetail)
        
        actionsview.configuration.userContentController.add(self, name: "actionclick")
        actionsview.navigationDelegate = self
        actionsview.uiDelegate = self
        actionsview.scrollView.delegate = self
        actionsview.backgroundColor = Appdata.colorclear
        actionsview.scrollView.backgroundColor = Appdata.colorclear
        actionsview.scrollView.showsHorizontalScrollIndicator = false
        actionsview.scrollView.showsVerticalScrollIndicator = false
        pagedetail.addSubview(actionsview)
        
        //
        
        actiondetail.layer.zPosition = 9100
        actiondetail.backgroundColor = Appdata.colorclear
        //actiondetail.isHidden = true
        //view.addSubview(actiondetail)
        
        actiondetailview.configuration.userContentController.add(self, name: "devamokuclick")
        actiondetailview.configuration.userContentController.add(self, name: "haritadagosterclick")
        actiondetailview.configuration.userContentController.add(self, name: "oturmaplaniclick")
        actiondetailview.configuration.userContentController.add(self, name: "satinalclick")
        actiondetailview.navigationDelegate = self
        actiondetailview.uiDelegate = self
        actiondetailview.scrollView.delegate = self
        actiondetailview.backgroundColor = Appdata.colorclear
        actiondetailview.scrollView.backgroundColor = Appdata.white
        actiondetailview.scrollView.showsHorizontalScrollIndicator = false
        actiondetailview.scrollView.showsVerticalScrollIndicator = false
        actiondetailview.isOpaque = false
        actiondetail.addSubview(actiondetailview)
        
        actiondetailtop.backgroundColor = Appdata.colorclear
        actiondetailview.scrollView.addSubview(actiondetailtop)
        
        actionimage.backgroundColor = Appdata.colorclear
        actionimage.contentMode = .scaleAspectFill
        actiondetailtop.addSubview(actionimage)
        
        actionimagefiltre.backgroundColor = Appdata.black.withAlphaComponent(0.40)
        actionimage.addSubview(actionimagefiltre)
        
        actionimageust.backgroundColor = Appdata.colorclear
        actiondetail.addSubview(actionimageust)
        
        actionimageustbtn1.backgroundColor = Appdata.colorclear
        actionimageustbtn1.titleLabel?.font = UIFont.fontAwesome(ofSize: 30, style: .solid)
        actionimageustbtn1.setTitle(String.fontAwesomeIcon(name: .shareAlt), for: .normal)
        actionimageustbtn1.setTitleColor(Appdata.white, for: .normal)
        actionimageustbtn1.tag = 1
        actionimageustbtn1.addTarget(self, action: #selector(actionimageustclick), for: .touchUpInside)
        actionimageust.addSubview(actionimageustbtn1)
        
        actionimageustbtn2.backgroundColor = Appdata.colorclear
        actionimageustbtn2.titleLabel?.font = UIFont.fontAwesome(ofSize: 30, style: .solid)
        actionimageustbtn2.setTitle(String.fontAwesomeIcon(name: .heart), for: .normal)
        actionimageustbtn2.setTitleColor(Appdata.white, for: .normal)
        actionimageustbtn2.tag = 2
        actionimageustbtn2.addTarget(self, action: #selector(actionimageustclick), for: .touchUpInside)
        actionimageust.addSubview(actionimageustbtn2)
        
        actionimageustbtn3.backgroundColor = Appdata.colorclear
        actionimageustbtn3.titleLabel?.font = UIFont.fontAwesome(ofSize: 30, style: .solid)
        actionimageustbtn3.setTitle(String.fontAwesomeIcon(name: .timesCircle), for: .normal)
        actionimageustbtn3.setTitleColor(Appdata.white, for: .normal)
        actionimageustbtn3.tag = 3
        actionimageustbtn3.addTarget(self, action: #selector(actionimageustclick), for: .touchUpInside)
        actionimageust.addSubview(actionimageustbtn3)
        
        actiondetailbottom.backgroundColor = Appdata.colorclear
        actionimagefiltre.addSubview(actiondetailbottom)
        
        actiondetailbottomtarih.backgroundColor = Appdata.colorclear
        actiondetailbottomtarih.textColor = Appdata.white
        actiondetailbottomtarih.textAlignment = .left
        actiondetailbottomtarih.font = UIFont(name: "Avenir-Roman", size: 20)!
        actiondetailbottom.addSubview(actiondetailbottomtarih)
        
        actiondetailbottomtitle.backgroundColor = Appdata.colorclear
        actiondetailbottomtitle.textColor = Appdata.white
        actiondetailbottomtitle.textAlignment = .left
        actiondetailbottomtitle.font = UIFont(name: "Avenir-Black", size: 30)!
        actiondetailbottom.addSubview(actiondetailbottomtitle)
        
        blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = actionimagefiltre.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.95
        blurEffectView.isHidden = true
        actionimagefiltre.addSubview(blurEffectView)
        
        //
        
        Appdata.hud.textLabel.text = "Yükleniyor"
        Appdata.hud.layer.zPosition = 9999
        
        //
        
        getactions()
        
    }
    
    var say = 0

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let y = scrollView.contentOffset.y
        print("y scroll:\(y)")
        
        if y <= -140 {
            say = say + 1
            if(say > 4){
                self.actiondetail.aa_animate(duration: 0.5, animation: .toFade)
                self.actiondetail.isHidden = true
                self.actiondetail.removeFromSuperview()
                self.actionimage.image = nil
                self.actiondetailbottomtarih.text = ""
                self.actiondetailbottomtitle.text = ""
                self.blurEffectView.isHidden = true
            }
        }
        
        if y >= 100 {
            say = say + 1
            if(say > 4){
                blurEffectView.isHidden = false
                blurEffectView.contentView.aa_animate(duration: 0.5, animation: .zoomIn)
                
                actionimageust.isHidden = true
            }
        }else{
            blurEffectView.isHidden = true
            
            actionimageust.isHidden = false
        }
    }
    
    @objc func actionimageustclick(sender:UIButton!){
        let tag = sender.tag
        
        if(tag == 1){
            print("paylas")
        }else if(tag == 2){
            print("favori")
        }else if(tag == 3){
            etkinlik_detay_kapat()
        }
    }
    
    @objc func pagetopbarclick(sender:UIButton!){
        let tag = sender.tag
        
        if(tag == 0){
            print("search")
        }else if(tag == 1){
            print("settings")
        }
    }
    
    var action_img = ["a1.jpg","a6.jpg","a3.jpg","a4.jpg","a5.jpg","a2.jpg","a1.jpg","a2.jpg"]
    
    func getactions(){
        //Appdata.hud.show(in: view)
        //getaction
        DispatchQueue.main.async {
            self.createactions()
        }
    }
    
    func createactions(){
        guard let actionsHtml = Bundle.main.path(forResource: "Actions", ofType: "html", inDirectory: nil) else {
            return
        }
        self.actionsviewFile = try! String(contentsOfFile: actionsHtml, encoding: String.Encoding.utf8)
        
        var actions = ""
        
        var sira = 0
        for i in 0..<action_img.count{
            
            let resim = "\(action_img[i])"
            
            if(sira == 0 || sira == 1){
                let action_html = "<div onclick='javascript:clickaction(this,\"\(i)\");' class=\"animated zoomIn action-item buyuk col-12\"><div class=\"action-item-ic\"><img src=\"\(resim)\"><div class=\"action-item-text\"><div class=\"tarih\">10 Nis,Cuma</div><div class=\"baslik\">Doğuş Hür</div><div class=\"mekan\">Picasso STK Sapanca</div></div></div></div>"
                actions.append(action_html)
                
                sira = sira + 1
            }else if(sira == 2){
                let action_html = "<div onclick='javascript:clickaction(this,\"\(i)\");' class=\"animated fadeInLeft action-item kucuk sol col-6\"><div class=\"action-item-ic\"><img src=\"\(resim)\"><div class=\"action-item-text\"><div class=\"tarih\">10 Nis,Cuma</div><div class=\"baslik\">Doğuş Hür</div></div></div></div>"
                actions.append(action_html)
                
                sira = sira + 1
            }else if(sira == 3){
                let action_html = "<div onclick='javascript:clickaction(this,\"\(i)\");' class=\"animated fadeInRight action-item kucuk sag col-6\"><div class=\"action-item-ic\"><img src=\"\(resim)\"><div class=\"action-item-text\"><div class=\"tarih\">10 Nis,Cuma</div><div class=\"baslik\">Doğuş Hür</div></div></div></div>"
                actions.append(action_html)
                
                sira = 0
            }
            
        }
        
        let html = self.actionsviewFile.replacingOccurrences(of: "##ACTIONS##", with: actions)
        self.actionsview.loadHTMLString(html, baseURL: URL(fileURLWithPath: Bundle.main.bundlePath))
        
        //Appdata.hud.dismiss(afterDelay: 3)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "actionclick" {
            let sentData = message.body as! Dictionary<String, String>
            let msg:String? = sentData["message"]
            
            let sira = Int(msg!)
            
            etkinlik_detay_ac(s:sira!)
        }else if message.name == "devamokuclick" {
            let sentData = message.body as! Dictionary<String, String>
            let msg:String? = sentData["message"]
            
            let sira = Int(msg!)
            
            let aciklama = "Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir. Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir."
            let alert = UIAlertController(style: .actionSheet)
            alert.addTextViewer(text: .text(aciklama))
            alert.addAction(title: "Kapat", style: .cancel)
            alert.show()
        }else if message.name == "haritadagosterclick" {
            let sentData = message.body as! Dictionary<String, String>
            let msg:String? = sentData["message"]
            
            let sira = Int(msg!)
            print("haritada goster")
        }else if message.name == "oturmaplaniclick" {
            let sentData = message.body as! Dictionary<String, String>
            let msg:String? = sentData["message"]
            
            let sira = Int(msg!)
            print("oturma plani")
        }else if message.name == "satinalclick" {
            let sentData = message.body as! Dictionary<String, String>
            let msg:String? = sentData["message"]
            
            let sira = Int(msg!)
            print("satin al")
        }
    }
    
    func etkinlik_detay_kapat(){
        DispatchQueue.main.async {
            self.actiondetail.aa_animate(duration: 0.5, springDamping: .none, animation: .toFade) { inAnimating, animView in
                if inAnimating {
                    //AnimationStart
                }else {
                    self.actiondetail.isHidden = true
                    self.actiondetail.removeFromSuperview()
                    self.actionimage.image = nil
                    self.actiondetailbottomtarih.text = ""
                    self.actiondetailbottomtitle.text = ""
                    self.blurEffectView.isHidden = true
                }
            }
        }
    }
    
    func etkinlik_detay_ac(s:Int){
        DispatchQueue.main.async {
            self.actiondetail.isHidden = false
            self.view.addSubview(self.actiondetail)
            
            self.actiondetail.aa_animate(duration: 0.5, animation: .zoomIn)
            self.actiondetail.aa_animate(duration: 0, springDamping: .none, animation: .fromFade) { inAnimating, animView in
                if inAnimating {
                    //AnimationStart
                }else {
                    self.getactiondetail(sira:s)
                }
            }
        }
    }
    
    var sponsor_img = ["sp1.png","sp2.png","sp3.png","sp4.png","sp5.png","sp6.png"]
    var kategoriler = ["Kategori 1":"420","Kategori 2":"375","Kategori 3":"110"]
    
    func getactiondetail(sira:Int){
        DispatchQueue.main.async {
            let resim = self.action_img[sira]
            self.actionimage.image = UIImage(named: "\(resim)")
            
            let tarih = "23 Nis, Pazar"
            self.actiondetailbottomtarih.text = "\(tarih)"
            
            let baslik = "Doğuş Hür"
            self.actiondetailbottomtitle.text = "\(baslik)"
        }
        
        //Appdata.hud.show(in: view)
        //getactiondetail
        DispatchQueue.main.async {
            self.etkinlikdetaycreate(s:sira)
        }
    }
    
    func etkinlikdetaycreate(s:Int){
        guard let actionsdetailHtml = Bundle.main.path(forResource: "Actiondetail", ofType: "html", inDirectory: nil) else {
            return
        }
        self.actiondetailviewFile = try! String(contentsOfFile: actionsdetailHtml, encoding: String.Encoding.utf8)
        
        var actiondetail = ""
        actiondetail.append(actiondetailbasla)
        
        //
            let aciklama = "Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır."
            let aciklama_html = "<div onclick='javascript:clickdevamoku(this,\"\(s)\");' class=\"detayitem aciklama etkinlik col-12\">\(aciklama)<div class=\"aciklamafiltre\"></div></div>"
            actiondetail.append(aciklama_html)
        //
        
        //
            let devaminioku_html = "<div onclick='javascript:clickdevamoku(this,\"\(s)\");' class=\"devaminioku col-12\"><i class=\"fas fa-arrow-down\"></i> Devamını oku</div>"
            actiondetail.append(devaminioku_html)
        //
        
        //
            var sponsor_detay = ""
            var sponsor_sayi = 0
            var sponsor_padding = ""
            for i in 0..<sponsor_img.count{
                if(sponsor_sayi == 0){
                    sponsor_padding = "padding-left:0px;padding-right:2px;"
                    sponsor_sayi = sponsor_sayi + 1
                }else if(sponsor_sayi == 1){
                    sponsor_padding = "padding-left:0px;padding-right:0px;"
                    sponsor_sayi = sponsor_sayi + 1
                }else if(sponsor_sayi == 2){
                    sponsor_padding = "padding-left:2px;padding-right:0px;"
                    sponsor_sayi = 0
                }
                let resim = "\(sponsor_img[i])"
                let sponsor_tek = "<div style=\"\(sponsor_padding)\" class=\"sponsortek col-4\"><div class=\"sponsortek-ic\"><img src=\"\(resim)\"></div></div>"
                sponsor_detay.append(sponsor_tek)
            }
            let sponsorlar_html = "<div class=\"detayitem sponsor col-12\"><div class=\"detayitemust\"><i class=\"fas fa-american-sign-language-interpreting\"></i> Sponsorlar</div><div class=\"detayitemalt\">\(sponsor_detay)</div></div>"
            actiondetail.append(sponsorlar_html)
        //
        
        //
            let etiket = "#konser #ortakfikir #otom #mepsa #seft"
            let etiketler_html = "<div class=\"detayitem etiket col-12\"><div class=\"detayitemust\"><i class=\"fab fa-slack-hash\"></i> Etiketler</div><div class=\"detayitemalt\">\(etiket)</div></div>"
            actiondetail.append(etiketler_html)
        //
        
        //
            let tarih = "23 Nis, Pazar"
            let tarih_html = "<div class=\"detayitem tarih col-12\"><div class=\"detayitemust\"><i class=\"far fa-calendar-alt\"></i> Tarih</div><div class=\"detayitemalt\">\(tarih)</div></div>"
            actiondetail.append(tarih_html)
        //
        
        //
            let mekan = "Ortakfikir Bilgi Teknoloji Hizmetleri ve Danışmanlık"
            let adres = "İstiklal Mahallesi Örer Sokak No: 1 Serdivan / SAKARYA"
            let mekan_html = "<div onclick='javascript:clickharitadagoster(this,\"\(s)\");' class=\"detayitem mekan col-12\"><div class=\"detayitemust\"><i class=\"far fa-building\"></i> Mekan</div><div class=\"detayitemalt\"><div class=\"mekantext\">\(mekan)</div><div class=\"adrestext\">\(adres)</div></div><div class=\"haritadagoster\"><i class=\"fas fa-location-arrow\"></i> Yol tarifi al</div></div>"
            actiondetail.append(mekan_html)
        //
        
        //
            let oturmaplani = "oturmaplani.png"
            let oturmaplani_html = "<div class=\"detayitem oturmaplani col-12\"><div class=\"detayitemust\"><i class=\"fas fa-crosshairs\"></i> Oturma Planı</div><div onclick='javascript:clickoturmaplani(this,\"\(s)\");' class=\"detayitemalt\"><img src=\"\(oturmaplani)\"></div></div>"
            actiondetail.append(oturmaplani_html)
        //
        
        //
            var kategoriler_detay = ""
            let kategorikeys = Array(kategoriler.keys)
            let kategorivals = Array(kategoriler.values)
        
            for i in 0..<kategorikeys.count{
                let kategorikey = "\(kategorikeys[i])"
                let kategorival = "\(kategorivals[i])"
                
                let kategori_tek = "<div class=\"kategoritek\"><div class=\"kategoriteksol col-6\">\(kategorikey)</div><div class=\"kategoriteksag col-6\">\(kategorival) ₺</div></div>"
                kategoriler_detay.append(kategori_tek)
            }
            let kategoriler_html = "<div class=\"detayitem kategoriler col-12\"><div class=\"detayitemust\"><i class=\"fas fa-layer-group\"></i> Kategoriler</div><div class=\"detayitemalt\">\(kategoriler_detay)</div></div>"
            actiondetail.append(kategoriler_html)
        //
        
        //
            let uyarilar = "• Bankamızın ismi ve logosu kullanılarak; kişisel bilgileriniz ile kredi kartı ve hesap bilgilerinizi, şifrelerinizi talep eden e-posta ve SMS’lere kesinlikle cevap vermeyiniz.<br>• Bankamız tarafından arandığı izlenimi yaratarak ya da sahte sosyal medya hesapları üzerinden dolandırıcılık amaçlı yapılan reklam ve duyurulara, sigorta/dosya masrafı/kart aidatı iadesi, kredi verme gibi çeşitli vaatlere  itibar etmeyiniz.<br>• Bankamız telefonla ya da e-posta yoluyla hiçbir işlemde şifre istememektedir. Şifre ve parolanızı kimseyle paylaşmayınız."
            let uyarilar_html = "<div class=\"detayitem uyarilar col-12\"><div class=\"detayitemust\"><i class=\"fas fa-exclamation-circle\"></i> Önemli Uyarılar</div><div class=\"detayitemalt\">\(uyarilar)</div></div>"
            actiondetail.append(uyarilar_html)
        //
        
        //
            let islemyap = "<div onclick='javascript:clicksatinal(this,\"\(s)\");' class=\"islembtn\"><i class=\"fas fa-ticket-alt\"></i> Satın Al</div>"
            let islemyap_html = "<div class=\"detayitem islemyap col-12\"><div class=\"detayitemalt\">\(islemyap)</div></div>"
            actiondetail.append(islemyap_html)
        //
        
        let actiondetailbitir = "</div></div></div>"
        actiondetail.append(actiondetailbitir)
        let html = self.actiondetailviewFile.replacingOccurrences(of: "##ACTIONDETAIL##", with: actiondetail)
        self.actiondetailview.loadHTMLString(html, baseURL: URL(fileURLWithPath: Bundle.main.bundlePath))
        
        //Appdata.hud.dismiss(afterDelay: 3)
    }
    
}
