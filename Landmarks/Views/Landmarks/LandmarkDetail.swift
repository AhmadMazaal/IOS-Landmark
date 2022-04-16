import SwiftUI

struct LandmarkDetail: View {
    var landmark:Landmark;
    @EnvironmentObject var modelData: ModelData;
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(
            where: { $0.id == landmark.id })!
    }

    var body: some View {
        ScrollView {
            MapView(coordinate:landmark.locationCoordinate)
                .ignoresSafeArea(edges:.top)
                .frame(height:300)

            CircleImage(image: landmark.image)
               .offset(y: -130)
               .padding(.bottom, -130);
            
            VStack(alignment: .leading) {
                HStack {
                  Text(landmark.name)
                      .font(.title)
                  FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                Text(landmark.name)
                    .font(.title2);
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary);

                Divider()
                Text("About \(landmark.park)")
                    .font(.title2);
                Text(landmark.description);
            }
            .padding();
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark:ModelData().landmarks[0])
    }
}
