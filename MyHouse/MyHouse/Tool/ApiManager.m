//
//  ApiManager.m
//  MyHouse
//
//  Created by aurine on 2022/6/20.
//

#import "ApiManager.h"



@implementation ApiManager

+ (ApiManager *)shareInstance {
    static ApiManager *myInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myInstance = [[ApiManager alloc] init];
    });
    return myInstance;
}

- (void)POST_ResponsePath:(NSString *)responsePath params:(NSDictionary *)params Success:(QuerySuccess)success Failure:(QueryFailure)failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",nil];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = 10;
    NSString *URL = [NSString stringWithFormat:@"%@",responsePath];
    
    [manager POST:URL parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
}

- (void)GET_ResponsePath:(NSString *)responsePath params:(NSDictionary *)params Success:(QuerySuccess)success Failure:(QueryFailure)failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10;
    NSString *URL = [NSString stringWithFormat:@"%@",responsePath];
    
    [manager GET:URL parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSData *data = (NSData *)responseObject;
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            success(obj);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
}




@end
