import React from "react";
import { View, StyleSheet } from "react-native";
import { GestureHandlerRootView } from "react-native-gesture-handler";
import Header from "../components/molecules/Header/Header";
import { useAuth } from "../utils/AuthProvider";
import { INavigation } from "../interfaces/Navigation/INavigation";
import HomeBottomSheet from "../components/organims/HomeBottonSheet/HomeBottomSheet";
import HomeMap from "../components/molecules/HomeMap/HomeMap";

const Home = ({ navigation }: INavigation) => {
  const { isLogged } = useAuth();

  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <View style={styles.container}>
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
        <HomeMap />
        <HomeBottomSheet />
      </View>
    </GestureHandlerRootView>
  );
};

export default Home;

export const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    position: "relative",
  },
});
