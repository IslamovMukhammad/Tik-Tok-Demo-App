//
//  ContentView.swift
//  Tik Tok Demo App
//
//  Created by Muhammad Islamov on 03/04/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
      TabView {
        Home()
          .tabItem{
            Image(systemName: "house.fill")
            Text("Home")
          }.tag(0)
        DiscoverScreen()
          .tabItem{
            Image(systemName: "safari")
            Text("Discover")
          }.tag(1)
        ForSoon()
          .tabItem{
            Image(systemName: "plus.rectangle.fill")
          }.tag(2)
        ForSoon()
          .tabItem{
            Image(systemName: "bubble.middle.bottom")
            Text("Inbox")
          }.tag(3)
        ProfileScreen()
          .tabItem{
            Image(systemName: "person")
            Text("Profile")
          }.tag(4)
      }
        .accentColor(.black.opacity(0.7))
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//      ForSoon()
//      ProfileScreen()
//      Home()
//      DiscoverScreen()


    }
}

// ScrollComment


struct ScrollComment: View {

  @State var isHeart: Bool = false
  @State var count: Int = 7

  var body: some View {

      Rectangle()
        .fill(Color.white)
        .frame(height: 100)
        .overlay(

      HStack{
        VStack{
          Image("profil")
            .resizable()
            .frame(width: 50, height: 50)
            .cornerRadius(40)
          Spacer()
        }
        VStack(alignment: .leading, spacing: 8){
          Text("islamovmuhammad").fontWeight(.bold).foregroundColor(Color.gray)
          Text("Swift UI TikTok Demo app")
          HStack{
            Text("1d").fontWeight(.bold).foregroundColor(Color.gray)
            Text("Reply").fontWeight(.bold).foregroundColor(Color.gray)
          }
        }
        Spacer()
        Button(action: {
          isHeart.toggle()
        }, label: {

          VStack{
            Image(systemName: "heart.fill")
                          .font(.system(size: 20))
                          .foregroundColor(isHeart ? Color.red : Color.white)
                          .shadow(radius: 10)
            Text("\(isHeart ? count + 1 : count)").foregroundColor(Color.black.opacity(0.5))
          }
        })
      }.padding()

      )
  }
}

//Comment screen

struct CommentScreen: View {

@Binding var showNewScreen: Bool
@State var TextFor: String = ""

var body: some View {
ZStack{
  VStack(spacing: 0){
    ZStack{
  Rectangle()
        .fill(Color.white).edgesIgnoringSafeArea(.all)
    .frame(maxWidth: .infinity)
    .frame(height: 500)
    .overlay(
      VStack{

        HStack{
          Image(systemName: "xmark")
            .foregroundColor(Color.white)
          .font(.title)
          .padding(.leading)
          Spacer()
          Text("2022 comments")
            .fontWeight(.bold)

          Spacer()

          Button(action: {
            showNewScreen.toggle()
          }, label: {
            Image(systemName: "xmark")
              .foregroundColor(Color.gray)
            .font(.title)
            .padding(.trailing)
          })
        }.padding(.top)
        Spacer()
        ScrollView{
          VStack{
            ForEach(1..<20) { index in
              ScrollComment()
            }
          }
        }
        Spacer()
      Rectangle()
        .fill(Color.white)
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .overlay(
          VStack(spacing: 5){
            Rectangle()
              .fill(Color.gray.opacity(0.3))
              .frame(maxWidth: .infinity)
              .frame(height: 1)
          HStack{
            Image("profil")
              .resizable()
              .frame(width: 50, height: 50)
              .cornerRadius(40)
              .padding(.leading, 10)

            RoundedRectangle(cornerRadius: 15)
              .fill(Color.gray.opacity(0.4))
              .frame(height: 50)
              .frame(maxWidth: .infinity)
              .padding(.trailing, 10)
              .overlay(
                HStack{
                  TextField("Add comment...", text: $TextFor)
                    .padding(.leading)

                  Spacer()

                  Image(systemName: "at")
                    .font(.system(size: 25))
                  Image(systemName: "face.smiling")
                    .font(.system(size: 25))
                    .padding(.trailing, 15)
                }
              )
            Spacer()
          }
          }
        )
      }
      )
    }




Spacer()

  }
}
}
}



struct Home: View {

  @State var showNewScreen: Bool = false
  @State private var index = 0
  @State private var top = 0
  @State private var data = [
                              Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "1", ofType: "mp4")!)), playing: false),
                              Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "2", ofType: "mp4")!)), playing: false),
                              Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "3", ofType: "mp4")!)), playing: false),
                              Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "4", ofType: "mp4")!)), playing: false),
                              Video(id: 5, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "5", ofType: "mp4")!)), playing: false),
                              Video(id: 6, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "6", ofType: "mp4")!)), playing: false) ]
          @State var isHeart: Bool = false
          @State var count: Int = 777

  var body: some View{
    ZStack {


        PlayerScrollView(data: self.$data)



      VStack {

          HStack(spacing: 15) {
              Spacer()
              Button {
                  self.top = 0
              } label: {
                  ZStack(alignment: .topTrailing){
                  Text("Following")
                      .foregroundColor(self.top == 0 ? .white : .white.opacity(0.45))
                      .fontWeight(self.top == 0 ? .bold : .regular)
                      .padding(.vertical)
                      ZStack{
                      Rectangle().frame(width: 30, height: 15).cornerRadius(25).foregroundColor(Color.pink.opacity(0.7))
                          .padding(.top, 10)
                          .padding(.trailing, -10)
                          Text("LIVE").foregroundColor(Color.white).font(.system(size: 10)).fontWeight(.bold)
                              .padding(.trailing, -9.5)
                              .padding(.top, 9)
                      }
                  }
              }.padding(.leading, 50)
              Button {
                  self.top = 1
              } label: {
                  Text("For You")
                      .foregroundColor(self.top == 1 ? .white : .white.opacity(0.45))
                      .fontWeight(self.top == 1 ? .bold : .regular)
                      .padding(.vertical)
              }
              Spacer()
              Button(action: {}, label: {

              Image(systemName: "magnifyingglass").resizable().foregroundColor(Color.white)
                  .frame(width: 25, height: 25).padding(.trailing, 30)
              })}
          Spacer()
          HStack {
              VStack(alignment: .leading, spacing: 10){
                  Spacer()
                  Text("@iMacBro").foregroundColor(Color.white).fontWeight(.bold)
                  Text("iOS developer, swiftUI").foregroundColor(Color.white)
                  HStack{
                  Text("🇺🇿 #samarqand #uzb...").foregroundColor(Color.white)
                      Button(action: {}, label: {
                          Text("See more").foregroundColor(Color.white).fontWeight(.bold)
                      })
                  }
                  Text("See translation").foregroundColor(Color.white).underline()
                      .font(.system(size: 14))
                  HStack{
                      Image(systemName: "music.note").foregroundColor(Color.white)
                      Text("original sound - iMacBro music...").foregroundColor(Color.white)
                  }

              }.padding(.leading, 5)
              Spacer()
              VStack(spacing: 35) {
                  Spacer()
                  Button {
                      //
                  } label: {
                      ZStack(alignment: .bottom){

                          Image("profil")
                          .resizable()
                          .frame(width: 55, height: 55, alignment: .center)
                          .cornerRadius(40)
                          Image(systemName: "circle.fill").resizable().frame(width: 18, height: 18).padding(.bottom, -8).padding(.leading, 0).foregroundColor(Color.white)
                          Image("plus").resizable().frame(width: 20, height: 20).padding(.bottom, -8).padding(.leading, 0)
                      }
                  }
                  Button {
                    isHeart.toggle()
                  } label: {
                      VStack(spacing: 8) {
                        Image(systemName: "heart.fill")
                          .resizable()
                          .frame(width: 35, height: 30, alignment: .center)
                          .foregroundColor(isHeart ? Color.red : Color.white)
                          .shadow(radius: 10)


                        Text("\(isHeart ? count + 1 : count)")
                              .foregroundColor(.white)
                              .font(.system(size: 14))
                      }
                  }
                  Button {
                    showNewScreen.toggle()
                  } label: {
                      VStack(spacing: 8) {

                          Image(systemName: "message.fill")
                              .resizable()
                              .frame(width: 25, height: 25, alignment: .center)
                              .foregroundColor(.white)
                          Text("2022")
                              .foregroundColor(.white)
                              .font(.system(size: 14))
                      }
                  }
                  Button {
                      //
                  } label: {
                      VStack(spacing: 8) {
                          Image(systemName: "arrowshape.turn.up.right.circle.fill")
                              .resizable()
                              .frame(width: 25, height: 25, alignment: .center)
                              .foregroundColor(.white)
                          Text("Share")
                              .foregroundColor(.white)
                              .font(.system(size: 14))
                      }
                  }
                  Image("disk").resizable().frame(width: 50, height: 50).padding(.bottom, -40)
              }
              .padding(.bottom, 30)
              .padding(.trailing)
          }.padding(.bottom, 50)
          HStack{}.frame(height: 1).frame(maxWidth: .infinity).background(Color.gray.opacity(0.5)).padding(.top, 15)

        }
      .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
      .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0 + 5)
      ZStack{
      if showNewScreen {
        CommentScreen(showNewScreen: $showNewScreen)
          .padding(.top, 343)
          .transition(.move(edge: .bottom))
          .animation(Animation.default)
      }
      }
      .zIndex(2.0)

  }
  .background(Color.black.edgesIgnoringSafeArea(.all))
  .edgesIgnoringSafeArea(.all)
    

  }
}




// For Player View



struct PlayerView: View {

    @Binding var data: [Video]
    @State private var isPlaying = false

    var body: some View {
        VStack(spacing: 0) {
            ForEach(self.data) { video in
                ZStack {
                    Player(player: video.player)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: UIDevice.hasNotch ? -8 : -10)
                        .onTapGesture {
                            changePlayingState(video)
                        }
                    if isPlaying {
                        Button {
                            changePlayingState(video)
                        } label: {
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 55, height: 55)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .onAppear {
            self.data[0].player.play()
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.data[0].player.currentItem, queue: .main) { [self] _ in
                data[0].player.seek(to: .zero)
                data[0].player.play()
            }
        }
    }

    private func changePlayingState(_ video: Video) {
        isPlaying.toggle()
        if isPlaying {
            video.player.pause()
        } else {
            video.player.play()
        }
    }
}

struct Player: UIViewControllerRepresentable {

    var player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        //
    }
}

struct Video: Identifiable {
    let id: Int
    let player: AVPlayer
    let playing: Bool
}

struct PlayerScrollView: UIViewRepresentable {

    @Binding var data: [Video]

    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UIScrollView {
        let view = UIScrollView()
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(self.data.count))
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(self.data.count))
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        view.bounces = false
        return view
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(self.data.count))
    }

    class Coordinator: NSObject, UIScrollViewDelegate {

        var parent: PlayerScrollView
        var index = 0

        init(parent: PlayerScrollView) {
            self.parent = parent
        }

        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let currentIndex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            if index != currentIndex {
                index = currentIndex
                for i in 0..<parent.data.count {
                    parent.data[i].player.seek(to: .zero)
                    parent.data[i].player.pause()
                }
                parent.data[index].player.play()
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: parent.data[index].player.currentItem, queue: .main) { [self] _ in
                    parent.data[index].player.seek(to: .zero)
                    parent.data[index].player.play()
                }
            }
        }
    }
}

// ProfileScreen

struct ProfileScreen: View {

    var colorPlus = Color(#colorLiteral(red: 0.06547575444, green: 0.8484624028, blue: 0.6949706674, alpha: 1))
    @State var index = 0
    @State var top = 0

  let columns: [GridItem] = [
    GridItem(.flexible(), spacing: 1, alignment: nil),
    GridItem(.flexible(), spacing: 1, alignment: nil),
    GridItem(.flexible(), spacing: 1, alignment: nil),
  ]

    var body: some View {
      VStack{

        // header

        HStack{
          Image(systemName: "person.badge.plus").font(.system(size: 20))
          Image(systemName: "circle").font(.title).foregroundColor(.white)
          Spacer()
          Text("Muhammad Islamov").font(.system(size: 20)).fontWeight(.bold)
          Image(systemName: "chevron.down").font(.headline)
          Spacer()
          Image(systemName: "eye").font(.system(size: 20))
          Image(systemName: "line.3.horizontal").font(.system(size: 25))
        }.padding()

        // Profile picture

        Group{

        ZStack(alignment: .bottomTrailing){
        Image("profil")
            .resizable()
            .frame(width: 110, height: 110)
            .cornerRadius(150)

        Circle()
            .fill(colorPlus)
            .frame(width: 30, height: 30)
            .background(
              Circle()
                .fill(Color.white)
                .frame(width: 35, height: 35)
            )
            .overlay(
              Image(systemName: "plus")
                .font(.system(size: 25))
                .foregroundColor(.white)
            )
            .padding(.trailing, 8)
            .padding(.top, 8)
        }

        }

        // name

        Text("@iMacBro").font(.system(size: 20))
          .fontWeight(.bold)

        // following followers likes
        Group{

        Group{

        HStack{
          VStack{
            Text("77")
              .font(.system(size: 17))
              .fontWeight(.bold)
            Text("Following").foregroundColor(.gray)
              .font(.system(size: 17))
          }

          Text("|").foregroundColor(Color.gray)
            .padding()

          VStack{
            Text("333M")
              .font(.system(size: 17))
              .fontWeight(.bold)
            Text("Followers").foregroundColor(.gray)
              .font(.system(size: 17))
          }

          Text("|").foregroundColor(Color.gray)
            .padding()

          VStack{
            Text("22B")
              .font(.system(size: 17))
              .fontWeight(.bold)
            Text("Likes").foregroundColor(.gray)
              .font(.system(size: 17))
          }
        }

        }

        //Button

        Group{

        Button(action: {
          //
        }, label: {
          ZStack{
            Rectangle()
                .frame(width: 180, height: 35)
                .foregroundColor(Color.gray.opacity(0.5))
                .cornerRadius(6)

          Rectangle()
            .frame(width: 178, height: 33)
            .foregroundColor(Color.white)
            .cornerRadius(6)
            .overlay(
              Text("Edit profile")
                .foregroundColor(Color.black)
                .fontWeight(.bold)
                .font(.system(size: 15))
            )
          }

        })
        }

        //bio

        Text("Bioooooooooo").padding()

        // videos, likes, bookmarks, clock
        Group{

        HStack{
          Image(systemName: "square.grid.3x1.below.line.grid.1x2")
          Spacer()
          Image(systemName: "suit.heart")
          Spacer()
          Image(systemName: "bookmark")
          Spacer()
          Image(systemName: "lock")
        }.font(.system(size: 25))
          .foregroundColor(.gray)
          .padding(.horizontal, 30)


        Spacer()


        }

        // Videos
        Group{
        ScrollView {

          LazyVGrid(columns: columns, spacing: 1) {
            Group{
            ProfileVideos(img_url: "image1", randomNum: 808).frame(height: 200)
            ProfileVideos(img_url: "image2", randomNum: 523).frame(height: 200)
            ProfileVideos(img_url: "image3", randomNum: 123).frame(height: 200)
            ProfileVideos(img_url: "image4", randomNum: 742).frame(height: 200)
            ProfileVideos(img_url: "image5", randomNum: 525).frame(height: 200)
            ProfileVideos(img_url: "image6", randomNum: 753).frame(height: 200)
            ProfileVideos(img_url: "image7", randomNum: 245).frame(height: 200)
            ProfileVideos(img_url: "image8", randomNum: 368).frame(height: 200)
            ProfileVideos(img_url: "image9", randomNum: 435).frame(height: 200)
            ProfileVideos(img_url: "image10", randomNum: 628).frame(height: 200)
            }
            Group{
              ProfileVideos(img_url: "image11", randomNum: 236).frame(height: 200)
              ProfileVideos(img_url: "image12", randomNum: 732).frame(height: 200)
              ProfileVideos(img_url: "image13", randomNum: 456).frame(height: 200)
              ProfileVideos(img_url: "image14", randomNum: 247).frame(height: 200)
            }
              }
            } // scroll view
          } // group
        }
            Spacer()



      }
  }
}

// Profile Videos

struct ProfileVideos: View {

  var img_url = "image1"

  static let ranNum = [424,252]

  @State var randomNum = Self.ranNum.randomElement()!

    var body: some View {
      ZStack(alignment: .bottomLeading){
        Image(img_url).resizable()
          .frame(height: 200)
        HStack(spacing: 5){
          Image(systemName: "arrowtriangle.right").foregroundColor(Color.white)
            .font(.system(size: 15))
          Text("\(randomNum)").foregroundColor(Color.white)
            .font(.system(size: 15))

        }.padding(.leading, 5)
          .padding(.bottom, 5)
      }
    }
}

// DiscoverScreen

struct DiscoverScreen: View {

  @State var searchh:String = ""

    var body: some View {
      VStack{

        // Search

        HStack{
          ZStack{
            Rectangle().fill(Color.gray.opacity(0.3))
              .frame(height: 50)
              .frame(maxWidth: .infinity)
              .cornerRadius(5)
            HStack{
              Image(systemName: "magnifyingglass")
                .font(.system(size: 25))
              TextField("Search", text: $searchh).font(.system(size: 20))
            }.padding()
          }
          Image(systemName: "qrcode.viewfinder")
            .font(.largeTitle)
        }.padding(.horizontal)

        //  tabView

        TabView {
          Image("disImage3").resizable().scaledToFill()

          Image("disImage4").resizable().scaledToFill()

          Image("disImage2").resizable().scaledToFill()

          Image("disImage5").resizable().scaledToFill()

          Image("disImage6").resizable().scaledToFill()

          Image("disImage1").resizable().scaledToFill()

          Image("disImage7").resizable().scaledToFill()

        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 200)

        // Scroll

        ScrollView{

          // Hashteg1
          Group{
          HStack{
            Image(systemName: "number.circle").font(.largeTitle)
            VStack(alignment: .leading){
              Text("Uzbekistan").font(.headline)
              Text("Xcode projects").foregroundColor(Color.gray).font(.system(size: 13)).fontWeight(.bold)
            }
            Spacer()
            Button(action: {}, label: {
            Text("580.8B >").fontWeight(.bold)
                .foregroundColor(Color.black)
              .padding(.horizontal,8)
              .padding(.vertical,5)
              .background(Color.gray.opacity(0.3))
              .cornerRadius(7)
            })
          }.padding(.horizontal)

          ScrollView(.horizontal){
            HStack(spacing: 3){
              ForEach(1..<4) { index in
              ProfileVideos(img_url: "image1")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image2")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image3")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image4")
                .frame(width: 120, height: 160)
              }
            }
          }.frame(height: 160)
            .padding(.leading)
          }

          // Hashteg2
          Group{
          HStack{
            Image(systemName: "number.circle").font(.largeTitle)
            VStack(alignment: .leading){
              Text("Samarkand").font(.headline)
              Text("Xcode projects").foregroundColor(Color.gray).font(.system(size: 13)).fontWeight(.bold)
            }
            Spacer()
            Button(action: {}, label: {
            Text("888.2M >").fontWeight(.bold)
                .foregroundColor(Color.black)
              .padding(.horizontal,8)
              .padding(.vertical,5)
              .background(Color.gray.opacity(0.3))
              .cornerRadius(7)
            })
          }.padding(.horizontal).padding(.top)

          ScrollView(.horizontal){
            HStack(spacing: 3){
              ForEach(1..<4) { index in
              ProfileVideos(img_url: "image5")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image6")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image7")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image8")
                .frame(width: 120, height: 160)
              }
            }
          }.frame(height: 160)
            .padding(.leading)
          }

          // Hashteg3
          Group{
          HStack{
            Image(systemName: "number.circle").font(.largeTitle)
            VStack(alignment: .leading){
              Text("SwiftUI").font(.headline)
              Text("Xcode projects").foregroundColor(Color.gray).font(.system(size: 13)).fontWeight(.bold)
            }
            Spacer()
            Button(action: {}, label: {
            Text("358.2M >").fontWeight(.bold)
                .foregroundColor(Color.black)
              .padding(.horizontal,8)
              .padding(.vertical,5)
              .background(Color.gray.opacity(0.3))
              .cornerRadius(7)
            })
          }.padding(.horizontal).padding(.top)

          ScrollView(.horizontal){
            HStack(spacing: 3){
              ForEach(1..<4) { index in
              ProfileVideos(img_url: "image9")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image10")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image11")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image12")
                .frame(width: 120, height: 160)
              }
            }
          }.frame(height: 160)
            .padding(.leading)
          }

          // Hashteg4
          Group{
          HStack{
            Image(systemName: "number.circle").font(.largeTitle)
            VStack(alignment: .leading){
              Text("Trending").font(.headline)
              Text("Xcode projects").foregroundColor(Color.gray).font(.system(size: 13)).fontWeight(.bold)
            }
            Spacer()
            Button(action: {}, label: {
            Text("463.4M >").fontWeight(.bold)
                .foregroundColor(Color.black)
              .padding(.horizontal,8)
              .padding(.vertical,5)
              .background(Color.gray.opacity(0.3))
              .cornerRadius(7)
            })
          }.padding(.horizontal).padding(.top)

          ScrollView(.horizontal){
            HStack(spacing: 3){
              ForEach(1..<4) { index in
              ProfileVideos(img_url: "image13")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image14")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image6")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image3")
                .frame(width: 120, height: 160)
              }
            }
          }.frame(height: 160)
            .padding(.leading)
          }

          // Hashteg5
          Group{
          HStack{
            Image(systemName: "number.circle").font(.largeTitle)
            VStack(alignment: .leading){
              Text("Ramadan").font(.headline)
              Text("Xcode projects").foregroundColor(Color.gray).font(.system(size: 13)).fontWeight(.bold)
            }
            Spacer()
            Button(action: {}, label: {
            Text("973.3M >").fontWeight(.bold)
                .foregroundColor(Color.black)
              .padding(.horizontal,8)
              .padding(.vertical,5)
              .background(Color.gray.opacity(0.3))
              .cornerRadius(7)
            })
          }.padding(.horizontal).padding(.top)

          ScrollView(.horizontal){
            HStack(spacing: 3){
              ForEach(1..<4) { index in
              ProfileVideos(img_url: "image7")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image2")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image8")
                .frame(width: 120, height: 160)
              ProfileVideos(img_url: "image12")
                .frame(width: 120, height: 160)
              }
            }
          }.frame(height: 160)
            .padding(.leading)
          }

        }

        Spacer()
      }
    }
}


// pic For Soon

struct ForSoon: View {
  var body: some View {
    Image("coming").resizable()
      .scaledToFill()
      .edgesIgnoringSafeArea(.all)
  }
}

// Extension

extension UIDevice {
    static var hasNotch: Bool {
        return (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0) > 0
   }
}
