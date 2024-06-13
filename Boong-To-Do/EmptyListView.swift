//
//  EmptyListView.swift
//  Boong-To-Do
//
//  Created by 황석현 on 6/11/24.
//
// MARK: 할일이 없을 때, 표시되는 뷰

import SwiftUI

struct EmptyListView: View {
    
    // 할일 추가하는 모달 뷰
    @State var addTaskIsPresented = false
    
    var body: some View {
        ZStack {
            // 배경색
            Color.secondary.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                // TODO: 로고로 변경가능성?
                Text("이미지")
                    .frame(width: 150, height: 146)
                    .background(.white)
                    .padding(.bottom, 30)
                VStack {
                    Text("할일이 아직 없어요")
                    // 터치 시, 할일 추가 모달 나타남
                    Button(action: {
                        addTaskIsPresented.toggle()
                    }, label: {
                        Text("추가하러 가기")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                            .bold()
                            .frame(width: 113, height: 34)
                            .background(.black)
                            .clipShape(.rect(cornerRadius: 8))
                    })
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    // 터치 시, 할일 추가 모달 나타남
                    Button(action: {
                        addTaskIsPresented.toggle()
                    }, label: {
                        ZStack {
                            Image(systemName: "plus")   
                                .resizable()
                                .frame(width: 23, height: 23)
                                .foregroundStyle(.white)
                                .frame(width: 48, height: 48)
                                .background(.black)
                                .clipShape(Circle())
                        }
                        .padding()
                    })
                    .sheet(isPresented: $addTaskIsPresented, content: {
                        // 할일 추가 화면 모달뷰
                        AddTaskView(isPresented: $addTaskIsPresented)
                        // TODO: 모달 뷰 사이즈 수정해야할지도?
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.visible)
                    })
                }
            }
        }
    }
}

#Preview {
    EmptyListView()
}
