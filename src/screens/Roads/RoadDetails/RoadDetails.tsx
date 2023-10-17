import React from "react";
import { ScrollView, StyleSheet, Text, View } from "react-native";
import MapView, { Marker, Polyline } from "react-native-maps";
import Button from "../../../components/atoms/Button/Button";
import Icon from "react-native-vector-icons/FontAwesome";
import Header from "../../../components/molecules/Header/Header";
import { Image } from "expo-image";
import { SCREEN_WIDTH } from "../../../constants/window";
import { INavigation } from "../../../interfaces/Navigation/INavigation";
import { IRoute } from "../../../interfaces/Navigation/IRoute";
import { customMapStyle } from "../../../styles/customMapStyle";

interface IRoadsDetails extends INavigation, IRoute<"RoadDetails"> {}

const list = [
  { latitude: -12.048302, longitude: -77.063199 },
  { latitude: 61.993812, longitude: -143.793405 },
  { latitude: -22.985474, longitude: -43.204023 },
  { latitude: 47.831596, longitude: -354.745576 },
  { latitude: 66.837326, longitude: -183.068523 },
];

export default function RoadsDetails({ route, navigation }: IRoadsDetails) {
  const { name, source, address, description, id } = route.params;

  const marker1 = { latitude: 61.993812, longitude: -143.793405 };
  const marker2 = { latitude: -22.985474, longitude: -43.204023 };
  const initialRegion = {
    latitude: (marker1.latitude + marker2.latitude) / 2,
    longitude: (marker1.longitude + marker2.longitude) / 2,
    latitudeDelta: 0.75 * Math.abs(marker1.latitude + marker2.latitude),
    longitudeDelta: 0.75 * Math.abs(marker1.longitude + marker2.longitude),
  };

  const routeCoordinates = [marker1, marker2];

  return (
    <View style={{ flex: 1 }}>
      <Header
        rightButtonProps={{
          icon: "chevron-right",
          navigation: () => navigation.goBack(),
          buttonProps: { rounded: true },
        }}
      />
      <ScrollView style={styles.card}>
        <View style={styles.container}>
          <Image source={source} style={styles.image} priority="high" />
          <View style={styles.content}>
            <View style={styles.textContainer}>
              <Text style={styles.title}>{name}</Text>
              <Text style={styles.subtitle}>{address}</Text>
              <Text style={styles.description}>{description}</Text>
              <Text style={styles.routeText}>Rota</Text>
            </View>
            <MapView
              style={styles.map}
              initialRegion={initialRegion}
              showsPointsOfInterest={false}
              customMapStyle={customMapStyle}
            >
              <Marker coordinate={marker1} title="Marker 1">
                <Image
                  source={require("../../../../assets/Marker.png")}
                  style={styles.markerImage}
                />
              </Marker>
              <Marker coordinate={marker2} title="Marker 2">
                <Image
                  source={require("../../../../assets/Marker.png")}
                  style={styles.markerImage}
                />
              </Marker>
              <Polyline
                coordinates={routeCoordinates}
                strokeWidth={3}
                strokeColors={["rgb(63, 169, 245)", "rgb(142, 6, 253)"]}
              />
            </MapView>
            <Button
              contained
              style={styles.buttonContainer}
              onPress={() => navigation.navigate("Home")}
              text="Fazer rota"
            >
              <Icon name="chevron-right" color={"rgb(255, 255, 255)"} />
            </Button>
          </View>
        </View>
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  card: {
    width: "100%",
    flex: 1,
  },
  title: { fontSize: 30, fontWeight: "900" },
  subtitle: { fontSize: 17, fontWeight: "300" },
  description: { fontSize: 17, fontWeight: "300", marginTop: 26 },
  container: {
    alignItems: "center",
    justifyContent: "center",
    gap: 20,
    flex: 1,
    paddingBottom: "30%",
  },
  content: {
    flex: 1,
    paddingHorizontal: 15,
    alignItems: "center",
    justifyContent: "center",
    width: "100%",
  },
  image: {
    height: 400,
    width: "100%",
  },
  textContainer: {
    gap: 10,
    alignItems: "flex-start",
  },
  routeText: {
    fontSize: 30,
    fontWeight: "900",
    marginTop: 32,
    marginBottom: 18,
  },
  map: {
    flex: 1,
    width: "100%",
    height: 500,
    borderRadius: 10,
    marginBottom: 26,
  },
  markerImage: {
    transform: [{ rotate: "180deg" }],
    width: SCREEN_WIDTH * 0.05,
    height: SCREEN_WIDTH * 0.05,
  },
  buttonContainer: {
    flexDirection: "row",
    alignItems: "flex-start",
    justifyContent: "space-between",
    marginTop: 26,
  },
});
