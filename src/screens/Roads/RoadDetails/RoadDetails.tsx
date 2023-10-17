import { Dimensions, StyleSheet, Text, View } from "react-native";
import React, { useState } from "react";
import { ParamListBase, RouteProp } from "@react-navigation/native";
import { RootStackParamList } from "../../../../Routes";
import { StackNavigationProp } from "@react-navigation/stack";
import Header from "../../../components/Header";
import { Image } from "expo-image";
import Button from "../../../ui/Button";
import Icon from "react-native-vector-icons/FontAwesome";
import MapView, { Marker, Polyline } from "react-native-maps";
import { LocationObjectCoords } from "expo-location";
import { ScrollView } from "react-native-gesture-handler";

interface IRoadsDetails {
  route: RouteProp<RootStackParamList, "RoadDetails">;
  navigation: StackNavigationProp<ParamListBase>;
}
const customMapStyle = [
  {
    featureType: "poi",
    elementType: "labels",
    stylers: [{ visibility: "off" }],
  },
];

const list = [
  { latitude: -12.048302, longitude: -77.063199 },
  { latitude: 61.993812, longitude: -143.793405 },
  { latitude: -22.985474, longitude: -43.204023 },
  { latitude: 47.831596, longitude: -354.745576 },
  { latitude: 66.837326, longitude: -183.068523 },
];
const { width: SCREEN_WIDTH, height: SCREEN_HEIGHT } = Dimensions.get("window");

export default function RoadsDetails({ route, navigation }: IRoadsDetails) {
  const { name, source, address, description, id } = route.params;

  const marker1 = { latitude: 61.993812, longitude: -143.793405 }; // Coordenadas do primeiro marcador
  const marker2 = { latitude: -22.985474, longitude: -43.204023 }; // Coordenadas do segundo marcador
  const initialRegion = {
    latitude: (marker1.latitude + marker2.latitude) / 2,
    longitude: (marker1.longitude + marker2.longitude) / 2,
    latitudeDelta: 0.75 * Math.abs(marker1.latitude + marker2.latitude),
    longitudeDelta: 0.75 * Math.abs(marker1.longitude + marker2.longitude),
  };

  const routeCoordinates = [marker1, marker2]; // Coordenadas da rota entre os marcadores

  return (
    <View style={{ flex: 1 }}>
      <Header
        rightButtonProps={{
          icon: "chevron-right",
          navigation: () => navigation.goBack(),
          buttonProps: { rounded: true },
        }}
      />
      <ScrollView style={itemSearchStyles.card}>
        <View
          style={{
            alignItems: "center",
            justifyContent: "flex-start",
            gap: 20,
            flex: 1,
            paddingBottom: "30%",
          }}
        >
          <Image
            source={source}
            style={{
              height: 400,
              width: "100%",
            }}
            priority="high"
          />
          <View style={{ gap: 10, alignItems: "flex-start" }}>
            <Text style={itemSearchStyles.title}>{name}</Text>
            <Text style={itemSearchStyles.subtitle}>{address}</Text>
            <Text style={itemSearchStyles.description}>{description}</Text>
            <Text style={{ fontSize: 30, fontWeight: "900", marginTop: 32 }}>
              Rota
            </Text>
          </View>

          <MapView
            style={{
              flex: 1,
              width: "95%",
              height: 500,
              borderRadius: 10,
              marginBottom: 26,
            }}
            initialRegion={initialRegion}
            showsPointsOfInterest={false}
            customMapStyle={customMapStyle}
          >
            <Marker coordinate={marker1} title="Marker 1">
              <Image
                source={require("../../../../assets/Marker.png")}
                style={{
                  transform: [{ rotate: "180deg" }],
                  width: SCREEN_WIDTH * 0.05,
                  height: SCREEN_WIDTH * 0.05,
                }}
              />
            </Marker>
            <Marker coordinate={marker2} title="Marker 2">
              <Image
                source={require("../../../../assets/Marker.png")}
                style={{
                  transform: [{ rotate: "180deg" }],
                  width: SCREEN_WIDTH * 0.05,
                  height: SCREEN_WIDTH * 0.05,
                }}
              />
            </Marker>
            <Polyline
              coordinates={routeCoordinates}
              strokeWidth={3}
              strokeColors={["rgb(63, 169, 245)", "rgb(142, 6, 253)"]}
            />
          </MapView>
          <Button
            style={{
              flexDirection: "row",
              alignItems: "flex-start",
              justifyContent: "space-between",
            }}
            mt={26}
            onPress={() => navigation.navigate("Home")}
            text="Fazer rota"
          >
            <Icon name="chevron-right" color={"rgb(255, 255, 255)"} />
          </Button>
        </View>
      </ScrollView>
    </View>
  );
}

const itemSearchStyles = StyleSheet.create({
  card: {
    width: "100%",
    flex: 1,
  },
  title: { fontSize: 30, fontWeight: "900" },
  subtitle: { fontSize: 17, fontWeight: "300" },
  description: { fontSize: 17, fontWeight: "300", marginTop: 26 },
});
