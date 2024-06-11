//
//  AddTaskView.swift
//  Boong-To-Do
//
//  Created by 황석현 on 6/11/24.
//
// MARK: 할일 추가 화면(모달)

import SwiftUI

struct AddTaskView: View {
    
    @State var taskTitle: String = ""
    @State var desciptions: String = ""
    // 상위 뷰 모달 상태
    @Binding var isPresented: Bool
    // 하위 뷰(시간 선택) 모달 상태
    @State var timeSelectorisPresented = false
    
    var body: some View {
        VStack {
            
            TextField("할일 제목 입력", text: $taskTitle, prompt: Text("할 일을 입력해주세요."))
                .frame(width: 335, height: 24)
                .padding(.top, 30)
            
            TextField("설명 입력", text: $desciptions, prompt: Text("설명"))
                .frame(width: 335, height: 24)
                .padding(.bottom, 40)
            
            HStack {
                // 터치 시, 시간 선택 창으로
                Button(action: {
                    timeSelectorisPresented.toggle()
                }, label: {
                    HStack {
                        Label(
                            title: { Text("예상 소요 시간") },
                            icon: { Image(systemName: "clock") }
                        )
                        .foregroundStyle(.gray)
                        .frame(width: 140, height: 40)
                        .background(.gray.opacity(0.3))
                        .clipShape(.rect(cornerRadius: 4))
                        Spacer()
                    }
                    .padding(.horizontal)
                })
                // 터치 시, 모달 뷰 Dismiss
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "arrow.up")
                        .foregroundStyle(.white)
                        .frame(width: 32, height: 32)
                        .background(.black)
                        .clipShape(Circle())
                        .padding()
                })
            }.sheet(isPresented: $timeSelectorisPresented, content: {
                // 시간 선택 화면 모달뷰
                TimeSelector(isPresented: $timeSelectorisPresented)
                    .presentationDetents([.height(368)])
                    .presentationDragIndicator(.visible)
            })
            Spacer()
        }
    }
}

#Preview {
    AddTaskView(taskTitle: "", desciptions: "", isPresented: .constant(false))
}
