//
//  MyHouseController.m
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import "MyHouseController.h"
#import "MyHouseView_Panel.h"
#import "MyHouseView_Bottom.h"
#import "HouseMembersController.h"

@interface MyHouseController ()<iMyHousePanelDelegate>

@property (nonatomic, strong) MyHouseView_Panel *housePanelView;
@property (nonatomic, strong) MyHouseView_Bottom *houseBottomView;
@property (nonatomic, strong) UIAlertController *outHouseAlert;

@end

@implementation MyHouseController

#pragma mark -- 懒加载

- (MyHouseView_Panel *)housePanelView {
    if (!_housePanelView) {
        _housePanelView = [MyHouseView_Panel new];
        _housePanelView.backgroundColor = CRCColor(232, 232, 232);
        _housePanelView.delegate = self;
    }
    return _housePanelView;
}

- (MyHouseView_Bottom *)houseBottomView {
    if (!_houseBottomView) {
        _houseBottomView = [[MyHouseView_Bottom alloc] initWithFrame:CGRectZero andType:addHouseType];
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

#pragma mark -- addUI

- (void)addUI {
    self.view.backgroundColor = CRCColor(232, 232, 232);
    [self.topBarView setTitle:@"我的房屋"];
    
    [self.view addSubview:self.housePanelView];
    
    [self.view addSubview:self.houseBottomView];
}

#pragma mark -- addConstraints

- (void)addConstraints {
    [self.housePanelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(AllNavTotalHeight);
    }];
    
    [self.houseBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.housePanelView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-BottomSafeHeight);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 80));
    }];
}

#pragma mark -- addAction

- (void)addAction {
    __weak typeof(self) weakSelf = self;
    self.houseBottomView.addHouseBlock = ^{
        [weakSelf addHouseAction];
    };
}

#pragma mark ---- Action
//添加房屋
- (void)addHouseAction {
    NSLog(@"添加房屋");
}

#pragma mark ---- MyHousePanelDelegate
//迁出房屋
- (void)outMyHouseAction:(MyHouseInfoModel *)model {
    NSString *address = [NSString stringWithFormat:@"%@ %@ %@",model.buildingNum,model.unitNum,model.roomNum];
    
    self.outHouseAlert = [UIAlertController alertControllerWithTitle:@"警告" message:[NSString stringWithFormat:@"是否要迁出%@", address] preferredStyle:UIAlertControllerStyleAlert];
    
    //创建事件
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定");
    }];
    [self.outHouseAlert addAction:cancel];
    [self.outHouseAlert addAction:confirm];
    
    //显示
    [self presentViewController:self.outHouseAlert animated:YES completion:^{
            
    }];
}
//查看房屋成员
- (void)lookMyHouseMembersAction:(MyHouseInfoModel *)model {
    NSString *address = [NSString stringWithFormat:@"%@ %@ %@",model.buildingNum,model.unitNum,model.roomNum];
    NSLog(@"查看成员:%@",address);
    
    HouseMembersController *vc = [HouseMembersController new];
    [self.navigationController pushViewController:vc animated:YES];
}





@end
