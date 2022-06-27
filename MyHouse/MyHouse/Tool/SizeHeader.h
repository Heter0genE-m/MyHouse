//
//  SizeHeader.h
//  BBLogin
//
//  Created by Heterogene on 2022/5/30.
//

#ifndef SizeHeader_h
#define SizeHeader_h
#define ScreenWidth             [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight            [[UIScreen mainScreen] bounds].size.height
#define CRCColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define placeHoderColor  CRCColor(178,179,184)
#define ClearColor                  [UIColor clearColor]
#define BlackColor                  [UIColor blackColor]
#define WhiteColor                  [UIColor whiteColor]
#define HorizontalLineColor  CRCColor(235,235,235)

#define HexColor(hexString)   [UIColor colorWithHexString:hexString]

#define FONT10SIZE       [UIFont systemFontOfSize:10]
#define FONT11SIZE       [UIFont systemFontOfSize:11]
#define FONT12SIZE       [UIFont systemFontOfSize:12]
#define FONT13SIZE       [UIFont systemFontOfSize:13]
#define FONT14SIZE       [UIFont systemFontOfSize:14]
#define FONT15SIZE       [UIFont systemFontOfSize:15]
#define FONT16SIZE       [UIFont systemFontOfSize:16]
#define FONT17SIZE       [UIFont systemFontOfSize:17]
#define FONT18SIZE       [UIFont systemFontOfSize:18]
#define FONT20SIZE       [UIFont systemFontOfSize:20]
#define ImageNamed(name) [UIImage imageNamed:name]

#define TopStatuHeight          [[UIApplication sharedApplication] statusBarFrame].size.height//状态栏高度

#define NavigationBarHeight self.navigationController.navigationBar.frame.size.height//导航栏高度

#define TabbarHeight self.tabBarController.tabBar.frame.size.height//底部tabbar高度

#define AllNavTotalHeight (TopStatuHeight>20?88:64)//导航栏+状态栏

#define BottomSafeHeight (TopStatuHeight>20?34:0)//底部安全区

#define TabBarHeight (TopStatuHeight>20?83:49)//系统安全区有tabbar的远离高度


#endif /* SizeHeader_h */
