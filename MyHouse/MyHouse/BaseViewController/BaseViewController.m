//
//  BaseViewController.m
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import "BaseViewController.h"

@interface BaseViewController ()<iBackButtonDelegate, iRightButtonDelegate>



@end

@implementation BaseViewController
#pragma mark ---- 懒加载

- (TopBarView *)topBarView {
    if (!_topBarView) {
        _topBarView = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, AllNavTotalHeight)];
        _topBarView.backBtnDelegate = self;
        _topBarView.rightBtnDelegate = self;
        [_topBarView setBackButtonImg:[UIImage imageNamed:@"icon_back_black"]];
    }
    return _topBarView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTopBarView];
}

- (void)addTopBarView {
    [self.view addSubview:self.topBarView];
}

#pragma mark ---- Delegate

- (void)backBtnActionDelegate {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)rightBtnActionDelegate {
    
}


@end
