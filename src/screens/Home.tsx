import React, { useEffect, useState, useRef } from "react";
import {
  Keyboard,
  StatusBar,
  TouchableWithoutFeedback,
  View,
  Text,
  Image,
  StyleSheet,
} from "react-native";
import MapView, { Marker } from "react-native-maps";
import {
  LocationAccuracy,
  LocationObjectCoords,
  requestForegroundPermissionsAsync,
  watchPositionAsync,
} from "expo-location";
import { Dimensions } from "react-native";
import SearchBar from "../components/SearchBar";

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  mapView: {
    flex: 1,
    width: "100%",
  },
  markerImage: {
    width: Dimensions.get("window").width * 0.1,
    height: Dimensions.get("window").width * 0.1,
  },
});

const customMapStyle = [
  {
    featureType: "poi",
    elementType: "labels",
    stylers: [{ visibility: "off" }],
  },
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
    <View style={styles.container}>
      <StatusBar barStyle="dark-content" />
      <MapView
        ref={mapViewRef}
        style={styles.mapView}
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
              source={require("../../assets/Marker.png")}
              style={styles.markerImage}
            />
          </Marker>
        )}
      </MapView>

      <SearchBar />
    </View>
  );
};

export default Home;
