//
//  DetailsPresenter.m
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

#import "DetailsPresenter.h"

@interface DetailsPresenter()

@property(nonatomic, weak) id<DetailsPresenterOutput> userInterface;

@end


@implementation DetailsPresenter

- (id)initWith:(DetailsViewController *)controller {
    self = [super init];
    if(self) {
        self.userInterface = controller;
    }
    
    return self;
}

-(ClassifiedData *)getClassifiedData {
    
    return [self.interactor getClassifiedData];
}

@end
