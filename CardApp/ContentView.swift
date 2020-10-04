//
//  ContentView.swift
//  CardApp
//
//  Created by 楠瀬大志 on 2020/10/03.
//

import SwiftUI

struct ContentView: View {
    var cards = ["かばん":"bag",
                 "自動車":"car",
                 "誕生日":"birthday"] //辞書の宣言
    
    @State var japanese = "かばん" //ストアドプロパティ、プロパティラッパーで画面切り替え
    @State var isJapanese = true  //ストアドプロパティ
    
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.96, blue: 0.56)
                .edgesIgnoringSafeArea(.all) //背景色を画面いっぱいにするメソッド
            VStack {
                ZStack{
                    Image("card")
                        .resizable() //画像の拡大縮小
                        .frame(width: 300, height: 133) //画像の大きさ
                        .shadow(radius: 3 ) //周囲の影をつける
                        .rotation3DEffect(
                            .degrees(isJapanese ? 0 : 180),
                            axis: (x: 0.0, y: 1.0, z: 0.0))//isJapaneseがtrueのときはひっくり返る
                        .animation(.spring())
                        .onTapGesture{
                            self.isJapanese.toggle()
                        } //ユーザーによるタップを感知するジェスチャー
                    Text( isJapanese ? japanese : cards[japanese]!)  //参考演算子、条件？真の場合の式：儀の場合の式、オプショナルで中身がnil
                        .font(.largeTitle)
                }.padding()
                HStack{
                    Group {
                        Button(action: {
                            self.isJapanese.toggle() //クロージャ
                        }) {
                            Image(systemName: "arrow.2.circlepath")
                            Text("裏返す")
                        }
                        Button(action: {
                            self.isJapanese = true
                            self.japanese = self.cards.randomElement()!.key
                        }) {
                            Text("次へ")
                        }
                    }.padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0.86, green: 0.45, blue: 0.03))
                    .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//クロージャ　クロージャとは、文の中に直接埋め込むことのできる命令の塊。
//タプル　タプルとは、複数の値を一つの変数にまとめる機能。
