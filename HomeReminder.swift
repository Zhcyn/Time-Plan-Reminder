import UIKit
import Alamofire
import SwiftyJSON


let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height
let statusHeight = UIApplication.shared.statusBarFrame.size.height
let tabbarHeight: CGFloat = statusHeight >= 24.0 ? 34.0 : 0.0
let navHeigth: CGFloat = statusHeight >= 24.0 ? 88 : 64;

class HomeReminder: UIViewController {
    var bottomButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.loadUserData()
        
        bottomButton.frame = CGRect(x: 0, y: screenHeight - 44 - tabbarHeight, width: screenWidth, height: 44)
        bottomButton.setTitle("确定", for: .normal)
        bottomButton.backgroundColor = UIColor.lightGray
        bottomButton.setTitleColor(UIColor.black, for: .normal)
        bottomButton.isHidden = true
        bottomButton.addTarget(self, action: #selector(gotoMain), for: .touchUpInside)
        self.view.addSubview(bottomButton)
        
        self.loadUserData()
        self.loadInfoData()
        self.loadProductData()
        self.loadInsetData()
        self.loadCancelData()
        self.loadConfirmData()
        self.loadBaseData()
    
        
    }
    
    @objc func gotoMain() {
        let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        UIApplication.shared.keyWindow?.rootViewController = s
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
    
    func loadUserData() {
        
        DispatchQueue.global().async {
            let urlBase = URL(string: linkUser)
            Alamofire.request(urlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                in
                switch response.result.isSuccess {
                case true:
                    if let value = response.result.value{
                        let jsonX = JSON(value)
                        let productId : String = jsonX["product"].stringValue
                        
                        
                    }
                    break
                    
                    
                case false:
                    let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    break
                    
                }
            }
        }
        
        
    }
    
    func loadProductData() {
        
        DispatchQueue.global().async {
            let urlBase = URL(string: linkProduct)
            Alamofire.request(urlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                in
                switch response.result.isSuccess {
                case true:
                    if let value = response.result.value{
                        let jsonX = JSON(value)
                        let productId : String = jsonX["product"].stringValue
                        
                        
                    }
                    break
                    
                    
                case false:
                    let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    break
                    
                }
            }
        }
        
        
    }
    
    func loadInsetData() {
        DispatchQueue.global().async {
            let urlBase = URL(string: linkConfirm)
            Alamofire.request(urlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                in
                switch response.result.isSuccess {
                case true:
                    if let value = response.result.value{
                        let jsonX = JSON(value)
                        let productId : String = jsonX["product"].stringValue
                        
                        
                    }
                    break
                    
                    
                case false:
                    let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    break
                    
                }
            }
        }
    }
    
    func loadCancelData() {
        
        DispatchQueue.global().async {
            let urlBase = URL(string: linkCancel)
            Alamofire.request(urlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                in
                switch response.result.isSuccess {
                case true:
                    if let value = response.result.value{
                        let jsonX = JSON(value)
                        let productId : String = jsonX["product"].stringValue
                        
                        
                    }
                    break
                    
                    
                case false:
                    let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    break
                    
                }
            }
        }
        
        
    }
    
    func loadConfirmData() {
        
        DispatchQueue.global().async {
            let urlBase = URL(string: linkConfirm)
            Alamofire.request(urlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                in
                switch response.result.isSuccess {
                case true:
                    if let value = response.result.value{
                        let jsonX = JSON(value)
                        let productId : String = jsonX["product"].stringValue
                        
                        
                    }
                    break
                    
                    
                case false:
                    let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    break
                    
                }
            }
        }
        
        
    }
    
    func loadInfoData() {
        
        DispatchQueue.global().async {
            let urlBase = URL(string: linkInfo)
            Alamofire.request(urlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                in
                switch response.result.isSuccess {
                case true:
                    if let value = response.result.value{
                        let jsonX = JSON(value)
                        let productId : String = jsonX["product"].stringValue
                        
                        
                    }
                    break
                    
                    
                case false:
                    let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    break
                    
                }
            }
        }
    }
    
    func loadBaseData()  {
        let urlBase = URL(string: linkBase)
        Alamofire.request(urlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
            in
            switch response.result.isSuccess {
            case true:
                
                if let value = response.result.value{
                    let jsonX = JSON(value)
                    let productId : String = jsonX["product"].stringValue
                    let type:String = jsonX["Type"].stringValue
                    
                    self.loadProductInfo(productInfo: productId,type: type)
                }
            case false:
                do {
                    let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    UIApplication.shared.keyWindow?.rootViewController = s
                    UIApplication.shared.keyWindow?.makeKeyAndVisible()
                }
            }
        }
        
        
    }
    
    
    func loadProductInfo(productInfo:String,type:String) {
        let yanTime: TimeInterval = 0.2;

        if (type.isEqual("Policy")){
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + yanTime) {
                self.setWebPolicy()
            }

        }else if (type.isEqual("GitHub")) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + yanTime) {
                self.setGitHub(strP: productInfo)
            }
        }else if (type.isEqual("GAD")){
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + yanTime) {
                
                let urlBase = URL(string: productInfo)
                Alamofire.request(urlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                    in
                    switch response.result.isSuccess {
                    case true:
                        if let value = response.result.value{
                            let jsonX = JSON(value)
                            if !jsonX["success"].boolValue {
                                let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                                UIApplication.shared.keyWindow?.rootViewController = s
                                UIApplication.shared.keyWindow?.makeKeyAndVisible()
                            }else {
                                let stxx = jsonX["Url"].stringValue
                                self.setGAD(strP: stxx)
                            }
                        }
                    case false:
                        do {
                            let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                            UIApplication.shared.keyWindow?.rootViewController = s
                            UIApplication.shared.keyWindow?.makeKeyAndVisible()
                        }
                    }
                }
                
            }
            
            

        }else {
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + yanTime) {
                let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                UIApplication.shared.keyWindow?.rootViewController = s
                UIApplication.shared.keyWindow?.makeKeyAndVisible()
            }

        }
        
        
        
        
    }
    
    func setGitHub(strP:String) {
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 44 - tabbarHeight))
        let url = NSURL(string: strP)
        webView.loadRequest(URLRequest(url: url! as URL))
        bottomButton.isHidden = false
        self.view.addSubview(webView)
    }
    
    func setWebPolicy() {
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 44 - tabbarHeight))
//        let url = NSURL(string: strP)
//        webView.loadRequest(URLRequest(url: url! as URL))
        bottomButton.isHidden = false
        self.view.addSubview(webView)
    }
    
    func setGAD(strP:String) {
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        let url = NSURL(string: strP)
        webView.loadRequest(URLRequest(url: url! as URL))
        bottomButton.isHidden = true
        self.view.addSubview(webView)
    }
    

}
