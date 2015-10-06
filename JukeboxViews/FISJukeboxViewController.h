//  FISJukeboxViewController.h

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface FISJukeboxViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
