//
//  DetailsViewController.h
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

#import <UIKit/UIKit.h>
#import "DetailsPresenterIO.h"


@interface DetailsViewController : UIViewController <DetailsPresenterOutput, UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) id<DetailsPresenterInput> presenter;

@end

