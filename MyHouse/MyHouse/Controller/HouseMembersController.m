//
//  HouseMembersController.m
//  MyHouse
//
//  Created by aurine on 2022/6/22.
//

#import "HouseMembersController.h"
#import "MyHouseView_Bottom.h"
#import "HouseMemberView_Panel.h"

@interface HouseMembersController ()

@property (nonatomic, strong) HouseMemberView_Panel *memberPanelView;
@property (nonatomic, strong) MyHouseView_Bottom *houseBottomView;

@end

@implementation HouseMembersController

#pragma mark -- 懒加载

- (HouseMemberView_Panel *)memberPanelView {
    if (!_memberPanelView) {
        _memberPanelView = [HouseMemberView_Panel new];
        _memberPanelView.backgroundColor = CRCColor(232, 232, 232);
    }
    return _memberPanelView;
}

- (MyHouseView_Bottom *)houseBottomView {
    if (!_houseBottomView) {
        _houseBottomView = [[MyHouseView_Bottom alloc] initWithFrame:CGRectZero andType:addMemberType];
        _houseBottomView.backgroundColor = CRCColor(232, 232, 232);
    }
    return _houseBottomView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
    [self addConstraints];
    [self addAction];
}

- (void)addUI {
    self.view.backgroundColor = CRCColor(232, 232, 232);
    [self.topBarView setTitle:@"房屋成员"];
    
    [self.view addSubview:self.memberPanelView];
    [self.view addSubview:self.houseBottomView];
    
}

- (void)addConstraints {
    [self.memberPanelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(AllNavTotalHeight);
    }];
    
    [self.houseBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.memberPanelView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-BottomSafeHeight);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 80));
    }];
}

- (void)addAction {
    __weak typeof(self) weakSelf = self;
    self.houseBottomView.addMemberBlock = ^{
        [weakSelf addMemberAction];
    };
}

#pragma mark -- Action
//添加房屋成员
- (void)addMemberAction {
    NSLog(@"添加房屋成员");
}


@end
