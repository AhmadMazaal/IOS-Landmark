import SwiftUI;

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData;
    @State private var showProfile:Bool = false;
    var body: some View {
        NavigationView{
            List{
                modelData.features[0].image
                   .resizable()
                   .scaledToFill()
                   .frame(height: 200)
                   .clipped()
                   .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id:\.self){ key in
                    CategoryRow(
                        categoryName: key,
                        items: modelData.categories[key]!
                    )
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
            .listStyle(.inset)

//            .listRowInsets(EdgeInsets())
//            .frame( maxWidth: .infinity)
//            .listStyle(GroupedListStyle())
            .toolbar {
                Button {
                    showProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
            
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData());
    }
}
