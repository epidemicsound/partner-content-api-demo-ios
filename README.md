# Partner Content API iOS Demo

This is a simple SwiftUI demo application capable of playing HLS audio
streams. It is built for example purposes and is meant to complement the
documentation for Epidemic Sound's [Partner Content API](https://partner-content-api.epidemicsound.com).

The app uses signed cookies for accessing the HLS files
(see [AudioContentProvider.swift](App/Services/AudioContentProvider.swift)).
The signed cookies expect the same data as returned by the
[HLS endpoint](https://partner-content-api.epidemicsound.com//swagger#/Tracks/GET_HLS_Download_Data).
In this example the HLS URLs and signed cookie data can be found in the
[resources](App/Resources/Constants.swift).

The audio player funcionality is built using
[AVFoundation](https://developer.apple.com/documentation/avfoundation), which
takes care of the complexities of HLS. This means that the implementation is
very similar to an equivilant implementation useing simple audio files.
