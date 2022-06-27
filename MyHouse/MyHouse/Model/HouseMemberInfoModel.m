//
//  HouseMemberInfoModel.m
//  MyHouse
//
//  Created by aurine on 2022/6/22.
//

#import "HouseMemberInfoModel.h"

@implementation HouseMemberInfoModel

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        self.memberName = dic[@"memberName"];
        self.memberIdentity = dic[@"memberIdentity"];
    }
    return self;
}

//获取房屋成员信息
+ (void)getHouseMemberInfoSuccess:(QuerySuccess)success Failure:(QueryFailure)failure {
    NSMutableArray *dataList = [NSMutableArray array];
    NSDictionary *paramsDic = [NSDictionary dictionary];
    
    [[ApiManager shareInstance] POST_ResponsePath:@"https://www.fastmock.site/mock/90f8ffed94568dc497589b32bedbbea7/_MyHouse/api/houseMember" params:paramsDic Success:^(id responseObject) {
        for (NSDictionary *dic in responseObject[@"data"]) {
            HouseMemberInfoModel *model = [[HouseMemberInfoModel alloc] initWithDictionary:dic];
            [dataList addObject:model];
        }
        success(dataList);
        
        } Failure:^(id error) {
            failure(error);
        }];
}

@end
