//
//  MyHouseInfoModel.m
//  MyHouse
//
//  Created by aurine on 2022/6/21.
//

#import "MyHouseInfoModel.h"

@implementation MyHouseInfoModel

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        self.buildingNum = dic[@"buildingNum"];
        self.unitNum = dic[@"unitNum"];
        self.roomNum = dic[@"roomNum"];
        self.identity = dic[@"identity"];
        self.ownerName = dic[@"ownerName"];
        self.passState = [dic[@"passState"] intValue];
    }
    return self;
}

//获取房屋信息
+ (void)getMyHouseInfoListSuccess:(QuerySuccess)success Failure:(QueryFailure)failure {
    NSMutableArray *dataList = [NSMutableArray array];
    NSDictionary *paramsDic = [NSDictionary dictionary];
    
    [[ApiManager shareInstance] POST_ResponsePath:@"https://www.fastmock.site/mock/90f8ffed94568dc497589b32bedbbea7/_MyHouse/api/myHouse" params:paramsDic Success:^(id responseObject) {

        for (NSDictionary *dic in responseObject[@"data"]) {
            MyHouseInfoModel *model = [[MyHouseInfoModel alloc] initWithDictionary:dic];
            [dataList addObject:model];
        }
        success(dataList);
        
        } Failure:^(id error) {
            failure(error);
        }];
}

@end
