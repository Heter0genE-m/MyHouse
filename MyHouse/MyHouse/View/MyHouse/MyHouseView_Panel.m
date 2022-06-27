//
//  MyHouseView_Panel.m
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import "MyHouseView_Panel.h"
#import "HouseInfoCell.h"

@interface MyHouseView_Panel ()<UITableViewDelegate, UITableViewDataSource, iHouseInfoCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) LoadDataView *loadDataView;

@end

@implementation MyHouseView_Panel

#pragma mark ---- 懒加载

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
        [_tableView registerClass:[HouseInfoCell class] forCellReuseIdentifier:NSStringFromClass([HouseInfoCell class])];
        //上拉刷新，下拉加载
        [self setTableViewRefresh];
        
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

#pragma mark ---- 初始化UI 约束 Action

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addUI];
        [self addConstraints];
        [self addAction];
        [self getMyHouseData];
    }
    return self;
}

- (void)addUI {
    [self addSubview:self.loadDataView];
    [self addSubview:self.tableView];
}

- (void)addConstraints {
    [self.loadDataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
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
    return 150;
}

//行内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HouseInfoCell *cell = [[HouseInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([HouseInfoCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    [cell setModel:self.dataList[indexPath.row]];

    return cell;
    
}

#pragma mark ---- tableViewRefresh

- (void)setTableViewRefresh {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    header.lastUpdatedTimeLabel.hidden = NO;//控制是否显示上次加载时间label
    self.tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    self.tableView.mj_footer = footer;
}

- (void)headerRefresh {
    NSLog(@"上拉");
    [self getMyHouseData];
}

- (void)footerRefresh {
    NSLog(@"下拉");
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark ---- cellDelegate

- (void)outHouseAction:(MyHouseInfoModel *)model {
    if (_delegate && [_delegate respondsToSelector:@selector(outMyHouseAction:)]) {
        [_delegate outMyHouseAction:model];
    }
}

- (void)lookHouseMembersAction:(MyHouseInfoModel *)model {
    if (_delegate && [_delegate respondsToSelector:@selector(lookMyHouseMembersAction:)]) {
        [_delegate lookMyHouseMembersAction:model];
    }
}

#pragma mark ---- 网络接口获取数据

- (void)getMyHouseData {
    __weak typeof(self) weakSelf = self;
    [MyHouseInfoModel getMyHouseInfoListSuccess:^(id result) {
        
        NSLog(@"%@", result);
        weakSelf.dataList = [result mutableCopy];
        if (weakSelf.dataList.count == 0) {
            weakSelf.loadDataView.load_Label.text = @"暂无数据";
            weakSelf.loadDataView.hidden = NO;
        }
        else {
            weakSelf.loadDataView.hidden = YES;
        }
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView.mj_footer endRefreshing];
        
        } Failure:^(id error) {
            NSLog(@"%@", error);
            weakSelf.loadDataView.hidden = NO;
            DSToast *toast = [[DSToast alloc] initWithText:@"网络连接错误"];
            [toast showInView:weakSelf showType:DSToastShowTypeCenter];
            weakSelf.loadDataView.load_Label.text = @"数据加载失败";
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView.mj_footer endRefreshing];
        }];
}
@end
