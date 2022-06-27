//
//  HouseMemberView_Panel.m
//  MyHouse
//
//  Created by aurine on 2022/6/22.
//

#import "HouseMemberView_Panel.h"
#import "MemberInfoCell.h"

@interface HouseMemberView_Panel ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) LoadDataView *loadDataView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation HouseMemberView_Panel

#pragma mark -- 懒加载

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = ClearColor;
        //代理
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //标识线
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        //cell注册
        [_tableView registerClass:[MemberInfoCell class] forCellReuseIdentifier:NSStringFromClass([MemberInfoCell class])];
    }
    return _tableView;
}

- (LoadDataView *)loadDataView {
    if (!_loadDataView) {
        _loadDataView = [LoadDataView new];
        _loadDataView.hidden = NO;
    }
    return _loadDataView;
}

- (NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

#pragma mark -- 初始化UI、约束、Action

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addUI];
        [self addConstraints];
        [self addAction];
        [self getMemberData];
    }
    return self;
}

- (void)addUI {
    [self addSubview:self.loadDataView];
    [self addSubview:self.tableView];
}

- (void)addConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.loadDataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)addAction {
    
}

#pragma mark ---- UITableView代理方法

//多少区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

//行内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MemberInfoCell *cell = [[MemberInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([MemberInfoCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setModel:self.dataList[indexPath.row]];

    return cell;
    
}

#pragma mark -- 获取房屋成员数据

- (void)getMemberData {
    __weak typeof(self) weakSelf = self;
    [HouseMemberInfoModel getHouseMemberInfoSuccess:^(id result) {
        weakSelf.dataList = [result mutableCopy];
        if (weakSelf.dataList.count == 0) {
            weakSelf.loadDataView.load_Label.text = @"暂无数据";
            weakSelf.loadDataView.hidden = NO;
        }
        else {
            weakSelf.loadDataView.hidden = YES;
        }
        [self.tableView reloadData];
        
        } Failure:^(id error) {
            NSLog(@"%@", error);
            DSToast *toast = [[DSToast alloc] initWithText:@"网络连接错误"];
            [toast showInView:weakSelf showType:DSToastShowTypeCenter];
            weakSelf.loadDataView.load_Label.text = @"数据加载失败";
        }];
}

@end
