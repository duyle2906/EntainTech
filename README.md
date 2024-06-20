# EntainTech
# Table of Contents
1. [Entain Technical Task](#entain-technical-task)
2. [Requirements](#requirements)
3. [Technical Requirements](#technical-requirements)
4. [Api](#api)
5. [Arhitecture](#arhitecture)

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
Clean Architecture + MVVM
![Clean Architecture + MVVM]([[http://url/to/img.png](https://drive.google.com/file/d/1BNPPlZ8Q_gFWL5ErN3-D8ESeIApWHvcy/view?usp=sharing)])










