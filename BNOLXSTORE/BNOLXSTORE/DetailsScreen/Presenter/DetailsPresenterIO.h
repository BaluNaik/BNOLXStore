//
//  DetailsPresenterIO.h
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

#import <Foundation/Foundation.h>

@class ClassifiedData;
@protocol DetailsPresenterInput <NSObject>

-(ClassifiedData *)getClassifiedData;

@end


@protocol DetailsPresenterOutput <NSObject>

@end
