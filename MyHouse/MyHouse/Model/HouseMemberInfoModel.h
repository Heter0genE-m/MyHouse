//
//  HouseMemberInfoModel.h
//  MyHouse
//
//  Created by aurine on 2022/6/22.
//

#import <Foundation/Foundation.h>

typedef void(^QuerySuccess) (id result);
typedef void(^QueryFailure) (id error);

@interface HouseMemberInfoModel : NSObject

@property (nonatomic, copy) NSString *memberName;
@property (nonatomic, copy) NSString *memberIdentity;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

+ (void)getHouseMemberInfoSuccess:(QuerySuccess)success Failure:(QueryFailure)failure;

@end


