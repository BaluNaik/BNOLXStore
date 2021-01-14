//
//  DetailsAssembly.m
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

#import "DetailsAssembly.h"
#import "DetailsPresenter.h"
#import "DetailsInteractor.h"
#import "DetailsViewController.h"
#import "BNOLXSTORE-Swift.h"


@implementation DetailsAssembly


// MARK: - Public

- (id)initWith:(ClassifiedData *)data {
    self = [super init];
    if(self) {
        self.data = data;
    }
    
    return self;
}

- (UIViewController *)viewModule {
    DetailsViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailsVC"];
    [vc setPresenter:[self presenterModule:vc]];
    return  vc;
}

- (DetailsPresenter *)presenterModule:(DetailsViewController *)viewController {
    DetailsPresenter *presenter = [[DetailsPresenter alloc] initWith:viewController];
    [presenter setInteractor:[self interactorModule:presenter]];
    
    return presenter;
}

- (DetailsInteractor *)interactorModule:(DetailsPresenter *)presenter {
    DetailsInteractor *interactor = [[DetailsInteractor alloc] init];
    [interactor setPresenter:presenter];
    [interactor setData:self.data];
    
    return interactor;
}



@end
