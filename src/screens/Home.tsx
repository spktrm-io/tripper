import React, { useEffect, useState, useRef, useCallback } from "react";
import {
  StatusBar,
  View,
  Dimensions,
  TextInput,
  Keyboard,
  TouchableWithoutFeedback,
} from "react-native";
import MapView, { Marker } from "react-native-maps";
import {
  LocationAccuracy,
  requestForegroundPermissionsAsync,
  watchPositionAsync,
  LocationObjectCoords,
  LocationObject,
} from "expo-location";
import BottomSheet from "../components/organims/BottomSheet/BottomSheet";
import { FlatList, GestureHandlerRootView } from "react-native-gesture-handler";
import Button from "../components/atoms/Button/Button";
import { ParamListBase, useNavigation } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";
import CardItemBottomSheet from "../components/organims/BottomSheet/CardItemBottomSheet";
import Header from "../components/molecules/Header/Header";
import { Image } from "expo-image";
import { useAuth } from "../utils/AuthProvider";
import { IBottomSheetRefProps } from "../interfaces/BottomSheet/IBottomSheetRefProps";

const { width: SCREEN_WIDTH, height: SCREEN_HEIGHT } = Dimensions.get("window");

const customMapStyle = [
  {
    featureType: "poi",
    elementType: "labels",
    stylers: [{ visibility: "off" }],
  },
];

const data = [
  {
    id: "1",
    name: "Restaurante Italiano",
    address: "123 Rua da Itália, Cidade, País",
  },
  {
    id: "2",
    name: "Café aconchegante",
    address: "456 Rua do Café, Cidade, País",
  },
  {
    id: "3",
    name: "Parque Central",
    address: "789 Avenida do Parque, Cidade, País",
  },
  {
    id: "4",
    name: "Museu de Arte Moderna",
    address: "101 Avenida da Arte, Cidade, País",
  },
  {
    id: "5",
    name: "Praia Ensolarada",
    address: "500 Praia Avenue, Cidade, País",
  },
];

const Home: React.FC = () => {
  const [location, setLocation] = useState<LocationObjectCoords | null>(null);
  const [search, setSearch] = useState<string>("");

  const mapViewRef = useRef<MapView>(null);
  const ref = useRef<IBottomSheetRefProps>(null);

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

  const onPress = useCallback(() => {
    ref?.current?.setIsSearched(true);
    ref?.current?.scrollTo(-SCREEN_HEIGHT + 170);
  }, []);

  const onPressExit = useCallback(() => {
    Keyboard.dismiss();
    setSearch("");

    ref?.current?.setIsSearched(false);
    const isActive = ref?.current?.isActive();
    if (isActive) ref?.current?.scrollTo(0);
  }, []);

  const navigation = useNavigation<StackNavigationProp<ParamListBase>>();

  const { isLogged } = useAuth();

  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <View
        style={{
          flex: 1,
          justifyContent: "center",
          alignItems: "center",
          position: "relative",
        }}
      >
        <StatusBar barStyle="dark-content" />
        <Header
          leftButtonProps={{
            icon: "road",
            navigation: () => navigation.navigate("Roads"),
          }}
          rightButtonProps={{
            icon: "bars",
            navigation: async () => {
              isLogged
                ? navigation.navigate("Profile")
                : navigation.navigate("Login");
            },
          }}
        />
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
                source={require("../../assets/MarkerCircle.png")}
                style={{
                  width: SCREEN_WIDTH * 0.07,
                  height: SCREEN_WIDTH * 0.07,
                }}
              />
            </Marker>
          )}
        </MapView>

        <BottomSheet ref={ref}>
          <TouchableWithoutFeedback onPress={() => Keyboard.dismiss()}>
            <View style={{ flex: 1, backgroundColor: "#ffffff" }}>
              <View
                style={{
                  flexDirection: "row",
                  height: 90,
                  width: "100%",
                  alignItems: "flex-start",
                  justifyContent: "center",
                  gap: 10,
                }}
              >
                <Button
                  height={50}
                  width={50}
                  icon={"chevron-left"}
                  secondary
                  rounded
                  onPress={onPressExit}
                />
                <TextInput
                  style={{
                    width: "80%",
                    height: 50,
                    borderRadius: 100,
                    padding: 15,
                    backgroundColor: "rgb(232, 232, 232)",
                  }}
                  placeholder="Pra onde deseja viajar?"
                  onFocus={onPress}
                  onChangeText={(text) => setSearch(text)}
                  value={search}
                />
              </View>

              <FlatList
                data={data}
                renderItem={CardItemBottomSheet}
                keyExtractor={(item) => item.id}
              />
            </View>
          </TouchableWithoutFeedback>
        </BottomSheet>
      </View>
    </GestureHandlerRootView>
  );
};

export default Home;
