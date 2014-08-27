//
//  FISJukeboxViewController.h
//  JukeboxViews
//
//  Created by Chris Gonzales on 8/21/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface FISJukeboxViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@end
