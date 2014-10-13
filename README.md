---
tags: IBOutlet,IBAction,OOP
languages: objc
---
# There are no tests for this one... have fun :)

# Jukebox

The goal of this lab is to make a simple Jukebox.

## The Models

### Song

#### Properties

  * Title
  * Artist
  * Album
  * File Name
    * File name of mp3 file, without mp3 extension.

#### Methods

  * none!

### Playlist

A class to contain a list of songs, with some convienance methods.

#### Properties

  * Songs

#### Methods

```
- (void)sortSongsByTitle;
```
  
  * Should sort the songs array alphabetically ascending by title. If two songs have the same title, then they should be sorted alphabetically ascending by artist.

```
- (void)sortSongsByArtist;
```
    
  * Should sort the songs array alphabetically ascending by artist. If two songs have the same Artist, then they should be sorted alphabetically ascending by album, and then alphabetically ascending by song title.

```
- (void)sortSongsByAlbum;
```
    
  * Should sort the songs array alphabetically ascending by Album. If two songs have the same album, then they should be sorted alphabetically ascending by title.

```
- (NSString *)description;
```
   
  * An `NSString` representation of the playlist. Remember `\n` can be used for new line.

```
- (FISSong *)songAtPosition:(NSNumber *)position;
```
    
  * Returns the song at the position given. This should not start from 0, it should start at 1 because we are humans! If the position given is invalid, we should return nil.

## The View

This is what the view should look like:

![](screenshot.png?raw=true)

So that's two `UIButton`s, one `UITextField` and one `UITextView`. Note that it's a `UITextView` not a `UILabel` because `UITextView`s handle multi line text a lot easier.

## The Controller

The basic flow of the app is the user can put in a number in the `UITextField` that corresponds to a song in the song listing and then hit play and that song will be played. For the first version of the app, just `NSLog` the song being played. Once you get basic NSLogging working, add three more `UIButton`s. These three buttons should re-sort the playlist by Title, Artist or Album. Every time you resort, re-display the newly sorted playlist into the `UITextView` `text` property. 

Once you've got that working and are feeling confident, then you can move on to actually playing music! There are a few steps needed to get audio working:

  1. Import the `AVFoundation` library by writing `#import <AVFoundation/AVFoundation.h>` in your view controller.
  2. Add an `@property` called `audioPlayer` of type `AVAudioPlayer *` by adding `@property (strong, nonatomic) AVAudioPlayer *audioPlayer;` to your view controller.
  3. Copy paste this method into your view controller:

  ```objc
  - (void)setupAVAudioPlayWithFileName:(NSString *)fileName
  {
      NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                           pathForResource:fileName
                                           ofType:@"mp3"]];
      NSError *error;
      self.audioPlayer = [[AVAudioPlayer alloc]
                      initWithContentsOfURL:url
                      error:&error];
      if (error)
      {
          NSLog(@"Error in audioPlayer: %@",
                [error localizedDescription]);
      } else {
          [self.audioPlayer prepareToPlay];
      }
  }
  ```
  4. Now! Drag an mp3 file into your project.
  5. To "change songs" call `[self setupAVAudioPlayWithFileName:songFileName]`. This will setup the `AVAudioPlayer` with whatever filename you give it. For example, if you dragged in `TakeAWalk.mp3`, you would call the method like this `[self setupAVAudioPlayWithFileName:@"TakeAWalk"]`
  6. After you have setup the player, you can just call `play` on the `audioPlayer` property like this `[self.audioPlayer play]`.
  7. To stop the playing call `stop` like this `[self.audioPlayer stop]`

**Top Tip:** Girl Talk provides his albums for free in MP3 format [here](http://illegal-art.net/girltalk/shop/index.html)
