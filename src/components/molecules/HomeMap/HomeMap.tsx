import React, { useEffect, useRef, useState } from "react";
import MapView, { Marker } from "react-native-maps";
import { Image } from "expo-image";
import { styles } from "./HomeMap.style";
import {
  LocationAccuracy,
  LocationObject,
  LocationObjectCoords,
  requestForegroundPermissionsAsync,
  watchPositionAsync,
} from "expo-location";
import { customMapStyle } from "../../../styles/customMapStyle";

const HomeMap = () => {
  const [location, setLocation] = useState<LocationObjectCoords | null>(null);

  const mapViewRef = useRef<MapView>(null);

  useEffect(() => {
    const startLocationUpdates = async () => {
      if (await getLocationPermission()) {
        const subscription = await watchPositionAsync(
          {
            accuracy: LocationAccuracy.BestForNavigation,
            timeInterval: 1000,
          },
          (locationUpdate: LocationObject) => {
            setLocation(locationUpdate.coords);
            animateMapToLocation(locationUpdate.coords);
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
  return (
    <MapView
      ref={mapViewRef}
      style={styles.map}
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
            source={require("../../../../assets/MarkerCircle.png")}
            style={styles.markerImage}
          />
        </Marker>
      )}
    </MapView>
  );
};

export default HomeMap;
