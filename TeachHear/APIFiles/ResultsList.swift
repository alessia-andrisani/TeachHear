//
//  IDTrackManager.swift
//  APITeachHear
//
//  Created by Diego Castro on 14/02/22.
//

import Foundation
import SwiftUI

public class IDTrackManager: ObservableObject {
    private init() { }
    
    static var shared = IDTrackManager()
    
    @Published var listOfStatusCodes : [Int]? = Array(repeating: 0, count: 10)
    @Published var listOfFinalTittles :[String]? = Array(repeating: "", count: 10)
    @Published var listOfTrackedIDs: [Int]? = Array(repeating: 0, count: 10)
    @Published var  listOfHasLyricsCodes: [Int]? = Array(repeating: 0, count: 10)
    
    @Published var filteredListOfStatusCodes : [Int]? = Array(repeating: 0, count: 10)
    @Published var filteredListOfFinalTittles :[String]? = Array(repeating: "", count: 10)
    @Published var filteredListOfTrackedIDs: [Int]? = Array(repeating: 0, count: 10)
    @Published var  filteredListOfHasLyricsCodes: [Int]? = Array(repeating: 0, count: 10)
    @Published var filteredListOfSongLyrics: [String]? = Array(repeating: "", count: 10)

    @Published var listOfSongURLs: [String]? = Array(repeating: "", count: 10)
    @Published var listOfSongLyrics: [String]? = Array(repeating: "", count: 10)
    @Published var listAppear: Bool? = true
    var counter: Int = 1
    func fetchData (inputTittlesList: ArraySlice<Track>?, listOfTrackedSongs: ArraySlice<Track>?, listAppearance: Bool) async {
        
        listOfStatusCodes = Array(repeating: 0, count: 10)
        listOfFinalTittles = Array(repeating: "", count: 10)
        listOfTrackedIDs = Array(repeating: 0, count: 10)
        listOfHasLyricsCodes = Array(repeating: 0, count: 10)
        
        filteredListOfStatusCodes = Array(repeating: 0, count: 10)
        filteredListOfFinalTittles = Array(repeating: "", count: 10)
        filteredListOfTrackedIDs = Array(repeating: 0, count: 10)
        filteredListOfHasLyricsCodes = Array(repeating: 0, count: 10)
        filteredListOfSongLyrics = Array(repeating: "", count: 10)

        listOfSongURLs = Array(repeating: "", count: 10)
        listOfSongLyrics = Array(repeating: "", count: 10)
        
        
  var j = -1
        listAppear = listAppearance

        
        if listOfTrackedSongs!.count >= 10 {
            //This if statement is ment to ckeck if the size of the songs returned by the API is greater than 10
            counter = 9
            
        } else {
            counter = listOfTrackedSongs!.count-1
            
        }
        
        for i in 0...counter {
  
            //ListOfTrackedSongs is an array of arrays, so separate each array  inside the group of arrays.
            let splitElementsInArray = listOfTrackedSongs![i]
            
            listOfTrackedIDs![i] = splitElementsInArray.track.track_id
            listOfFinalTittles![i] = splitElementsInArray.track.track_name
            listOfHasLyricsCodes![i] = splitElementsInArray.track.has_lyrics
            
            //Here we create the URLs based on the Track_IDs to get the lyrics of each song.
            listOfSongURLs![i] = "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=\(listOfTrackedIDs![i])&apikey=ded278d14431e37e7574b08e57dd8bc2"
            
            
            if listOfSongURLs == nil  {
                //We just make sure that there is something inside the listOfURLs, althoughy I think this is unnecesary since this array was already defined has a list of empty strings.
                listOfSongLyrics![i] = "no URL"
                
                
            } else {
                
                //URL
                if let url = URL(string: listOfSongURLs?[i] ?? "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=0&apikey=ded278d14431e37e7574b08e57dd8bc2")
                    
                {
                    //With the if statement below we check that we have a valir URL
                    if listOfSongURLs?[i] == "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=0&apikey=ded278d14431e37e7574b08e57dd8bc2"  {
                        
                        passsData(lyricsData: "ERROR", i: 1)
      
                        
                    } else {
                        
                        //URL Session
                        let session = URLSession(configuration: .default)
                        //FEtching task
                        let task = session.dataTask(with: url) { (data, response, error) in
                            //Error handle
                            
                            if error != nil {
                                
                                fatalError("\(String(describing: error?.localizedDescription))")
                            }
                            
                            //Parse JSON to a readable version
                            if let receivedData = data {
                                
                                //Decoded
                                if let decodedata = self.decodeJASONData(receivedData: receivedData){
                                    //Convert to usable form
                                    
                                    let llyricsData = self.convertDecodedDataToUsableForm(decodedData: decodedata)
                                    
                                    if llyricsData.statusCode != 200{
                                        
                                        self.listOfSongLyrics![i] = "An Error Ocurred while requesting the lyrics"
                                        self.listOfStatusCodes![i] = llyricsData.statusCode
                                    } else {
                                      
                                        //Pass the data to the main view
                                        self.listOfStatusCodes![i] = llyricsData.statusCode
                                        
                                        self.passsData(lyricsData: llyricsData.songLyrics, i: i)
                                        
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                                
                            }
                            
                           
                        }
                        task.resume()
                    }
                }
                
//             print("DEBUG")
                
            }
            if  self.listOfHasLyricsCodes![i] == 1 {
                j = j+1
                self.filteredListOfStatusCodes![j] = self.listOfStatusCodes![i]
                self.filteredListOfFinalTittles![j] = self.listOfFinalTittles![i]
                self.filteredListOfTrackedIDs![j] = self.listOfTrackedIDs![i]
                self.filteredListOfHasLyricsCodes![j] = self.listOfHasLyricsCodes![i]
                self.filteredListOfSongLyrics![j] = self.listOfSongLyrics![i]
                print("Has Lyrics Codes", self.filteredListOfHasLyricsCodes!)
                print("Has Lyrics", self.filteredListOfHasLyricsCodes!.filter{$0 > 0})
                print("This is J", j)
                print("This is i", i)
                print("Arrays")
                print(self.filteredListOfFinalTittles!)
                print(self.filteredListOfSongLyrics!)
            }
        }
      
        
       return
        
    }
    
    private func decodeJASONData (receivedData: Data) -> ResultData? {
        
        //Write a function to decode JSON data
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(ResultData.self, from: receivedData)
            
            
            return decodedData
        } catch {
            return nil
        }
        
    }
    private func convertDecodedDataToUsableForm (decodedData: ResultData) ->
    ResultModel {
        
        let songData = ResultModel(statusCode: decodedData.message.header.status_code, songLyrics: decodedData.message.body.lyrics.lyrics_body)
        
        return songData
    }
    
    public func passsData(lyricsData: String, i: Int)   {
        
        listOfSongLyrics?[i] = lyricsData
        
    }
    
    
}

struct ResultsList : View {
    @EnvironmentObject var shared: IDTrackManager
  
    
    var body: some View {

       
      
        
        ZStack {
            if shared.listOfSongLyrics == Array(repeating: "", count: 10)  {  }
            else if shared.listAppear == true {
       
            }
            else {
         
                List{
//                    shared.filteredListOfHasLyricsCodes!.filter{$0 > 0}.count
                    ForEach (0..<shared.listOfHasLyricsCodes!.count) { Index in
                        
                        NavigationLink {
                            //Check if the lyrics of the song are available
                  

                                
                                ExerciseView(lyrics: shared.listOfSongLyrics![Index], isNew: true)
                                

                            
                            
                        
                        } label: {
                            
                            
                            Text("\(shared.listOfFinalTittles![Index] )")
 
                        }
                        
                    
                }
                .listStyle(PlainListStyle())
                    .padding(.horizontal)
                  
                
            }
            
        }
    }

}
 
}
