//
//  AppDelegate.m
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    nav.navigationBar.hidden = YES;
    [self.window setRootViewController:nav];
    
    
    return YES;
}





@end
