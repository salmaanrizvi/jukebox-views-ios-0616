//  FISJukeboxViewController.m

#import "FISJukeboxViewController.h"
#import "FISPlaylist.h"

@interface FISJukeboxViewController ()

@property (strong, nonatomic) FISPlaylist *playlist;
@property (weak, nonatomic) IBOutlet UITextView *playlistView;
@property (weak, nonatomic) IBOutlet UITextField *songSelectorField;

@end

@implementation FISJukeboxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.playlist = [[FISPlaylist alloc] init];
    self.playlistView.text = self.playlist.text;
}

- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileName
                                         ofType:@"mp3"]];
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!self.audioPlayer) {
        NSLog(@"Error in audioPlayer: %@", error.localizedDescription);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}


- (IBAction)playButtonTapped:(id)sender {
    NSUInteger trackNumber = [self.songSelectorField.text integerValue];
    FISSong *selectedSong = [self.playlist songForTrackNumber:trackNumber];
    
    if (selectedSong) {
        [self setupAVAudioPlayWithFileName:selectedSong.fileName];
        [self.audioPlayer play];
    } else {
        self.songSelectorField.text = nil;
    }
}

- (IBAction)stopButtonTapped:(id)sender {
    [self.audioPlayer stop];
}

- (IBAction)titleTapped:(id)sender {
    [self.playlist sortSongsByTitle];
    self.playlistView.text = self.playlist.text;
}

- (IBAction)artistTapped:(id)sender {
    [self.playlist sortSongsByArtist];
    self.playlistView.text = self.playlist.text;
}

- (IBAction)albumTapped:(id)sender {
    [self.playlist sortSongsByAlbum];
    self.playlistView.text = self.playlist.text;
}

@end
