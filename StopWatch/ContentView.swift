//
//  ContentView.swift
//  StopWatch
//
//  Created by 平石悠生 on 2026/02/09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timer: Timer!
    @State private var secondsElapsed: Double = 0.0
    @State private var isRunning: Bool = false
    
    var body: some View {
        VStack {
            Text(String(format: "%.2f", secondsElapsed))
                .font(.title)
            HStack {
                if isRunning {
                    Button {
                        pause()
                    } label: {
                        Image(systemName: "pause.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(.orange)
                            .clipShape(.circle)
                    }
                } else {
                    Button {
                        start()
                    } label: {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(.green)
                            .clipShape(.circle)
                    }
                }
                if secondsElapsed != 0.0 {
                    Button {
                        stop()
                    } label: {
                        Image(systemName: "stop.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(.red)
                            .clipShape(.circle)
                    }
                }
            }
        }
        .padding()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            secondsElapsed += 0.1
        }
        isRunning = true
    }
    
    func pause() {
        timer.invalidate()
        isRunning = false
    }
    
    func stop() {
        timer.invalidate()
        isRunning = false
        secondsElapsed = 0.0
    }
}

#Preview {
    ContentView()
}
