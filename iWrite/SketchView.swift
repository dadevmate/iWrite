//
//  SketchView.swift
//  iWrite
//
//  Created by Nethan on 30/10/22.
//

import SwiftUI
import PencilKit
struct SketchView: View {
    var body: some View {
       SketchPad()
    }
}

struct SketchView_Previews: PreviewProvider {
    static var previews: some View {
        SketchView()
    }
}

struct SketchPad:View {
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @Environment(\.colorScheme) private var colorScheme
    @State var type: PKInkingTool.InkType = .pencil
    @State var color: Color = .gray
    @State var colorPicker = false
    @State var savie = false
 
    var body: some View {
        
        NavigationView {
       
            DrawingView(canvas: $canvas, isDraw: $isDraw, type: $type, color: $color)
                .navigationTitle("Sketch Pad")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                
                Button(action: {
                    SaveImage()
                    savie = true
                }, label: {
                    Image(systemName: "square.and.arrow.down.fill")
                        .foregroundColor(.gray)
                        .font(.title)
                }), trailing: HStack(spacing: 15){
                    Button(action: {
                        isDraw = false
                    }){
                        Image(systemName: "pencil.slash")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                  
                    
                    Menu {
                        
                        Button {
                            colorPicker.toggle()
                        } label: {
                            Label {
                                Text("Color")
                            } icon: {
                                Image(systemName: "eyedropper.full")
                            }
                        }
                        
                        
                        
                        
                        
                        Button(action: {
                            isDraw = true
                            type = .pencil
                        }){
                            Label {
                                Text("Pencil")
                            } icon: {
                                Image(systemName: "pencil")
                            }
                        }
                        
                        Button(action: {
                            isDraw = true
                            type = .pen
                        }){
                            Label {
                                Text("Pen")
                            } icon: {
                                Image(systemName: "pencil.tip")
                            }
                        }
                        
                        Button(action: {
                            isDraw = true
                            type = .marker
                        }){
                            Label {
                                Text("Marker")
                            } icon: {
                                Image(systemName: "highlighter")
                               
                            }
                        }
                        
                        
                    
                    } label: {
                        
                        Image(systemName: "ellipsis.circle.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    }
              
                  
                })
                .alert("Saved drawing", isPresented: $savie) {
                    
                } message: {
                    Text("Your drawing was saved to your photos.")
                }
                .sheet(isPresented: $colorPicker) {
                    
                    NavigationView {
                        
                        List {
                            Section {
                                ColorPicker("Pick Color", selection: $color)
                                    .padding()
                                  
                            }
                        }
                        .navigationTitle("Color picker")
                    }
                 
                  
                }
            
          
        }
       
    }
    
    func SaveImage() {
        let image = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1)
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

struct DrawingView : UIViewRepresentable {
    @Binding var canvas : PKCanvasView
    @Binding var isDraw: Bool
    @Binding var type: PKInkingTool.InkType
    @Binding var color: Color
    @Environment(\.colorScheme) private var colorScheme
    var ink : PKInkingTool {
        PKInkingTool(type, color: UIColor(color))
    }
    
    let eraser = PKEraserTool(.bitmap)
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        
        canvas.tool = isDraw ? ink : eraser
        canvas.backgroundColor = .white
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = isDraw ? ink : eraser
    }
}
