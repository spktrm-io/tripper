import React, { useEffect, useState, useRef } from "react";
import { Keyboard, StatusBar, TouchableWithoutFeedback } from "react-native";
import styled from "styled-components/native";
import MapView, { Marker } from "react-native-maps";
import {
  LocationAccuracy,
  LocationObjectCoords,
  requestForegroundPermissionsAsync,
  watchPositionAsync,
} from "expo-location";
import { Image, Dimensions } from "react-native"; // Importe Image e Dimensions
import CustomMarkerImage from "../../assets/Marker.png";
import SearchBar from "../components/SearchBar";

const Container = styled.View`
  flex: 1;
`;

const customMapStyle = [
  {
    featureType: "poi",
    elementType: "labels",
    stylers: [{ visibility: "off" }], // Oculta os rótulos de pontos de interesse
  },
  // Outras personalizações
];

const Home = () => {
  const [location, setLocation] = useState<LocationObjectCoords | null>(null);
  const mapViewRef = useRef<MapView>(null);

  useEffect(() => {
    let isMounted = true;

    const startLocationUpdates = async () => {
      if (await getLocationPermission()) {
        const subscription = await watchPositionAsync(
          {
            accuracy: LocationAccuracy.BestForNavigation,
            timeInterval: 1000,
          },
          (locationUpdate) => {
            if (isMounted) {
              setLocation(locationUpdate.coords);

              const { latitude, longitude } = locationUpdate.coords;
              mapViewRef?.current?.animateToRegion({
                latitude,
                longitude,
                latitudeDelta: 0.01,
                longitudeDelta: 0.01,
              });
            }
          }
        );

        return () => {
          if (subscription) {
            subscription.remove();
          }
        };
      }
    };

    startLocationUpdates();

    return () => {
      isMounted = false;
    };
  }, []);

  const getLocationPermission = async () => {
    const { status } = await requestForegroundPermissionsAsync();
    return status === "granted";
  };

  return (
    <Container>
      <StatusBar barStyle="dark-content" />
      <MapView
        ref={mapViewRef}
        style={{ flex: 1, width: "100%" }}
        initialRegion={{
          latitude: location?.latitude || 0,
          longitude: location?.longitude || 0,
          latitudeDelta: 0.0922,
          longitudeDelta: 0.0421,
        }}
        showsPointsOfInterest={false}
        customMapStyle={customMapStyle}
      >
        {location && (
          <Marker
            coordinate={{
              latitude: location.latitude,
              longitude: location.longitude,
            }}
            title="Sua Localização"
          >
            <Image
              source={CustomMarkerImage}
              style={{
                width: Dimensions.get("window").width * 0.1, // Defina o tamanho desejado
                height: Dimensions.get("window").width * 0.1, // Defina o tamanho desejado
              }}
            />
          </Marker>
        )}
      </MapView>

      {/* <SearchBar /> */}
    </Container>
  );
};

export default Home;
