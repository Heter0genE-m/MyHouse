//
//  ViewController.m
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import "ViewController.h"
#import "MyHouseController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *myHouseButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
    [self addAction];
}

- (void)addUI{
    self.view.backgroundColor = WhiteColor;
    
    self.myHouseButton = ({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        button.center = self.view.center;
        button.backgroundColor = UIColor.blueColor;
        [button setTitle:@"我的房屋" forState:UIControlStateNormal];
        button;
    });
    [self.view addSubview:self.myHouseButton];
    
}

- (void)addAction {
    [self.myHouseButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click{
    MyHouseController *vc = [MyHouseController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
