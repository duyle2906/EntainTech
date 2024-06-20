# EntainTech
# Table of Contents
1. [Entain Technical Task](#entain-technical-task)
2. [Requirements](#requirements)
3. [Technical Requirements](#technical-requirements)
4. [Api](#api)
5. [Architecture](#architecture)
6. [Demo](#demo)
7. [Development Setup](#development-setup)
8. [Test Results](#test-results)
9. [Suggested Improvements](#suggested-improvements)

# Entain Technical Task
<p>Create an iOS app that displays ‘Next to Go’ races using our API.<br>
A user should always see 5 races, and they should be sorted by time ascending. Race should disappear
from the list after 1 min past the start time, if you are looking for inspiration look at<br>
https://www.neds.com.au/next-to-go</p>

# Requirements
<p>
1. As a user, I should be able to see a time ordered list of races ordered by advertised start ascending<br>
2. As a user, I should not see races that are one minute past the advertised start<br>
3. As a user, I should be able to filter my list of races by the following categories: Horse, Harness &amp;
Greyhound racing<br>
4. As a user, I can deselect all filters to show the next 5 from of all racing categories<br>
5. As a user I should see the meeting name, race number and advertised start as a countdown for
each race.<br>
6. As a user, I should always see 5 races and data should automatically refresh<br>
</p>

# Technical Requirements
<p>
- Use SwiftUI or UIKit<br>
- Has some level of testing. Full coverage is not necessary, but there should be at least some testing
for key files.<br>
- Documentation<br>
- Use scalable layouts so your app can respond to font scale changes<br>
- (Optional) Use of custom Decodable<br>
- (Optional) Use of SF Symbols for any icons<br>
- (Optional) add accessibility labels such that you can navigate via voiceover<br>
</p>

# API
<p>
Categories are defined by IDs and are the following:<br>
- Greyhound racing: category_id: 9daef0d7-bf3c-4f50-921d-8e818c60fe61<br>
- Harness racing: category_id: 161d9be2-e909-4326-8c2c-35ed71fb460b<br>
- Horse racing: category_id: 4a2788f8-e825-4d36-9894-efd4baf1cfae<br>
GET https://api.neds.com.au/rest/v1/racing/?method=nextraces&amp;count=10<br>
Content-type: application/json<br>
</p>

# Architecture
The project is using Clean Architecture + MVVM with separated frameworks setup for Presentation, Domain and Data layers

![Clean Architecture - Entain](https://github.com/duyle2906/EntainTech/assets/1464336/1ca2f98b-b536-4391-85e0-f0e201054530)

# Demo

https://github.com/duyle2906/EntainTech/assets/1464336/6e98090d-8e78-47ce-8415-d2fdcf2dedd3

# Development Setup
> __This project is written in Swift 5 and Xcode 15.4 is required for development.__

Before you begin, you should already have the Xcode downloaded and set up correctly. You can find a guide on how to do this here: [Setting up Xcode](https://developer.apple.com/xcode/)

##### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Steps to install Cocoapods (one time installation)

- Run `sudo gem install cocoapods` to install the latest version of cocoapods. To install cocoapods from HomeBrew, `brew install cocoapods`.

- Next, run `pod setup` for setting up cocoapods master repo. You may include `--verbose` for more descriptive logs.
**NOTE:** This might take a while to setup depending on your network speed.

- Finally, go to the root folder of the project where the Podfile is located and run `pod install` to retrieve the pods for the project

# Test Results

Over 90% code coverage was achieved, as demonstrated in the following figure from the EntainTechAllTests test plan.

<img width="970" alt="Screenshot 2024-06-20 at 1 13 34 PM" src="https://github.com/duyle2906/EntainTech/assets/1464336/0c86e4ac-43f1-4861-85a6-9e3ed7e60585">

# Suggested Improvements

Here are a few suggested improvements for the project:<br><br>

- Different configurations will be needed for different environments, including Development, Staging, and Production.<br><br>
- Store the base URL and any potential secrets in .xcconfig files for each environment. These values should be added to Info.plist and loaded accordingly in the project. These implementations would ideally be located in the Data Layer. It is also important to add the .xcconfig files for the production environment to .gitignore.<br><br>
- Improve the logic for converting seconds to a time string so that it can display the time in hours and days if necessary. Currently, the app only converts seconds to minutes and seconds for the countdown logic.<br><br>
- Apply the coordinator pattern as the navigation logic of the project becomes more complex.<br><br>
- Use a general decoding strategy (decoder.keyDecodingStrategy = .convertFromSnakeCase) if the API always returns snake_case format, avoiding the need to decode keys individually.<br><br>
- Remove the hardcoded race category ID by having the backend return the value of the RaceCategory enum instead of the category ID.<br><br>
- Handle UI states better by revamping the loading and error states.<br><br>
- Consider localization early in the project.<br><br>










