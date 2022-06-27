//
//  MyHouseInfoModel.h
//  MyHouse
//
//  Created by aurine on 2022/6/21.
//

#import <Foundation/Foundation.h>

typedef void(^QuerySuccess) (id result);
typedef void(^QueryFailure) (id error);

@interface MyHouseInfoModel : NSObject

@property (nonatomic, copy) NSString *buildingNum;      //楼号
@property (nonatomic, copy) NSString *unitNum;          //单元号
@property (nonatomic, copy) NSString *roomNum;          //房间号
@property (nonatomic, copy) NSString *identity;         //您的身份
@property (nonatomic, copy) NSString *ownerName;        //您的名称
@property (nonatomic, assign) NSInteger passState;      //房屋信息通过状态

- (instancetype)initWithDictionary:(NSDictionary *)dic;

+ (void)getMyHouseInfoListSuccess:(QuerySuccess)success Failure:(QueryFailure)failure;

@end



