# Jukebox Views

## Objectives

1. Connect custom data classes into a view controller.
2. Use the `AVAudioPlayer` class to play audio files.

## Introduction

In this lab, you're going to hook up some audio files to a view controller that will allow a user to select a song from a list and playback the associated audio track. First, you're going to set up the data models for holding the information at run time. Then, you'll connect the data models to a view controller than will make the songs interactive to the user.

## Instructions

### The Data Models

There are two classes that you will need to set according to the provided test files, `FISSong` and `FISPlaylist`. The `FISSong` class is simply a data model for holding title, artist, album, and filename information for an mp3 file. The `FISPlaylist` class contains an array of songs, and will need to be set up with some methods for sorting and accessing the information in that array.

#### `FISSong`

1. Create the class files for `FISSong`. It should inherit from `NSObject` and contain four string properties called `title`, `artist`, `album`, and `fileName`.

2. Declare a designated initializer that covers these four properties in that order.

3. Override the default initializer to call the designated initializer with empty strings submitted as all four arguments. Verify that the tests for `FISSong` all pass before moving on.

#### `FISPlaylist`

A class to contain a list of songs, with some conveniance methods.

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

![](https://ironboard-curriculum-content.s3.amazonaws.com/iOS/screenshot.png)

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
