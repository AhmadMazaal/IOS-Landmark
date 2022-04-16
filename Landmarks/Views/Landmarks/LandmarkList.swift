import SwiftUI;

struct LandmarkList: View {
    @State private var areFavoritesShown = false;
    @EnvironmentObject var modelData: ModelData;

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!areFavoritesShown || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $areFavoritesShown){
                    Text("Favorites Only");
                }
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink {
                        LandmarkDetail(landmark:landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
       LandmarkList()
            .environmentObject(ModelData())
    }
}
