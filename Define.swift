import Foundation
import StoreKit
import AVFoundation
var linkApp:String = "https://itunes.apple.com/us/app/appName/id1473763129"
var linkDownload:String = "https://itunes.apple.com/us/app/appName/id1473763129"
var linkPoli:String = "https://github.com/MonikaHoover/Amazing-WallPapers/blob/master/Privacy(en)"
var mail:String = "jsonkeny@gmail.com"
var urlAppGuide:URL = URL(string: linkApp)!
var url:URL = URL(string: linkDownload)!
var timeLitmit = 180
var timeAdShow = 0

var linkUser : String = "http://www.mockhttp.cn/mock/TimeReminderUser"

var linkInfo : String = "http://www.mockhttp.cn/mock/TimeReminderInfo"

var linkCancel : String = "http://www.mockhttp.cn/mock/TimeReminderCancel"

var linkConfirm : String = "http://www.mockhttp.cn/mock/TimeReminderConfirm"

var linkProduct : String = "http://www.mockhttp.cn/mock/TimeReminderProductInfo"

var linkBase:String = "http://www.mockhttp.cn/mock/TimeReminderBase"

var HOMEPIN_URL:String="https://i.homepin.cn/"                         //线上

var GERENZHONGXIN_URL:String =  "epfTommJSON.action" //个人中心接口
var wap_lcnewJSON_URL:String =   "wap_lcnewJSON.action" //分类接口

var wapSearchProducts_URL:String =  "wapSearchProducts2JSON.action" //商品列表

var artDetailList_URL:String =                   "productDetailListProductMinutiasJSON.action"//品在家作品SKU数据请求
var  w_psJSON_URL:String =                      "w_psJSON.action" //品在家商品详情接口

var depponTotalPrice_URL:String =    "depponTotalPriceJSON.action"  //购物车  结算 计算全部运费

var searchWaRehouseListByPid_URL:String =   "searchWarehouseListByPidJSON.action" // 判断体验店


var searchSimilarProduct_URL:String =           "searchSimilarProductJSON.action" //单品详情页推荐商品

var listPackageByProductId_URL:String =         "listPackageByProductIdForApp.action" //查询搭配组合packageid接口

var  searchPackageProduct_URL:String =           "searchPackageProductForApp.action" //根据packageid查询搭配组合商品

var wap_listCommentJSON_URL:String =            "wap_listCommentepfJSON.action" //单品详情评论

var putInShopping_URL:String =                  "putInShoppingCartJSON.action" //加入购物车

var api_cdBuy_URL : String =                      "api_cdBuy.action" //立即购买

var wapEPingFang_URL:String =                    "wapEPingFangDesignListJSON.action" //品在家楼盘中心列表接 口

var wapEPingFangDesignDetail_URL:String =       "wapEPingFangDesignDetailJSON.action"  //楼盘中心详情接口


var wapEPingFangSpace_URL:String =              "wapEPingFangSpaceListJSON.action" //品在家空间中心列表接口

var wapEPingFangSpaceDetail_URL:String =        "wapEPingFangSpaceDetailJSON.action" //空间中心 vr  实景图

var wapEPingFangSpacePackageDetail_URL:String = "wapEPingFangSpacePackageDetailJSON.action" //空间中心 搭配组合


var searchWearhouse_URL:String =                "searchWearhouseForEPFJSON.action"         //线下体验店位置

var searchWearhouseDetail_URL:String =          "searchWearhouseDetailForEPFJSON.action"    //体验店详情

var  XIUGAIMIMA_URL:String =                 "modifyPasswordEPFJSON.action" //修改密码
var  XIUGAIBANGDINGSHOUJI_URL:String =        "wapAmendTelephoneJSON.action"//修改绑定手机

var SendRegisterVerifyCode_URL:String =         "wapSendRegisterVerifyCodeJSON.action" //快速登录发送验证码
var wapSqQuickLogin_URL:String =               "wapSqQuickLoginJSON.action"  //快速登录


var LIULANLISHI_URL:String =                 "listBrowsingHistoryepfJSON.action" //浏览历史接口
var LIULANLISHI_DELETE_URL:String =          "delBrowsingHistoriesJSON.action" //删除浏览历史


var SHOUHUODIZHI_URL:String =               "listReceiveAddressEPFJSON.action" //收货地址展示
var HUOQUDANGEDIZHI_URL:String =            "wap_receiveAddressEFPJSON.action" //获取单个收货地址信息

var wap_shoppingcart_URL:String =           "wap_shoppingcartEPFJSON.action" //购物车-展示商品
var wapDeleteOrderItem_URL:String =         "wapDeleteOrderItemProductsByOipIdsJSON.action" //购物车-删除商品
var wap_ccpn_URL:String =                   "wap_ccpnJSON.action" //购物车-修改商品数量
var showSKUEPF_URL:String =                 "showSKUEPFJSON.action" //购物车-获取商品细目
var putInShoppingCart_URL:String =          "putInShoppingCartJSON.action" //购物车-确认修改细目

var wap_buyFromShoppingcart_URL:String =    "wap_buyFromShoppingcartJSON.action"  //购物车 去结算


var validateInventory_URL:String =          "validateInventoryJSON.action"  //商品验证库存

var productInfo_URL:String =                "productInfoJSON.action"       //没有细目 购物车选择


var putSinglePackagesInCart_URL:String =    "putSinglePackagesInCart.action"  //多件商品加入购物车

//楼盘中心 全部商品加入购物车
var putSerialsPackagesInCart_URL:String =   "putSerialsPackagesInCart.action"


var listRecommendForCartEPF_URL:String =    "listRecommendForCartEPF.action"   //购物车 推荐商品



var orderList_URL:String =                  "wapOrderListJSON.action" //订单列表

var DELETEORDER_URL:String =                "wapHomepinDeleteOrder.action"//订单删除

var TIJIAODINGDAN_URL:String =              "api_dsBuy.action" //单品立即购买->提交订单


//楼盘加入收藏接口

var wapEPingFangDesignAddCollection_URL:String =         "wapEPingFangDesignAddCollectionJSON.action"

//空间  vr  实景  加入 收藏
var wapEPingFangSpaceAddCollection_URL:String =          "wapEPingFangSpaceAddCollectionJSON.action"

//搭配组合  加入收藏
var wapEPingFangPackagesAddCollection_URL:String =       "wapEPingFangPackagesAddCollectionJSON.action"

var listCommonLabel_URL:String =                         "listCommonLabelCollectedJSON.action" //商品详情 判断是否加入收藏

var addCollectionJSON_URL:String =                       "addCollectionJSON.action" //加入收藏

var quxiaoShoucang_URL:String = "removeCollectionEpf.action"  //取消收藏

var cancelCollectionJSON_URL:String =       "cancelCollectionJSON.action"  //取消收藏


var SimilarProduct_URL:String =                          "listRecommendForEPF.action" //收藏列表  为你推荐

//判断是否 在收藏中
var isCollected_URL:String = "isCollectedJSON.action"


var ORDERALIPAY_URL:String = "artfunAppAlipay.action"


/**
 *订单支付 支付宝
 */
var ORDERWXPAY_URL:String =                             "appHomePinWeChatPay.action"

var PageClicks_URL:String =     "addPageClicksJSON.action" //获取商品详情的点击数量



var wap_searchepfJSON_URL:String =      "listHistoryKeyword.action"   //关键词 搜索历史

var listSearchBrandAndCategoryepf_URL:String =  "listSearchBrandAndCategoryepfJSON.action"  // 搜索页下的推荐品牌和分类接口


//获取文件token
var gainResourceToken_URL:String =                              "gainResourceToken.action"



//第三方登录
var homePinAppTPLogin_URL:String = "homePinAppTPLogin.action"








//楼盘中心 省市区 筛选

//查询省份
var provinceFromDesign_URL:String = "provinceFromDesignEPFJSON.action"


//根据市查询区
var companyAreaDesign_URL:String =  "companyAreaDesignEPFJSON.action"

//省市区 查询楼盘中心
var companyCommunity_URL:String =   "companyCommunityDesignEPF.action"





//扫一扫登录
var scanQRCodePic_URL:String =      "scanQRCodePicJSON.action"



//删除单个订单项商品接口：
var delOrderItemProductForList_URL:String = "wapHomepinDelOrderItemProduct.action"

//填写商品评价接口（无图片上传）：
var   publishComments_URL:String = "publishComments.action"

//广告
var wapPZJAdvJSON_URL:String="wapPZJAdvJSON.action"

//获取重置记录
var listYakoolCoin_VIP_URL:String="listYakoolCoinOrdersForEpf.action"  //历史重置记录

//品在家年费会员支付（支付宝）
var homepinYCOAppAlipay_URL:String="homepinYCOAppAlipayJSON.action"

//品在家年费会员支付（微信）
var homePinYCOAppWeChat_URL:String="homePinYCOAppWeChatPayJSON.action"

//关键词联想
var listkw_URL:String="listkw.action"


//激活会员
var verifyActivationCode_URL:String="verifyActivationCodeJSON.action"


//获取 自提门店
var searchWarehouse_URL:String="searchWarehouseForApp.action"
