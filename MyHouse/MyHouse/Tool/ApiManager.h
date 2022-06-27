//
//  ApiManager.h
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <UIKit+AFNetworking.h>


@interface ApiManager : NSObject

typedef void(^QuerySuccess) (id responseObject);
typedef void(^QueryFailure) (id error);

+ (ApiManager *)shareInstance;

- (void)POST_ResponsePath:(NSString *)responsePath params:(NSDictionary *)params Success:(QuerySuccess)success Failure:(QueryFailure)failure;

- (void)GET_ResponsePath:(NSString *)responsePath params:(NSDictionary *)params Success:(QuerySuccess)success Failure:(QueryFailure)failure;

@end


