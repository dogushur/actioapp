import UIKit
import DeviceKit
import JGProgressHUD

struct Appdata {
    static var colorclear = UIColor.clear
    static var pink = UIColor("#FF1544")
    static var yellow = UIColor("#F7BD10")
    static var white = UIColor("#FFFFFF")
    static var black = UIColor("#000000")
    static var topbargray = UIColor("#666666")
    static var detailclosegray = UIColor("#707070")
    static var menuVC: MenuController = MenuController()
    static var device = Device.current
    static var user_data = UserDefaults.standard
    static var gizlilik_link = "http://covid19.ortakfikir.net/api/sozlesme/gizlilik.php"
    static var serviceurl = "http://api.actioapp.com/servis"
    static var hud = JGProgressHUD(style: .dark)
}
