import React, { useEffect, useState, useRef, useCallback } from "react";
import {
  StatusBar,
  View,
  Image,
  StyleSheet,
  Dimensions,
  TouchableOpacity,
} from "react-native";
import MapView, { Marker } from "react-native-maps";
import {
  LocationAccuracy,
  requestForegroundPermissionsAsync,
  watchPositionAsync,
  LocationObjectCoords,
  LocationObject,
} from "expo-location";
import BottomSheet, { BottomSheetRefProps } from "../components/BottomSheet";
import { GestureHandlerRootView } from "react-native-gesture-handler";

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  mapView: {
    flex: 1,
    width: "100%",
  },
  markerImage: {
    width: Dimensions.get("window").width * 0.1,
    height: Dimensions.get("window").width * 0.1,
  },
  button: {
    height: 50,
    borderRadius: 25,
    aspectRatio: 1,
    backgroundColor: "red",
    opacity: 0.6,
  },
});

const customMapStyle = [
  {
    featureType: "poi",
    elementType: "labels",
    stylers: [{ visibility: "off" }],
  },
];

const Home: React.FC = () => {
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
          (locationUpdate: LocationObject) => {
            if (isMounted) {
              setLocation(locationUpdate.coords);
              animateMapToLocation(locationUpdate.coords);
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

  const getLocationPermission = async (): Promise<boolean> => {
    const { status } = await requestForegroundPermissionsAsync();
    return status === "granted";
  };

  const animateMapToLocation = (coords: {
    latitude: number;
    longitude: number;
  }) => {
    if (mapViewRef.current) {
      const { latitude, longitude } = coords;
      mapViewRef.current.animateToRegion({
        latitude,
        longitude,
        latitudeDelta: 0.01,
        longitudeDelta: 0.01,
      });
    }
  };

  const ref = useRef<BottomSheetRefProps>(null);

  const onPress = useCallback(() => {
    const isActive = ref?.current?.isActive();
    if (isActive) {
      ref?.current?.scrollTo(0);
    } else {
      ref?.current?.scrollTo(-200);
    }
  }, []);

  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <View style={styles.container}>
        <StatusBar barStyle="dark-content" />
        {/* <MapView
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
        </MapView> */}
        <TouchableOpacity style={styles.button} onPress={onPress} />
        <BottomSheet ref={ref}>
          <View style={{ flex: 1, backgroundColor: "orange" }}></View>
        </BottomSheet>
      </View>
    </GestureHandlerRootView>
  );
};

export default Home;
