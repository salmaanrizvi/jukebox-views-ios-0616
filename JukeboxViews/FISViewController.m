//
//  FISViewController.m
//  JukeboxViews
//
//  Created by Salmaan Rizvi on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISViewController.h"
#import "FISPlaylist.h"
#import "FISSong.h"

@interface FISViewController ()

@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
@property (strong, nonatomic) IBOutlet UITextField *songTextInput;
@property (strong, nonatomic) IBOutlet UITableView *songTable;
@property (strong, nonatomic) IBOutlet UIButton *songSortButton;
@property (strong, nonatomic) IBOutlet UIButton *artistSortButton;
@property (strong, nonatomic) IBOutlet UIButton *albumSortButton;
@property (strong, nonatomic) IBOutlet UILabel *nowPlayingLabel;

@property (strong, nonatomic) FISPlaylist *playlist;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@end

@implementation FISViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.playlist = [[FISPlaylist alloc] init];
    self.nowPlayingLabel.hidden = YES;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playlist.songs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"songText"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%lu. %@", indexPath.row + 1, ((FISSong *)self.playlist.songs[indexPath.row]).title];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", ((FISSong *)self.playlist.songs[indexPath.row]).artist, ((FISSong *)self.playlist.songs[indexPath.row]).album];
    cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    if([self textFieldShouldReturn:self.songTextInput]) {
        [self playTapped:self.songTextInput];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}


- (IBAction)playTapped:(id)sender {
    
    FISSong *songChosen = [self.playlist songForTrackNumber:[self.songTextInput.text integerValue]];
    
    if(songChosen == nil) {
        NSLog(@"Invalid song input.");
    }
    else {
        [self setUpAVAudioPlayerWithFileName:songChosen.fileName];
        [self.audioPlayer play];
        self.nowPlayingLabel.text = [NSString stringWithFormat:@"Now Playing: %@", songChosen.title];
        self.nowPlayingLabel.hidden = NO;
    }
}



- (IBAction)stopTapped:(id)sender {
    NSLog(@"Music stopped.");
    [self.audioPlayer stop];
    self.nowPlayingLabel.text = @"Music stopped.";
}

- (IBAction)songSortTapped:(id)sender {
    [self.playlist sortSongsByTitle];
    [self.songTable reloadData];
}

- (IBAction)artistSortTapped:(id)sender {
    [self.playlist sortSongsByArtist];
    [self.songTable reloadData];
}

- (IBAction)albumSortTapped:(id)sender {
    [self.playlist sortSongsByAlbum];
    [self.songTable reloadData];
}

- (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!self.audioPlayer)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
