//
//  AGMovieViewController.h
//  AGMovieIJKPlayer
//
//  Created by 吴书敏 on 16/9/19.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGMovieView.h"

@interface AGMovieViewController : UIViewController

@property (nonatomic, copy) NSString *aid;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *cidString;
@property (strong, nonatomic) IBOutlet AGMovieView *agMovieView;


@end
